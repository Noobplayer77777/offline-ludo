import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:offline_ludo/features/lobby/domain/models/lobby.dart';
import 'package:offline_ludo/features/lobby/domain/services/lobby_service.dart';
import 'package:offline_ludo/features/lobby/domain/services/network_lobby_service.dart';
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
  final service = NetworkLobbyService(ref);
  ref.onDispose(() => service.dispose());
  return service;
});
