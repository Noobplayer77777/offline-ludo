// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'packet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JoinRoomPayload _$JoinRoomPayloadFromJson(Map<String, dynamic> json) =>
    _JoinRoomPayload(
      username: json['username'] as String,
      version: json['version'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$JoinRoomPayloadToJson(_JoinRoomPayload instance) =>
    <String, dynamic>{
      'username': instance.username,
      'version': instance.version,
      'runtimeType': instance.$type,
    };

_ReadyPayload _$ReadyPayloadFromJson(Map<String, dynamic> json) =>
    _ReadyPayload(
      isReady: json['isReady'] as bool,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$ReadyPayloadToJson(_ReadyPayload instance) =>
    <String, dynamic>{
      'isReady': instance.isReady,
      'runtimeType': instance.$type,
    };

_RollDicePayload _$RollDicePayloadFromJson(Map<String, dynamic> json) =>
    _RollDicePayload($type: json['runtimeType'] as String?);

Map<String, dynamic> _$RollDicePayloadToJson(_RollDicePayload instance) =>
    <String, dynamic>{'runtimeType': instance.$type};

_MoveTokenPayload _$MoveTokenPayloadFromJson(Map<String, dynamic> json) =>
    _MoveTokenPayload(
      tokenId: json['tokenId'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$MoveTokenPayloadToJson(_MoveTokenPayload instance) =>
    <String, dynamic>{
      'tokenId': instance.tokenId,
      'runtimeType': instance.$type,
    };

_PingPayload _$PingPayloadFromJson(Map<String, dynamic> json) =>
    _PingPayload($type: json['runtimeType'] as String?);

Map<String, dynamic> _$PingPayloadToJson(_PingPayload instance) =>
    <String, dynamic>{'runtimeType': instance.$type};

_PongPayload _$PongPayloadFromJson(Map<String, dynamic> json) =>
    _PongPayload($type: json['runtimeType'] as String?);

Map<String, dynamic> _$PongPayloadToJson(_PongPayload instance) =>
    <String, dynamic>{'runtimeType': instance.$type};

_ErrorPayload _$ErrorPayloadFromJson(Map<String, dynamic> json) =>
    _ErrorPayload(
      message: json['message'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$ErrorPayloadToJson(_ErrorPayload instance) =>
    <String, dynamic>{
      'message': instance.message,
      'runtimeType': instance.$type,
    };

_Packet _$PacketFromJson(Map<String, dynamic> json) => _Packet(
  id: json['id'] as String,
  clientId: json['clientId'] as String,
  timestamp: DateTime.parse(json['timestamp'] as String),
  sequenceId: (json['sequenceId'] as num).toInt(),
  payload: PacketPayload.fromJson(json['payload'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PacketToJson(_Packet instance) => <String, dynamic>{
  'id': instance.id,
  'clientId': instance.clientId,
  'timestamp': instance.timestamp.toIso8601String(),
  'sequenceId': instance.sequenceId,
  'payload': instance.payload,
};
