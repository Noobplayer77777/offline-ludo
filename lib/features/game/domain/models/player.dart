import 'package:freezed_annotation/freezed_annotation.dart';

part 'player.freezed.dart';
part 'player.g.dart';

enum PlayerColor { red, green, yellow, blue }

@freezed
abstract class Player with _$Player {
  const factory Player({
    required String id,
    required String name,
    required PlayerColor color,
    @Default(false) bool isBot,
    @Default(false) bool hasFinished,
    @Default(false) bool isReady,
    @Default(0) int rank,
  }) = _Player;

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);
}
