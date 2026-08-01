// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'move.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Move _$MoveFromJson(Map<String, dynamic> json) => _Move(
  tokenId: json['tokenId'] as String,
  playerId: json['playerId'] as String,
  fromPosition: (json['fromPosition'] as num).toInt(),
  toPosition: (json['toPosition'] as num).toInt(),
  capturesOpponent: json['capturesOpponent'] as bool? ?? false,
  reachesHome: json['reachesHome'] as bool? ?? false,
);

Map<String, dynamic> _$MoveToJson(_Move instance) => <String, dynamic>{
  'tokenId': instance.tokenId,
  'playerId': instance.playerId,
  'fromPosition': instance.fromPosition,
  'toPosition': instance.toPosition,
  'capturesOpponent': instance.capturesOpponent,
  'reachesHome': instance.reachesHome,
};
