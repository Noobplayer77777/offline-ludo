import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:offline_ludo/features/game/domain/models/player.dart';
import 'package:offline_ludo/features/game/domain/models/token.dart';
import 'package:offline_ludo/features/game/domain/models/dice.dart';
import 'package:offline_ludo/features/game/domain/models/board_path.dart';

part 'game_state.freezed.dart';
part 'game_state.g.dart';

enum GamePhase { lobby, playing, finished }

@freezed
abstract class GameState with _$GameState {
  const factory GameState({
    required String roomId,
    required List<Player> players,
    required List<Token> tokens,
    required Dice currentDice,
    required GamePhase phase,
    required BoardPath boardPath,
    String? activePlayerId,
    String? winnerId,
    @Default(0) int consecutiveSixesCount,
    @Default(false) bool hasRolledDice,
  }) = _GameState;

  factory GameState.fromJson(Map<String, dynamic> json) => _$GameStateFromJson(json);
}
