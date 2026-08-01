// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GameState _$GameStateFromJson(Map<String, dynamic> json) => _GameState(
  roomId: json['roomId'] as String,
  players: (json['players'] as List<dynamic>)
      .map((e) => Player.fromJson(e as Map<String, dynamic>))
      .toList(),
  tokens: (json['tokens'] as List<dynamic>)
      .map((e) => Token.fromJson(e as Map<String, dynamic>))
      .toList(),
  currentDice: Dice.fromJson(json['currentDice'] as Map<String, dynamic>),
  phase: $enumDecode(_$GamePhaseEnumMap, json['phase']),
  boardPath: BoardPath.fromJson(json['boardPath'] as Map<String, dynamic>),
  activePlayerId: json['activePlayerId'] as String?,
  winnerId: json['winnerId'] as String?,
  consecutiveSixesCount: (json['consecutiveSixesCount'] as num?)?.toInt() ?? 0,
  hasRolledDice: json['hasRolledDice'] as bool? ?? false,
);

Map<String, dynamic> _$GameStateToJson(_GameState instance) =>
    <String, dynamic>{
      'roomId': instance.roomId,
      'players': instance.players,
      'tokens': instance.tokens,
      'currentDice': instance.currentDice,
      'phase': _$GamePhaseEnumMap[instance.phase]!,
      'boardPath': instance.boardPath,
      'activePlayerId': instance.activePlayerId,
      'winnerId': instance.winnerId,
      'consecutiveSixesCount': instance.consecutiveSixesCount,
      'hasRolledDice': instance.hasRolledDice,
    };

const _$GamePhaseEnumMap = {
  GamePhase.lobby: 'lobby',
  GamePhase.playing: 'playing',
  GamePhase.finished: 'finished',
};
