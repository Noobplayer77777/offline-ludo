import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:offline_ludo/features/game/domain/models/player.dart';
import 'package:offline_ludo/features/lobby/domain/models/lobby.dart';
import 'package:offline_ludo/features/lobby/domain/models/room.dart';
import 'package:offline_ludo/features/lobby/domain/services/lobby_service.dart';

final lobbyStateProvider = NotifierProvider<LobbyNotifier, Lobby?>(() {
  return LobbyNotifier();
});

class LobbyNotifier extends Notifier<Lobby?> {
  @override
  Lobby? build() => null;

  void updateLobby(Lobby? newLobby) {
    state = newLobby;
  }
}

// Current player's ID provider to distinguish "me" from others
final currentPlayerIdProvider = NotifierProvider<CurrentPlayerIdNotifier, String?>(() {
  return CurrentPlayerIdNotifier();
});

class CurrentPlayerIdNotifier extends Notifier<String?> {
  @override
  String? build() => null;

  void setId(String? id) {
    state = id;
  }
}

final lobbyServiceProvider = Provider<LobbyService>((ref) {
  return MockLobbyService(ref);
});

class MockLobbyService implements LobbyService {
  final Ref ref;
  
  MockLobbyService(this.ref);

  String _generateRoomCode() {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final random = Random();
    return String.fromCharCodes(Iterable.generate(
        6, (_) => chars.codeUnitAt(random.nextInt(chars.length))));
  }

  @override
  Future<void> createRoom(String playerName) async {
    // Simulate network delay
    await Future<void>.delayed(const Duration(milliseconds: 500));

    final roomId = DateTime.now().millisecondsSinceEpoch.toString();
    final playerId = 'host_$roomId';
    
    // Set my player ID
    ref.read(currentPlayerIdProvider.notifier).setId(playerId);

    final room = Room(
      id: roomId,
      hostIp: '127.0.0.1',
      port: 8080,
      name: "$playerName's Room",
      code: _generateRoomCode(),
      currentPlayers: 1,
    );

    final hostPlayer = Player(
      id: playerId,
      name: playerName,
      color: PlayerColor.green, // Host is always Green
      isReady: true, // Host is always ready
    );

    final lobby = Lobby(
      room: room,
      players: [hostPlayer],
    );

    ref.read(lobbyStateProvider.notifier).updateLobby(lobby);
  }

  @override
  Future<void> joinRoom(String roomCode, String playerName) async {
    // Simulate network delay
    await Future<void>.delayed(const Duration(milliseconds: 500));

    final currentLobby = ref.read(lobbyStateProvider);
    
    // In mock mode, we assume the room is the one we created or we just fake joining one.
    // Since it's a single app instance for now, joining only works if the app ALREADY created a room (which makes no sense).
    // Let's fake joining a remote room if it doesn't exist.
    final Lobby lobby = currentLobby ?? Lobby(
      room: Room(
        id: 'remote_room',
        hostIp: '192.168.1.100',
        port: 8080,
        name: "Remote Room",
        code: roomCode,
        currentPlayers: 1,
      ),
      players: [
        const Player(id: 'remote_host', name: 'Host', color: PlayerColor.green, isReady: true),
      ]
    );

    if (lobby.players.length >= lobby.room.maxPlayers) {
      throw Exception('Room is full');
    }

    final playerId = 'client_${DateTime.now().millisecondsSinceEpoch}';
    ref.read(currentPlayerIdProvider.notifier).setId(playerId);

    // Assign an unused color
    final usedColors = lobby.players.map((p) => p.color).toSet();
    final availableColors = PlayerColor.values.where((c) => !usedColors.contains(c)).toList();
    
    final newPlayer = Player(
      id: playerId,
      name: playerName,
      color: availableColors.first,
      isReady: false,
    );

    final updatedLobby = lobby.copyWith(
      players: [...lobby.players, newPlayer],
      room: lobby.room.copyWith(currentPlayers: lobby.players.length + 1),
    );

    ref.read(lobbyStateProvider.notifier).updateLobby(updatedLobby);
  }

  @override
  Future<void> toggleReady() async {
    final currentLobby = ref.read(lobbyStateProvider);
    if (currentLobby == null) return;

    final myId = ref.read(currentPlayerIdProvider);
    final updatedPlayers = currentLobby.players.map((p) {
      if (p.id == myId) {
        return p.copyWith(isReady: !p.isReady);
      }
      return p;
    }).toList();

    ref.read(lobbyStateProvider.notifier).updateLobby(currentLobby.copyWith(players: updatedPlayers));
  }

  @override
  Future<void> leaveRoom() async {
    final currentLobby = ref.read(lobbyStateProvider);
    if (currentLobby == null) return;

    final myId = ref.read(currentPlayerIdProvider);
    
    // If I am the host (first player), destroy room
    if (currentLobby.players.first.id == myId) {
      ref.read(lobbyStateProvider.notifier).updateLobby(null);
      ref.read(currentPlayerIdProvider.notifier).setId(null);
      return;
    }

    // Otherwise just remove me
    final updatedPlayers = currentLobby.players.where((p) => p.id != myId).toList();
    ref.read(lobbyStateProvider.notifier).updateLobby(currentLobby.copyWith(
      players: updatedPlayers,
      room: currentLobby.room.copyWith(currentPlayers: updatedPlayers.length),
    ));
    ref.read(currentPlayerIdProvider.notifier).setId(null);
  }

  @override
  Future<void> startGame() async {
    final currentLobby = ref.read(lobbyStateProvider);
    if (currentLobby == null) return;

    // Verify all players are ready
    if (!currentLobby.players.every((p) => p.isReady)) {
      throw Exception('Not all players are ready');
    }

    if (currentLobby.players.length < 2) {
      throw Exception('Need at least 2 players');
    }

    ref.read(lobbyStateProvider.notifier).updateLobby(currentLobby.copyWith(isStarting: true));
  }
}
