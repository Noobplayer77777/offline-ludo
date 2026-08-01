import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:offline_ludo/core/network/models/packet.dart';
import 'package:offline_ludo/features/game/domain/engine/rule_engine.dart';
import 'package:offline_ludo/features/game/domain/models/game_state.dart';
import 'package:offline_ludo/features/game/domain/models/player.dart';
import 'package:offline_ludo/features/game/domain/models/token.dart';
import 'package:offline_ludo/features/game/domain/models/dice.dart';
import 'package:offline_ludo/features/game/domain/models/board_path.dart';
import 'package:offline_ludo/features/game/domain/models/move.dart';
import 'package:offline_ludo/features/network/domain/host_server_manager.dart';
import 'package:offline_ludo/features/lobby/domain/services/network_lobby_service.dart';

final hostGameEngineProvider = Provider<HostGameEngine>((ref) {
  final serverManager = ref.watch(hostServerManagerProvider);
  final engine = HostGameEngine(serverManager);
  ref.onDispose(() => engine.dispose());
  return engine;
});

class HostGameEngine {
  HostServerManager? _server;
  StreamSubscription<Packet>? _packetSub;

  GameState? _gameState;
  final Map<String, Player> _lobbyPlayers = {}; // Track lobby players until game starts

  HostGameEngine(this._server) {
    _packetSub = _server?.incomingPackets.listen(_handlePacket);
  }

  void dispose() {
    _packetSub?.cancel();
  }

  void attach(HostServerManager server) {
    _server = server;
    _packetSub?.cancel();
    _packetSub = _server!.incomingPackets.listen(_handlePacket);
    _lobbyPlayers.clear();
    _gameState = null;
  }

  void _handlePacket(Packet packet) {
    packet.payload.mapOrNull(
      joinRoom: (p) {
        _lobbyPlayers[packet.clientId] = Player(
          id: packet.clientId,
          name: p.username,
          color: _assignColor(),
          isReady: _lobbyPlayers.isEmpty, // First player is host, automatically ready
        );
        _broadcastLobbySnapshot();
      },
      ready: (p) {
        final player = _lobbyPlayers[packet.clientId];
        if (player != null) {
          _lobbyPlayers[packet.clientId] = player.copyWith(isReady: p.isReady);
          _broadcastLobbySnapshot();
        }
      },
      kickPlayer: (p) {
        if (packet.clientId.startsWith('host_')) {
          _lobbyPlayers.remove(p.targetClientId);
          _server?.disconnectClient(p.targetClientId);
          _broadcastLobbySnapshot();
        }
      },
      startGame: (p) {
        _startGame(p.firstTurnClientId);
      },
      rollDice: (p) {
        _handleRollDice(packet.clientId);
      },
      moveToken: (p) {
        _handleMoveToken(packet.clientId, p.tokenId);
      },
      ack: (p) {
        _handleAck(packet.clientId, p.ackType, p.eventId);
      }
    );
  }

  PlayerColor _assignColor() {
    final usedColors = _lobbyPlayers.values.map((p) => p.color).toSet();
    for (final color in PlayerColor.values) {
      if (!usedColors.contains(color)) return color;
    }
    return PlayerColor.red; // Fallback
  }

  void _broadcastLobbySnapshot() {
    if (_server == null) return;
    
    // Create a temporary JSON representation of the lobby
    final playersJson = _lobbyPlayers.values.map((p) => p.toJson()).toList();
    
    _server!.broadcast(PacketPayload.gameStateSnapshot(state: {
      'type': 'lobby',
      'players': playersJson,
    }));
  }

  void _startGame(String firstTurnClientId) {
    if (_lobbyPlayers.length < 2) return; // Need at least 2 players
    
    // Create initial state
    final List<Token> tokens = [];
    for (var p in _lobbyPlayers.values) {
      for (int i = 0; i < 4; i++) {
        tokens.add(Token(id: '${p.id}_token_$i', ownerId: p.id, position: -1)); // -1 means home
      }
    }
    
    _gameState = GameState(
      roomId: 'room',
      players: _lobbyPlayers.values.toList(),
      tokens: tokens,
      currentDice: const Dice(value: 1, isRolling: false),
      phase: GamePhase.playing,
      boardPath: BoardPath.standard(),
      activePlayerId: firstTurnClientId,
    );

    _server?.broadcast(PacketPayload.gameStateSnapshot(state: {
      'type': 'game',
      'gameState': _gameState!.toJson(),
    }));
  }

  void _handleRollDice(String clientId) {
    if (_gameState == null) return;
    if (!RuleEngine.canRollDice(_gameState!, clientId)) return;
    
    try {
      final int diceValue = 1 + (DateTime.now().millisecondsSinceEpoch % 6); // Random 1-6
      final newState = RuleEngine.executeRoll(_gameState!, diceValue);
      _gameState = newState;
      
      _server?.broadcast(PacketPayload.diceResult(value: diceValue, rollerId: clientId));
      
      _server?.broadcast(PacketPayload.gameStateSnapshot(state: {
        'type': 'game',
        'gameState': _gameState!.toJson(),
      }));
    } catch (e) {
      // Ignore
    }
  }

  void _handleMoveToken(String clientId, String tokenId) {
    if (_gameState == null) return;
    
    try {
      final token = _gameState!.tokens.firstWhere((t) => t.id == tokenId);
      if (token.ownerId != clientId) return;
      if (!RuleEngine.canMoveToken(token, _gameState!.currentDice.value)) return;
      
      final int diceValue = _gameState!.currentDice.value;
      final int newPosition = token.position == -1 ? 0 : token.position + diceValue;
      
      final move = Move(
        playerId: clientId,
        tokenId: tokenId,
        fromPosition: token.position,
        toPosition: newPosition,
      );

      final newState = RuleEngine.executeMove(_gameState!, move);
      _gameState = newState;
      
      _server?.broadcast(PacketPayload.moveTokenEvent(tokenId: tokenId, path: [])); // Empty path for now
      
      _server?.broadcast(PacketPayload.gameStateSnapshot(state: {
        'type': 'game',
        'gameState': _gameState!.toJson(),
      }));
    } catch (e) {
      // Ignore
    }
  }

  void _handleAck(String clientId, String ackType, int eventId) {
    // Todo: Implement robust animation syncing. 
    // For now, moves execute instantly and State snapshots keep everyone synchronized.
  }
}
