import 'package:flutter_test/flutter_test.dart';
import 'package:offline_ludo/features/game/domain/engine/rule_engine.dart';
import 'package:offline_ludo/features/game/domain/models/board_path.dart';
import 'package:offline_ludo/features/game/domain/models/dice.dart';
import 'package:offline_ludo/features/game/domain/models/game_state.dart';
import 'package:offline_ludo/features/game/domain/models/move.dart';
import 'package:offline_ludo/features/game/domain/models/player.dart';
import 'package:offline_ludo/features/game/domain/models/token.dart';

void main() {
  group('Rule Engine Tests', () {
    late GameState initialState;

    setUp(() {
      const p1 = Player(id: 'p1', name: 'P1', color: PlayerColor.red);
      const p2 = Player(id: 'p2', name: 'P2', color: PlayerColor.green);
      
      final tokens = [
        const Token(id: 't1', ownerId: 'p1', position: -1),
        const Token(id: 't2', ownerId: 'p1', position: -1),
        const Token(id: 't3', ownerId: 'p1', position: -1),
        const Token(id: 't4', ownerId: 'p1', position: -1),
        const Token(id: 't5', ownerId: 'p2', position: -1),
        const Token(id: 't6', ownerId: 'p2', position: -1),
        const Token(id: 't7', ownerId: 'p2', position: -1),
        const Token(id: 't8', ownerId: 'p2', position: -1),
      ];

      initialState = GameState(
        roomId: 'room1',
        players: [p1, p2],
        tokens: tokens,
        currentDice: const Dice(value: 1, isRolling: false),
        phase: GamePhase.playing,
        boardPath: BoardPath.standard(),
        activePlayerId: 'p1',
      );
    });

    test('canRollDice validation', () {
      expect(RuleEngine.canRollDice(initialState, 'p1'), true);
      expect(RuleEngine.canRollDice(initialState, 'p2'), false); // Not their turn

      final rolledState = initialState.copyWith(hasRolledDice: true);
      expect(RuleEngine.canRollDice(rolledState, 'p1'), false); // Already rolled
    });

    test('Home exit requires a 6', () {
      final token = initialState.tokens.firstWhere((t) => t.id == 't1');
      expect(RuleEngine.canMoveToken(token, 5), false);
      expect(RuleEngine.canMoveToken(token, 6), true);
    });

    test('Exact finish requirement', () {
      const token = Token(id: 't1', ownerId: 'p1', position: 55);
      expect(RuleEngine.canMoveToken(token, 2), true); // 55 + 2 = 57
      expect(RuleEngine.canMoveToken(token, 3), false); // 55 + 3 = 58 > 57
    });

    test('getValidTokensToMove excludes invalid moves', () {
      // p1 rolls a 5. Tokens are at home, so none can move.
      var validTokens = RuleEngine.getValidTokensToMove(initialState, 'p1', 5);
      expect(validTokens.isEmpty, true);

      // p1 rolls a 6. All tokens at home can move.
      validTokens = RuleEngine.getValidTokensToMove(initialState, 'p1', 6);
      expect(validTokens.length, 4);

      // Mix of tokens
      final mixedState = initialState.copyWith(tokens: const [
        Token(id: 't1', ownerId: 'p1', position: -1),
        Token(id: 't2', ownerId: 'p1', position: 55),
        Token(id: 't3', ownerId: 'p1', position: 57),
      ]);
      
      // Roll a 3
      validTokens = RuleEngine.getValidTokensToMove(mixedState, 'p1', 3);
      expect(validTokens.isEmpty, true); // t1 needs 6, t2 overshoots, t3 finished

      // Roll a 2
      validTokens = RuleEngine.getValidTokensToMove(mixedState, 'p1', 2);
      expect(validTokens.length, 1);
      expect(validTokens.first.id, 't2');
    });

    test('executeRoll transitions state correctly', () {
      // Roll a 5, no valid moves -> switch turn immediately
      var state = RuleEngine.executeRoll(initialState, 5);
      expect(state.hasRolledDice, false);
      expect(state.activePlayerId, 'p2');
      expect(state.currentDice.value, 5);

      // Roll a 6, valid moves -> wait for move
      state = RuleEngine.executeRoll(initialState, 6);
      expect(state.hasRolledDice, true);
      expect(state.activePlayerId, 'p1');
      expect(state.consecutiveSixesCount, 1);

      // Roll 3 sixes -> penalty, turn skipped
      state = initialState.copyWith(consecutiveSixesCount: 2);
      state = RuleEngine.executeRoll(state, 6);
      expect(state.consecutiveSixesCount, 0);
      expect(state.hasRolledDice, false);
      expect(state.activePlayerId, 'p2');
    });

    test('executeMove updates token position and turn correctly', () {
      // Setup p1 token at 0 (start)
      var state = initialState.copyWith(
        hasRolledDice: true,
        currentDice: const Dice(value: 5, isRolling: false),
        tokens: const [
          Token(id: 't1', ownerId: 'p1', position: 0),
        ]
      );

      // Move 5 spaces
      const move = Move(playerId: 'p1', tokenId: 't1', fromPosition: 0, toPosition: 5);
      state = RuleEngine.executeMove(state, move);

      final token = state.tokens.firstWhere((t) => t.id == 't1');
      expect(token.position, 5);
      // Didn't roll 6, didn't capture, didn't finish -> next player
      expect(state.activePlayerId, 'p2');
      expect(state.hasRolledDice, false);
    });

    test('executeMove grants bonus turn for rolling a 6', () {
      var state = initialState.copyWith(
        hasRolledDice: true,
        consecutiveSixesCount: 1,
        currentDice: const Dice(value: 6, isRolling: false),
        tokens: const [
          Token(id: 't1', ownerId: 'p1', position: 0),
        ]
      );
      const move = Move(playerId: 'p1', tokenId: 't1', fromPosition: 0, toPosition: 6);
      state = RuleEngine.executeMove(state, move);
      
      expect(state.activePlayerId, 'p1'); // Keeps turn
    });

    test('Capture logic returns opponent to base and grants bonus turn', () {
      // p1 is red, start index is 49. Relative pos 5 -> absolute 54 % 52 = 2.
      // p2 is green, start index is 10. Relative pos 44 -> absolute 54 % 52 = 2.
      var state = initialState.copyWith(
        hasRolledDice: true,
        currentDice: const Dice(value: 5, isRolling: false),
        tokens: const [
          Token(id: 't1', ownerId: 'p1', position: 0), // p1 will move +5 -> 5
          Token(id: 't2', ownerId: 'p2', position: 44), // p2 is at absolute 2
        ]
      );

      const move = Move(playerId: 'p1', tokenId: 't1', fromPosition: 0, toPosition: 5);
      state = RuleEngine.executeMove(state, move);

      final t1 = state.tokens.firstWhere((t) => t.id == 't1');
      final t2 = state.tokens.firstWhere((t) => t.id == 't2');

      expect(t1.position, 5);
      expect(t2.position, -1); // Captured and sent home
      expect(state.activePlayerId, 'p1'); // Bonus turn for capture
    });

    test('Winner logic works', () {
      var state = initialState.copyWith(
        hasRolledDice: true,
        currentDice: const Dice(value: 2, isRolling: false),
        tokens: const [
          Token(id: 't1', ownerId: 'p1', position: 57),
          Token(id: 't2', ownerId: 'p1', position: 57),
          Token(id: 't3', ownerId: 'p1', position: 57),
          Token(id: 't4', ownerId: 'p1', position: 55),
        ]
      );

      const move = Move(playerId: 'p1', tokenId: 't4', fromPosition: 55, toPosition: 57);
      state = RuleEngine.executeMove(state, move);

      final p1 = state.players.firstWhere((p) => p.id == 'p1');
      expect(p1.hasFinished, true);
      expect(state.winnerId, 'p1');
      expect(state.activePlayerId, 'p2'); // Finished player doesn't get a bonus turn
    });
  });
}
