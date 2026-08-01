import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:offline_ludo/features/lobby/presentation/lobby_screen.dart';
import 'package:offline_ludo/features/lobby/domain/models/lobby.dart';
import 'package:offline_ludo/features/lobby/domain/models/room.dart';
import 'package:offline_ludo/features/game/domain/models/player.dart';
import 'package:offline_ludo/features/lobby/presentation/providers/lobby_provider.dart';
import 'package:offline_ludo/features/game/presentation/providers/game_provider.dart';
import 'package:offline_ludo/features/lobby/domain/services/lobby_service.dart';
import 'package:offline_ludo/features/game/domain/models/game_state.dart';
import 'package:go_router/go_router.dart';

class MockLobbyService extends Mock implements LobbyService {}

class TestLobbyNotifier extends LobbyNotifier {
  Lobby? _state;
  TestLobbyNotifier(this._state);

  @override
  Lobby? build() => _state;

  @override
  void updateLobby(Lobby? newLobby) {
    state = newLobby;
  }
}

class TestCurrentPlayerIdNotifier extends CurrentPlayerIdNotifier {
  String? _state;
  TestCurrentPlayerIdNotifier(this._state);

  @override
  String? build() => _state;

  @override
  void setId(String? id) {
    state = id;
  }
}

class TestGameStateNotifier extends GameStateNotifier {
  @override
  GameState? build() => null;
  
  @override
  void rollDice() {}
  
  @override
  void moveToken(String tokenId) {}
}

void main() {
  late MockLobbyService mockLobbyService;

  setUp(() {
    mockLobbyService = MockLobbyService();
  });

  Widget createWidgetUnderTest({
    required Lobby? initialLobby,
    required String? initialPlayerId,
  }) {
    final router = GoRouter(
      routes: [
        GoRoute(path: '/', builder: (context, state) => const Scaffold(body: Text('Home'))),
        GoRoute(path: '/lobby', builder: (context, state) => const LobbyScreen()),
      ],
      initialLocation: '/lobby',
    );

    return ProviderScope(
      overrides: [
        lobbyServiceProvider.overrideWithValue(mockLobbyService),
        lobbyStateProvider.overrideWith(() => TestLobbyNotifier(initialLobby)),
        currentPlayerIdProvider.overrideWith(() => TestCurrentPlayerIdNotifier(initialPlayerId)),
        gameStateProvider.overrideWith(() => TestGameStateNotifier()),
      ],
      child: MaterialApp.router(
        routerConfig: router,
      ),
    );
  }

  testWidgets('LobbyScreen displays CircularProgressIndicator if lobby is null', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest(
      initialLobby: null,
      initialPlayerId: 'player1',
    ));
    
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    await tester.pumpAndSettle();
  });

  testWidgets('LobbyScreen renders correctly for host', (WidgetTester tester) async {
    final player1 = Player(id: 'player1', name: 'Alice', color: PlayerColor.red, isReady: true);
    final player2 = Player(id: 'player2', name: 'Bob', color: PlayerColor.blue, isReady: false);
    
    final lobby = Lobby(
      room: const Room(id: 'r1', name: 'My Room', code: 'ABCD', hostIp: '127.0.0.1', port: 12345),
      players: [player1, player2],
    );

    await tester.pumpWidget(createWidgetUnderTest(
      initialLobby: lobby,
      initialPlayerId: 'player1',
    ));

    await tester.pumpAndSettle();

    expect(find.text('My Room'), findsOneWidget);
    expect(find.text('ABCD'), findsOneWidget);
    expect(find.text('Alice (You)'), findsOneWidget);
    expect(find.text('Bob'), findsOneWidget);

    // Host should see start game button (even if disabled)
    expect(find.text('Waiting for Players...'), findsOneWidget);
    expect(find.byIcon(Icons.play_arrow), findsOneWidget);
  });

  testWidgets('LobbyScreen renders correctly for client', (WidgetTester tester) async {
    final player1 = Player(id: 'player1', name: 'Alice', color: PlayerColor.red, isReady: true);
    final player2 = Player(id: 'player2', name: 'Bob', color: PlayerColor.blue, isReady: false);
    
    final lobby = Lobby(
      room: const Room(id: 'r1', name: 'My Room', code: 'ABCD', hostIp: '127.0.0.1', port: 12345),
      players: [player1, player2],
    );

    await tester.pumpWidget(createWidgetUnderTest(
      initialLobby: lobby,
      initialPlayerId: 'player2', // Not host
    ));

    await tester.pumpAndSettle();

    expect(find.text('My Room'), findsOneWidget);
    expect(find.text('Alice'), findsOneWidget);
    expect(find.text('Bob (You)'), findsOneWidget);

    // Client should see Ready Up button
    expect(find.text('Ready Up'), findsOneWidget);
    expect(find.byIcon(Icons.check), findsOneWidget);
    
    // Tap ready up
    when(() => mockLobbyService.toggleReady()).thenAnswer((_) async {});
    await tester.tap(find.text('Ready Up'));
    verify(() => mockLobbyService.toggleReady()).called(1);
  });

  testWidgets('LobbyScreen start game button enables when all ready', (WidgetTester tester) async {
    final player1 = Player(id: 'player1', name: 'Alice', color: PlayerColor.red, isReady: true);
    final player2 = Player(id: 'player2', name: 'Bob', color: PlayerColor.blue, isReady: true);
    
    final lobby = Lobby(
      room: const Room(id: 'r1', name: 'My Room', code: 'ABCD', hostIp: '127.0.0.1', port: 12345),
      players: [player1, player2],
    );

    await tester.pumpWidget(createWidgetUnderTest(
      initialLobby: lobby,
      initialPlayerId: 'player1',
    ));

    await tester.pumpAndSettle();

    expect(find.text('Start Game'), findsOneWidget);
    
    when(() => mockLobbyService.startGame()).thenAnswer((_) async {});
    await tester.tap(find.text('Start Game'));
    verify(() => mockLobbyService.startGame()).called(1);
  });

  testWidgets('LobbyScreen copies room code', (WidgetTester tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
      SystemChannels.platform,
      (MethodCall methodCall) async {
        if (methodCall.method == 'Clipboard.setData') {
          return null;
        }
        return null;
      },
    );

    final player1 = Player(id: 'player1', name: 'Alice', color: PlayerColor.red, isReady: true);
    final lobby = Lobby(
      room: const Room(id: 'r1', name: 'My Room', code: 'ABCD', hostIp: '127.0.0.1', port: 12345),
      players: [player1],
    );

    await tester.pumpWidget(createWidgetUnderTest(
      initialLobby: lobby,
      initialPlayerId: 'player1',
    ));

    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.copy));
    await tester.pumpAndSettle();

    expect(find.text('Room code copied!'), findsOneWidget);
  });
}
