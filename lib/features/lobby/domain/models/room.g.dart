// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Room _$RoomFromJson(Map<String, dynamic> json) => _Room(
  id: json['id'] as String,
  hostIp: json['hostIp'] as String,
  port: (json['port'] as num).toInt(),
  name: json['name'] as String,
  code: json['code'] as String,
  currentPlayers: (json['currentPlayers'] as num?)?.toInt() ?? 1,
  maxPlayers: (json['maxPlayers'] as num?)?.toInt() ?? 4,
);

Map<String, dynamic> _$RoomToJson(_Room instance) => <String, dynamic>{
  'id': instance.id,
  'hostIp': instance.hostIp,
  'port': instance.port,
  'name': instance.name,
  'code': instance.code,
  'currentPlayers': instance.currentPlayers,
  'maxPlayers': instance.maxPlayers,
};
