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

_PlayerJoinedPayload _$PlayerJoinedPayloadFromJson(Map<String, dynamic> json) =>
    _PlayerJoinedPayload(
      clientId: json['clientId'] as String,
      username: json['username'] as String,
      color: json['color'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$PlayerJoinedPayloadToJson(
  _PlayerJoinedPayload instance,
) => <String, dynamic>{
  'clientId': instance.clientId,
  'username': instance.username,
  'color': instance.color,
  'runtimeType': instance.$type,
};

_PlayerLeftPayload _$PlayerLeftPayloadFromJson(Map<String, dynamic> json) =>
    _PlayerLeftPayload(
      clientId: json['clientId'] as String,
      reason: json['reason'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$PlayerLeftPayloadToJson(_PlayerLeftPayload instance) =>
    <String, dynamic>{
      'clientId': instance.clientId,
      'reason': instance.reason,
      'runtimeType': instance.$type,
    };

_ReconnectPayload _$ReconnectPayloadFromJson(Map<String, dynamic> json) =>
    _ReconnectPayload(
      sessionToken: json['sessionToken'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$ReconnectPayloadToJson(_ReconnectPayload instance) =>
    <String, dynamic>{
      'sessionToken': instance.sessionToken,
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

_KickPlayerPayload _$KickPlayerPayloadFromJson(Map<String, dynamic> json) =>
    _KickPlayerPayload(
      targetClientId: json['targetClientId'] as String,
      reason: json['reason'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$KickPlayerPayloadToJson(_KickPlayerPayload instance) =>
    <String, dynamic>{
      'targetClientId': instance.targetClientId,
      'reason': instance.reason,
      'runtimeType': instance.$type,
    };

_StartGamePayload _$StartGamePayloadFromJson(Map<String, dynamic> json) =>
    _StartGamePayload(
      firstTurnClientId: json['firstTurnClientId'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$StartGamePayloadToJson(_StartGamePayload instance) =>
    <String, dynamic>{
      'firstTurnClientId': instance.firstTurnClientId,
      'runtimeType': instance.$type,
    };

_GameStateSnapshotPayload _$GameStateSnapshotPayloadFromJson(
  Map<String, dynamic> json,
) => _GameStateSnapshotPayload(
  state: json['state'] as Map<String, dynamic>,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$GameStateSnapshotPayloadToJson(
  _GameStateSnapshotPayload instance,
) => <String, dynamic>{'state': instance.state, 'runtimeType': instance.$type};

_NextTurnPayload _$NextTurnPayloadFromJson(Map<String, dynamic> json) =>
    _NextTurnPayload(
      activeClientId: json['activeClientId'] as String,
      timeoutMs: (json['timeoutMs'] as num).toInt(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$NextTurnPayloadToJson(_NextTurnPayload instance) =>
    <String, dynamic>{
      'activeClientId': instance.activeClientId,
      'timeoutMs': instance.timeoutMs,
      'runtimeType': instance.$type,
    };

_WinnerPayload _$WinnerPayloadFromJson(Map<String, dynamic> json) =>
    _WinnerPayload(
      clientId: json['clientId'] as String,
      rank: (json['rank'] as num).toInt(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$WinnerPayloadToJson(_WinnerPayload instance) =>
    <String, dynamic>{
      'clientId': instance.clientId,
      'rank': instance.rank,
      'runtimeType': instance.$type,
    };

_RollDicePayload _$RollDicePayloadFromJson(Map<String, dynamic> json) =>
    _RollDicePayload($type: json['runtimeType'] as String?);

Map<String, dynamic> _$RollDicePayloadToJson(_RollDicePayload instance) =>
    <String, dynamic>{'runtimeType': instance.$type};

_DiceResultPayload _$DiceResultPayloadFromJson(Map<String, dynamic> json) =>
    _DiceResultPayload(
      value: (json['value'] as num).toInt(),
      rollerId: json['rollerId'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$DiceResultPayloadToJson(_DiceResultPayload instance) =>
    <String, dynamic>{
      'value': instance.value,
      'rollerId': instance.rollerId,
      'runtimeType': instance.$type,
    };

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

_MoveTokenEventPayload _$MoveTokenEventPayloadFromJson(
  Map<String, dynamic> json,
) => _MoveTokenEventPayload(
  tokenId: json['tokenId'] as String,
  path: (json['path'] as List<dynamic>).map((e) => (e as num).toInt()).toList(),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$MoveTokenEventPayloadToJson(
  _MoveTokenEventPayload instance,
) => <String, dynamic>{
  'tokenId': instance.tokenId,
  'path': instance.path,
  'runtimeType': instance.$type,
};

_CapturePayload _$CapturePayloadFromJson(Map<String, dynamic> json) =>
    _CapturePayload(
      capturingTokenId: json['capturingTokenId'] as String,
      capturedTokenId: json['capturedTokenId'] as String,
      returnPath: (json['returnPath'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$CapturePayloadToJson(_CapturePayload instance) =>
    <String, dynamic>{
      'capturingTokenId': instance.capturingTokenId,
      'capturedTokenId': instance.capturedTokenId,
      'returnPath': instance.returnPath,
      'runtimeType': instance.$type,
    };

_AckPayload _$AckPayloadFromJson(Map<String, dynamic> json) => _AckPayload(
  ackType: json['ackType'] as String,
  eventId: (json['eventId'] as num).toInt(),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$AckPayloadToJson(_AckPayload instance) =>
    <String, dynamic>{
      'ackType': instance.ackType,
      'eventId': instance.eventId,
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
