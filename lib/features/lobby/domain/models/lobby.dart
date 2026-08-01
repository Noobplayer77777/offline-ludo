import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:offline_ludo/features/lobby/domain/models/room.dart';
import 'package:offline_ludo/features/game/domain/models/player.dart';

part 'lobby.freezed.dart';
part 'lobby.g.dart';

@freezed
abstract class Lobby with _$Lobby {
  const factory Lobby({
    required Room room,
    required List<Player> players,
    @Default(false) bool isStarting,
  }) = _Lobby;

  factory Lobby.fromJson(Map<String, dynamic> json) => _$LobbyFromJson(json);
}
