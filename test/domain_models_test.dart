import 'package:flutter_test/flutter_test.dart';
import 'package:offline_ludo/features/game/domain/models/player.dart';
import 'package:offline_ludo/features/game/domain/models/token.dart';
import 'package:offline_ludo/features/game/domain/models/dice.dart';

void main() {
  group('Domain Models Tests', () {
    test('Player serialization and equality', () {
      const player1 = Player(id: '1', name: 'Alice', color: PlayerColor.red);
      const player2 = Player(id: '1', name: 'Alice', color: PlayerColor.red);
      const player3 = Player(id: '2', name: 'Bob', color: PlayerColor.blue);

      // Equality
      expect(player1, equals(player2));
      expect(player1, isNot(equals(player3)));

      // Serialization
      final json = player1.toJson();
      final deserializedPlayer = Player.fromJson(json);
      expect(deserializedPlayer, equals(player1));
    });

    test('Token serialization and equality', () {
      const token1 = Token(id: 't1', ownerId: '1', position: 14, state: TokenState.track);
      const token2 = Token(id: 't1', ownerId: '1', position: 14, state: TokenState.track);
      
      expect(token1, equals(token2));
      
      final json = token1.toJson();
      final deserialized = Token.fromJson(json);
      expect(deserialized, equals(token1));
    });

    test('Dice validation', () {
      const validDice = Dice(value: 6);
      expect(() => validDice.validate(), returnsNormally);

      const invalidDice = Dice(value: 7);
      expect(() => invalidDice.validate(), throwsA(isA<ArgumentError>()));
    });
  });
}
