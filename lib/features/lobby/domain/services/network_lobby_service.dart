import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:offline_ludo/core/network/models/packet.dart';
import 'package:offline_ludo/features/game/domain/models/player.dart';
import 'package:offline_ludo/core/network/transport/websocket_transport.dart';
import 'package:offline_ludo/features/game/domain/engine/host_game_engine.dart';
import 'package:offline_ludo/features/lobby/domain/models/lobby.dart';
import 'package:offline_ludo/features/lobby/domain/models/room.dart';
import 'package:offline_ludo/features/lobby/domain/services/lobby_service.dart';
import 'package:offline_ludo/features/lobby/presentation/providers/lobby_provider.dart';
import 'package:offline_ludo/features/network/domain/client_network_manager.dart';
import 'package:offline_ludo/features/network/domain/host_server_manager.dart';
import 'package:web_socket_channel/io.dart';

final clientNetworkManagerProvider = Provider<ClientNetworkManager>((ref) {
  final manager = ClientNetworkManager();
  ref.onDispose(() => manager.dispose());
  return manager;
});

final hostServerManagerProvider = Provider<HostServerManager>((ref) {
  final server = HostServerManager();
  ref.onDispose(() => server.stop());
  return server;
});

class NetworkLobbyService implements LobbyService {
  final Ref _ref;
  StreamSubscription? _packetSub;

  NetworkLobbyService(this._ref) {
    // Listen to packets globally to update the lobby
    _packetSub = _ref.read(clientNetworkManagerProvider).incomingPackets.listen((packet) {
      packet.payload.mapOrNull(
        gameStateSnapshot: (p) {
          final type = p.state['type'];
          if (type == 'lobby') {
            final playersJson = p.state['players'] as List<dynamic>;
            final players = playersJson.map((json) => Player.fromJson(json as Map<String, dynamic>)).toList();
            
            final currentLobby = _ref.read(lobbyStateProvider);
            if (currentLobby != null) {
              _ref.read(lobbyStateProvider.notifier).updateLobby(currentLobby.copyWith(players: players));
            } else {
              // Create a dummy lobby if missing, normally room details would be sent too
              final room = Room(id: 'dummy', hostIp: '', port: 5555, name: 'Lobby', code: '', currentPlayers: players.length);
              _ref.read(lobbyStateProvider.notifier).updateLobby(Lobby(room: room, players: players));
            }
          }
        },
      );
    });
  }

  void dispose() {
    _packetSub?.cancel();
  }

  Future<String> _getLocalIp() async {
    try {
      for (var interface in await NetworkInterface.list()) {
        for (var addr in interface.addresses) {
          if (addr.type == InternetAddressType.IPv4 && !addr.isLoopback) {
            return addr.address;
          }
        }
      }
    } catch (e) {
      // Ignore
    }
    return '127.0.0.1';
  }

  @override
  Future<void> createRoom(String playerName) async {
    final server = _ref.read(hostServerManagerProvider);
    await server.start();
    
    // Start host game engine
    _ref.read(hostGameEngineProvider).attach(server);

    final ip = await _getLocalIp();
    
    final roomId = DateTime.now().millisecondsSinceEpoch.toString();
    final playerId = 'host_$roomId';
    
    _ref.read(currentPlayerIdProvider.notifier).setId(playerId);
    
    // Connect to own server
    final ws = IOWebSocketChannel.connect('ws://127.0.0.1:5555');
    final transport = WebSocketTransport(ws);
    
    final client = _ref.read(clientNetworkManagerProvider);
    client.attachTransport(transport);
    client.setClientId(playerId);

    client.sendIntent(PacketPayload.joinRoom(username: playerName, version: '1.0'));
    
    // Setup initial local state manually so UI can show the lobby
    final room = Room(
      id: roomId,
      hostIp: ip,
      port: 5555,
      name: "$playerName's Room",
      code: ip, // Use IP as code
      currentPlayers: 1,
    );
    final lobby = Lobby(room: room, players: []);
    _ref.read(lobbyStateProvider.notifier).updateLobby(lobby);
  }

  @override
  Future<void> joinRoom(String roomCode, String playerName) async {
    // Connect to host
    final ws = IOWebSocketChannel.connect('ws://$roomCode:5555');
    final transport = WebSocketTransport(ws);

    final clientId = 'client_${DateTime.now().millisecondsSinceEpoch}';
    _ref.read(currentPlayerIdProvider.notifier).setId(clientId);

    final client = _ref.read(clientNetworkManagerProvider);
    client.attachTransport(transport);
    client.setClientId(clientId);

    client.sendIntent(PacketPayload.joinRoom(username: playerName, version: '1.0'));
  }

  @override
  Future<void> toggleReady() async {
    final client = _ref.read(clientNetworkManagerProvider);
    final myId = _ref.read(currentPlayerIdProvider);
    final lobby = _ref.read(lobbyStateProvider);
    
    if (myId == null || lobby == null) return;
    
    final myPlayer = lobby.players.where((p) => p.id == myId).firstOrNull;
    if (myPlayer != null) {
      client.sendIntent(PacketPayload.ready(isReady: !myPlayer.isReady));
    }
  }

  @override
  Future<void> leaveRoom() async {
    final client = _ref.read(clientNetworkManagerProvider);
    client.disconnect();
    
    final server = _ref.read(hostServerManagerProvider);
    await server.stop();

    _ref.read(lobbyStateProvider.notifier).updateLobby(null);
  }

  @override
  Future<void> startGame() async {
    final server = _ref.read(hostServerManagerProvider);
    final lobby = _ref.read(lobbyStateProvider);
    if (lobby != null && lobby.players.isNotEmpty) {
      server.broadcast(PacketPayload.startGame(firstTurnClientId: lobby.players.first.id));
    }
  }
}
