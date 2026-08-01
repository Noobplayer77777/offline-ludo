// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DiceRolled _$DiceRolledFromJson(Map<String, dynamic> json) => _DiceRolled(
  playerId: json['playerId'] as String,
  value: (json['value'] as num).toInt(),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$DiceRolledToJson(_DiceRolled instance) =>
    <String, dynamic>{
      'playerId': instance.playerId,
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_TokenMoved _$TokenMovedFromJson(Map<String, dynamic> json) => _TokenMoved(
  move: Move.fromJson(json['move'] as Map<String, dynamic>),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$TokenMovedToJson(_TokenMoved instance) =>
    <String, dynamic>{'move': instance.move, 'runtimeType': instance.$type};

_TokenCaptured _$TokenCapturedFromJson(Map<String, dynamic> json) =>
    _TokenCaptured(
      capturingTokenId: json['capturingTokenId'] as String,
      capturedTokenId: json['capturedTokenId'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$TokenCapturedToJson(_TokenCaptured instance) =>
    <String, dynamic>{
      'capturingTokenId': instance.capturingTokenId,
      'capturedTokenId': instance.capturedTokenId,
      'runtimeType': instance.$type,
    };

_TurnPassed _$TurnPassedFromJson(Map<String, dynamic> json) => _TurnPassed(
  nextPlayerId: json['nextPlayerId'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$TurnPassedToJson(_TurnPassed instance) =>
    <String, dynamic>{
      'nextPlayerId': instance.nextPlayerId,
      'runtimeType': instance.$type,
    };

_GameOver _$GameOverFromJson(Map<String, dynamic> json) => _GameOver(
  winnerId: json['winnerId'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$GameOverToJson(_GameOver instance) => <String, dynamic>{
  'winnerId': instance.winnerId,
  'runtimeType': instance.$type,
};
