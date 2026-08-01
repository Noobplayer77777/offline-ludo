// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lobby.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Lobby _$LobbyFromJson(Map<String, dynamic> json) => _Lobby(
  room: Room.fromJson(json['room'] as Map<String, dynamic>),
  players: (json['players'] as List<dynamic>)
      .map((e) => Player.fromJson(e as Map<String, dynamic>))
      .toList(),
  isStarting: json['isStarting'] as bool? ?? false,
);

Map<String, dynamic> _$LobbyToJson(_Lobby instance) => <String, dynamic>{
  'room': instance.room,
  'players': instance.players,
  'isStarting': instance.isStarting,
};
