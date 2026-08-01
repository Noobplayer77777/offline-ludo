import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:offline_ludo/features/game/domain/board/path_generator.dart';
import 'package:offline_ludo/features/game/domain/models/player.dart';
import 'package:offline_ludo/features/game/domain/models/board_path.dart';

part 'token.freezed.dart';
part 'token.g.dart';

enum TokenState { home, track, safe, finished }

@freezed
abstract class Token with _$Token {
  const factory Token({
    required String id,
    required String ownerId,
    @Default(-1) int position, // -1 means home, 100+ means finish line, 0-51 is track
    @Default(TokenState.home) TokenState state,
  }) = _Token;

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);
}
