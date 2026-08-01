// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board_path.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BoardPath _$BoardPathFromJson(Map<String, dynamic> json) => _BoardPath(
  safeZones: (json['safeZones'] as List<dynamic>)
      .map((e) => (e as num).toInt())
      .toList(),
  totalTrackLength: (json['totalTrackLength'] as num).toInt(),
);

Map<String, dynamic> _$BoardPathToJson(_BoardPath instance) =>
    <String, dynamic>{
      'safeZones': instance.safeZones,
      'totalTrackLength': instance.totalTrackLength,
    };
