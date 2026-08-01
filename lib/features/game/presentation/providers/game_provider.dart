import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:offline_ludo/features/game/domain/models/game_state.dart';
import 'package:offline_ludo/features/lobby/domain/services/network_lobby_service.dart';
import 'package:offline_ludo/core/network/models/packet.dart';

final gameStateProvider = NotifierProvider<GameStateNotifier, GameState?>(() {
  return GameStateNotifier();
});

class GameStateNotifier extends Notifier<GameState?> {
  StreamSubscription? _packetSub;

  @override
  GameState? build() {
    _packetSub = ref.watch(clientNetworkManagerProvider).incomingPackets.listen((packet) {
      packet.payload.mapOrNull(
        gameStateSnapshot: (p) {
          if (p.state['type'] == 'game') {
            final gameJson = p.state['gameState'] as Map<String, dynamic>;
            state = GameState.fromJson(gameJson);
          }
        },
        diceResult: (p) {
          // You can also handle smaller events here for animations
        },
      );
    });

    ref.onDispose(() {
      _packetSub?.cancel();
    });

    return null;
  }

  void rollDice() {
    final client = ref.read(clientNetworkManagerProvider);
    client.sendIntent(const PacketPayload.rollDice());
  }

  void moveToken(String tokenId) {
    final client = ref.read(clientNetworkManagerProvider);
    client.sendIntent(PacketPayload.moveToken(tokenId: tokenId));
  }
}
