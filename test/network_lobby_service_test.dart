import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:offline_ludo/features/lobby/domain/services/network_lobby_service.dart';
import 'package:offline_ludo/features/network/domain/client_network_manager.dart';
import 'package:offline_ludo/features/network/domain/host_server_manager.dart';
import 'package:offline_ludo/features/game/domain/engine/host_game_engine.dart';
import 'package:offline_ludo/features/lobby/presentation/providers/lobby_provider.dart';
import 'package:offline_ludo/features/lobby/domain/models/lobby.dart';
import 'package:offline_ludo/features/lobby/domain/models/room.dart';
import 'package:offline_ludo/core/network/models/packet.dart';
import 'package:offline_ludo/features/game/domain/models/player.dart';
import 'dart:async';

class MockClientNetworkManager extends Mock implements ClientNetworkManager {}
class MockHostServerManager extends Mock implements HostServerManager {}
class MockHostGameEngine extends Mock implements HostGameEngine {}
void main() {
  setUpAll(() {
    registerFallbackValue(const PacketPayload.joinRoom(username: 'test', version: '1.0'));
    registerFallbackValue((PacketPayload p) {});
  });

  group('NetworkLobbyService Tests', () {
    late ProviderContainer container;
    late MockClientNetworkManager mockClient;
    late MockHostServerManager mockHost;
    late MockHostGameEngine mockEngine;

    setUp(() {
      mockClient = MockClientNetworkManager();
      mockHost = MockHostServerManager();
      mockEngine = MockHostGameEngine();

      when(() => mockClient.incomingPackets).thenAnswer((_) => const Stream.empty());
      when(() => mockClient.dispose()).thenReturn(null);
      when(() => mockHost.stop()).thenAnswer((_) async {});
      when(() => mockHost.start()).thenAnswer((_) async {});
      when(() => mockHost.broadcast(any())).thenReturn(null);

      container = ProviderContainer(
        overrides: [
          clientNetworkManagerProvider.overrideWithValue(mockClient),
          hostServerManagerProvider.overrideWithValue(mockHost),
          hostGameEngineProvider.overrideWithValue(mockEngine),
        ],
      );
    });

    tearDown(() {
      container.dispose();
    });

    test('leaveRoom stops server and disconnects client', () async {
      final service = container.read(lobbyServiceProvider);
      await service.leaveRoom();
      
      verify(() => mockClient.disconnect()).called(1);
      verify(() => mockHost.stop()).called(1);
      
      expect(container.read(lobbyStateProvider), isNull);
    });
    
    test('startGame broadcasts startGame packet if lobby has players', () async {
      const room = Room(id: '1', hostIp: '127.0.0.1', port: 5555, name: 'Room', code: 'CODE', currentPlayers: 1);
      const player = Player(id: 'p1', name: 'Player', color: PlayerColor.red, isReady: true);
      const lobby = Lobby(room: room, players: [player]);
      
      container.read(lobbyStateProvider.notifier).updateLobby(lobby);
      
      when(() => mockClient.sendIntent(any())).thenReturn(null);
      
      final service = container.read(lobbyServiceProvider);
      await service.startGame();
      
      verify(() => mockClient.sendIntent(const PacketPayload.startGame(firstTurnClientId: 'p1'))).called(1);
    });

    test('toggleReady sends intent if player exists', () async {
      const room = Room(id: '1', hostIp: '127.0.0.1', port: 5555, name: 'Room', code: 'CODE', currentPlayers: 1);
      const player = Player(id: 'p1', name: 'Player', color: PlayerColor.red, isReady: false);
      const lobby = Lobby(room: room, players: [player]);
      
      container.read(lobbyStateProvider.notifier).updateLobby(lobby);
      container.read(currentPlayerIdProvider.notifier).setId('p1');
      
      when(() => mockClient.sendIntent(any())).thenReturn(null);
      
      final service = container.read(lobbyServiceProvider);
      await service.toggleReady();
      
      verify(() => mockClient.sendIntent(const PacketPayload.ready(isReady: true))).called(1);
    });
  });
}
