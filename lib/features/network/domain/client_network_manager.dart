import 'dart:async';
import 'dart:convert';
import 'package:offline_ludo/core/network/models/packet.dart';
import 'package:offline_ludo/core/network/reliability/packet_queue.dart';
import 'package:offline_ludo/core/network/transport/network_transport.dart';

enum NetworkState { disconnected, connecting, connected, reconnecting }

class ClientNetworkManager {
  NetworkTransport? _transport;
  final PacketQueue _queue = PacketQueue();
  
  final _stateController = StreamController<NetworkState>.broadcast();
  final _packetController = StreamController<Packet>.broadcast();
  
  NetworkState _currentState = NetworkState.disconnected;
  String? _clientId;
  String? _sessionToken;

  Stream<NetworkState> get stateStream => _stateController.stream;
  Stream<Packet> get incomingPackets => _packetController.stream;
  NetworkState get state => _currentState;
  String? get sessionToken => _sessionToken;

  StreamSubscription<String>? _incomingSub;
  StreamSubscription<String>? _disconnectSub;

  /// Attaches a new transport (e.g., after a reconnect).
  void attachTransport(NetworkTransport transport) {
    _transport?.disconnect();
    _transport = transport;
    
    _incomingSub?.cancel();
    _disconnectSub?.cancel();
    
    _incomingSub = _transport!.incomingMessages.listen(_handleIncomingMessage);
    _disconnectSub = _transport!.onDisconnect.listen((reason) {
      _setState(NetworkState.disconnected);
    });

    _setState(NetworkState.connected);
    
    // Flush any pending intents that were queued while disconnected.
    _flushQueue();
  }

  void _handleIncomingMessage(String message) {
    try {
      final json = jsonDecode(message) as Map<String, dynamic>;
      final packet = Packet.fromJson(json);
      
      // Auto-respond to pings at the network layer to avoid UI lag dependencies
      packet.payload.mapOrNull(
        ping: (_) {
          sendIntent(const PacketPayload.pong());
        },
        reconnect: (payload) {
          _sessionToken = payload.sessionToken;
        }
      );
      
      _packetController.add(packet);
    } catch (e) {
      // Ignore malformed packets at this layer
    }
  }

  /// Required before sending intents.
  void setClientId(String clientId) {
    _clientId = clientId;
  }

  /// Sends an intent to the server. If offline, it buffers in the PacketQueue.
  void sendIntent(PacketPayload payload) {
    if (_clientId == null) return;
    
    // Buffer the packet
    final packet = _queue.enqueue(payload, _clientId!);
    
    if (_currentState == NetworkState.connected && _transport != null) {
      // If we are connected, try sending immediately
      try {
        _transport!.sendMessage(jsonEncode(packet.toJson()));
        // Once sent to socket, we can consider it flushed
        _queue.flush(); 
      } catch (e) {
        // If send fails, the connection will drop shortly, and the queue 
        // will preserve it for the next reconnect because we didn't flush it properly.
      }
    }
  }
  
  void _flushQueue() {
    if (_currentState == NetworkState.connected && _transport != null) {
      final packets = _queue.flush();
      for (final packet in packets) {
        try {
          _transport!.sendMessage(jsonEncode(packet.toJson()));
        } catch (e) {
          // In a production app, we would requeue failed packets.
        }
      }
    }
  }

  void _setState(NetworkState state) {
    if (_currentState != state) {
      _currentState = state;
      _stateController.add(state);
    }
  }

  void disconnect() {
    _transport?.disconnect();
    _setState(NetworkState.disconnected);
  }

  void dispose() {
    _incomingSub?.cancel();
    _disconnectSub?.cancel();
    _stateController.close();
    _packetController.close();
    _transport?.disconnect();
  }
}
