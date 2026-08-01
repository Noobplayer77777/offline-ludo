// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Player _$PlayerFromJson(Map<String, dynamic> json) => _Player(
  id: json['id'] as String,
  name: json['name'] as String,
  color: $enumDecode(_$PlayerColorEnumMap, json['color']),
  isBot: json['isBot'] as bool? ?? false,
  hasFinished: json['hasFinished'] as bool? ?? false,
  rank: (json['rank'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$PlayerToJson(_Player instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'color': _$PlayerColorEnumMap[instance.color]!,
  'isBot': instance.isBot,
  'hasFinished': instance.hasFinished,
  'rank': instance.rank,
};

const _$PlayerColorEnumMap = {
  PlayerColor.red: 'red',
  PlayerColor.green: 'green',
  PlayerColor.yellow: 'yellow',
  PlayerColor.blue: 'blue',
};
