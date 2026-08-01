// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Token _$TokenFromJson(Map<String, dynamic> json) => _Token(
  id: json['id'] as String,
  ownerId: json['ownerId'] as String,
  position: (json['position'] as num?)?.toInt() ?? -1,
  state:
      $enumDecodeNullable(_$TokenStateEnumMap, json['state']) ??
      TokenState.home,
);

Map<String, dynamic> _$TokenToJson(_Token instance) => <String, dynamic>{
  'id': instance.id,
  'ownerId': instance.ownerId,
  'position': instance.position,
  'state': _$TokenStateEnumMap[instance.state]!,
};

const _$TokenStateEnumMap = {
  TokenState.home: 'home',
  TokenState.track: 'track',
  TokenState.safe: 'safe',
  TokenState.finished: 'finished',
};
