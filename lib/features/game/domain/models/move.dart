import 'package:freezed_annotation/freezed_annotation.dart';

part 'move.freezed.dart';
part 'move.g.dart';

@freezed
abstract class Move with _$Move {
  const factory Move({
    required String tokenId,
    required String playerId,
    required int fromPosition,
    required int toPosition,
    @Default(false) bool capturesOpponent,
    @Default(false) bool reachesHome,
  }) = _Move;

  factory Move.fromJson(Map<String, dynamic> json) => _$MoveFromJson(json);
}
