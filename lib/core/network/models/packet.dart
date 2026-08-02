import 'package:freezed_annotation/freezed_annotation.dart';

part 'packet.freezed.dart';
part 'packet.g.dart';

@freezed
sealed class PacketPayload with _$PacketPayload {
  // Connection & Lobby
  const factory PacketPayload.joinRoom({required String username, required String version}) = _JoinRoomPayload;
  const factory PacketPayload.playerJoined({required String clientId, required String username, required String color}) = _PlayerJoinedPayload;
  const factory PacketPayload.playerLeft({required String clientId, required String reason}) = _PlayerLeftPayload;
  const factory PacketPayload.reconnect({required String sessionToken}) = _ReconnectPayload;
  const factory PacketPayload.ready({required bool isReady}) = _ReadyPayload;
  const factory PacketPayload.kickPlayer({required String targetClientId, required String reason}) = _KickPlayerPayload;
  
  // Game Lifecycle
  const factory PacketPayload.startGame({required String firstTurnClientId}) = _StartGamePayload;
  const factory PacketPayload.gameStateSnapshot({required Map<String, dynamic> state}) = _GameStateSnapshotPayload;
  const factory PacketPayload.nextTurn({required String activeClientId, required int timeoutMs}) = _NextTurnPayload;
  const factory PacketPayload.winner({required String clientId, required int rank}) = _WinnerPayload;
  
  // Turn Actions
  const factory PacketPayload.rollDice() = _RollDicePayload;
  const factory PacketPayload.diceResult({required int value, required String rollerId}) = _DiceResultPayload;
  const factory PacketPayload.moveToken({required String tokenId}) = _MoveTokenPayload;
  const factory PacketPayload.moveTokenEvent({required String tokenId, required List<int> path}) = _MoveTokenEventPayload;
  const factory PacketPayload.capture({required String capturingTokenId, required String capturedTokenId, required List<int> returnPath}) = _CapturePayload;
  const factory PacketPayload.ack({required String ackType, required int eventId}) = _AckPayload;
  
  // Infrastructure
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
