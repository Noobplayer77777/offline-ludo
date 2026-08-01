import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:offline_ludo/features/game/domain/models/move.dart';

part 'game_event.freezed.dart';
part 'game_event.g.dart';

@freezed
abstract class GameEvent with _$GameEvent {
  const factory GameEvent.diceRolled({required String playerId, required int value}) = _DiceRolled;
  const factory GameEvent.tokenMoved({required Move move}) = _TokenMoved;
  const factory GameEvent.tokenCaptured({required String capturingTokenId, required String capturedTokenId}) = _TokenCaptured;
  const factory GameEvent.turnPassed({required String nextPlayerId}) = _TurnPassed;
  const factory GameEvent.gameOver({required String winnerId}) = _GameOver;

  factory GameEvent.fromJson(Map<String, dynamic> json) => _$GameEventFromJson(json);
}
