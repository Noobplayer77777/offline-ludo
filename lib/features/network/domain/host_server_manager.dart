// ignore_for_file: prefer_initializing_formals
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:offline_ludo/core/network/models/packet.dart';
import 'package:offline_ludo/core/network/transport/network_transport.dart';
import 'package:offline_ludo/core/network/transport/websocket_transport.dart';
import 'package:web_socket_channel/io.dart';

class ConnectedClient {
  final String clientId;
  final NetworkTransport transport;
  DateTime lastPongReceived;
  final StreamSubscription<String> _sub;

  // ignore: prefer_initializing_formals
  ConnectedClient({
    required this.clientId,
    required this.transport,
    required StreamSubscription<String> sub,
  })  : lastPongReceived = DateTime.now(),
        _sub = sub;

  void dispose() {
    _sub.cancel();
    transport.disconnect();
  }
}

class HostServerManager {
  HttpServer? _server;
  final int port;
  final Map<String, ConnectedClient> _clients = {};
  
  final _packetController = StreamController<Packet>.broadcast();
  Timer? _heartbeatTimer;

  HostServerManager({this.port = 5555});

  Stream<Packet> get incomingPackets => _packetController.stream;
  
  Future<void> start() async {
    _server = await HttpServer.bind(InternetAddress.anyIPv4, port);
    
    _server!.listen((HttpRequest request) {
      if (WebSocketTransformer.isUpgradeRequest(request)) {
        WebSocketTransformer.upgrade(request).then((WebSocket ws) {
          final channel = IOWebSocketChannel(ws);
          final transport = WebSocketTransport(channel);
          _handleNewConnection(transport);
        });
      } else {
        request.response
          ..statusCode = HttpStatus.forbidden
          ..close();
      }
    });

    _startHeartbeat();
  }

  void _handleNewConnection(NetworkTransport transport) {
    // In a real implementation, we wait for a 'JoinRoom' packet first to get the clientId.
    // For now, we listen to the transport and expect the first packet to identify them.
    String? tempClientId;
    
    // ignore: cancel_subscriptions
    late StreamSubscription<String> sub;
    sub = transport.incomingMessages.listen((message) {
      try {
        final json = jsonDecode(message) as Map<String, dynamic>;
        final packet = Packet.fromJson(json);

        // If this is the first packet, register the client
        if (tempClientId == null) {
          tempClientId = packet.clientId;
          _clients[tempClientId!] = ConnectedClient(
            clientId: tempClientId!,
            transport: transport,
            sub: sub,
          );
        }

        final client = _clients[tempClientId];
        if (client != null) {
          packet.payload.maybeMap(
            pong: (_) {
              client.lastPongReceived = DateTime.now();
            },
            orElse: () {
              _packetController.add(packet);
            },
          );
        }
      } catch (e) {
        // Invalid JSON or format
      }
    }, onDone: () {
      if (tempClientId != null) {
        _clients.remove(tempClientId)?.dispose();
      }
    });
  }

  void _startHeartbeat() {
    _heartbeatTimer?.cancel();
    _heartbeatTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      final now = DateTime.now();
      final clientsToDrop = <String>[];

      for (final client in _clients.values) {
        if (now.difference(client.lastPongReceived).inSeconds > 10) {
          clientsToDrop.add(client.clientId);
        } else {
          _sendToTransport(client.transport, const PacketPayload.ping());
        }
      }

      for (final id in clientsToDrop) {
        _clients.remove(id)?.dispose();
        // Emit a simulated PlayerLeft packet so the engine knows
        _packetController.add(Packet(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          clientId: id,
          timestamp: DateTime.now(),
          sequenceId: 0,
          payload: PacketPayload.playerLeft(clientId: id, reason: 'timeout'),
        ));
      }
    });
  }

  void broadcast(PacketPayload payload) {
    final packet = Packet(
      id: '${DateTime.now().millisecondsSinceEpoch}_bcast',
      clientId: 'host', // Host always uses 'host' or its own ID
      timestamp: DateTime.now(),
      sequenceId: 0,
      payload: payload,
    );
    
    final jsonStr = jsonEncode(packet.toJson());
    for (final client in _clients.values) {
      client.transport.sendMessage(jsonStr);
    }
  }

  void sendTo(String clientId, PacketPayload payload) {
    final client = _clients[clientId];
    if (client != null) {
      _sendToTransport(client.transport, payload);
    }
  }

  void _sendToTransport(NetworkTransport transport, PacketPayload payload) {
    final packet = Packet(
      id: '${DateTime.now().millisecondsSinceEpoch}_direct',
      clientId: 'host',
      timestamp: DateTime.now(),
      sequenceId: 0,
      payload: payload,
    );
    transport.sendMessage(jsonEncode(packet.toJson()));
  }

  void disconnectClient(String clientId) {
    final client = _clients.remove(clientId);
    if (client != null) {
      // Notify the client they are kicked before closing the socket
      try {
        _sendToTransport(client.transport, PacketPayload.playerLeft(clientId: clientId, reason: 'kicked'));
      } catch (_) {}
      
      client.dispose();
      
      // Notify the host engine
      _packetController.add(Packet(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        clientId: clientId,
        timestamp: DateTime.now(),
        sequenceId: 0,
        payload: PacketPayload.playerLeft(clientId: clientId, reason: 'kicked'),
      ));
    }
  }

  Future<void> stop() async {
    _heartbeatTimer?.cancel();
    for (final client in _clients.values) {
      client.dispose();
    }
    _clients.clear();
    await _server?.close(force: true);
    await _packetController.close();
  }
}
