import 'package:freezed_annotation/freezed_annotation.dart';

part 'packet.freezed.dart';
part 'packet.g.dart';

@freezed
sealed class PacketPayload with _$PacketPayload {
  const factory PacketPayload.joinRoom({required String username, required String version}) = _JoinRoomPayload;
  const factory PacketPayload.ready({required bool isReady}) = _ReadyPayload;
  const factory PacketPayload.rollDice() = _RollDicePayload;
  const factory PacketPayload.moveToken({required String tokenId}) = _MoveTokenPayload;
  const factory PacketPayload.ping() = _PingPayload;
  const factory PacketPayload.pong() = _PongPayload;
  const factory PacketPayload.error({required String message}) = _ErrorPayload;

  factory PacketPayload.fromJson(Map<String, dynamic> json) => _$PacketPayloadFromJson(json);
}

@freezed
abstract class Packet with _$Packet {
  const factory Packet({
    required String id,
    required String clientId,
    required DateTime timestamp,
    required int sequenceId,
    required PacketPayload payload,
  }) = _Packet;

  factory Packet.fromJson(Map<String, dynamic> json) => _$PacketFromJson(json);
}
