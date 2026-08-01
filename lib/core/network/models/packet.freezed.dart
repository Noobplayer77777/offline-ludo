// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'packet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
PacketPayload _$PacketPayloadFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'joinRoom':
          return _JoinRoomPayload.fromJson(
            json
          );
                case 'playerJoined':
          return _PlayerJoinedPayload.fromJson(
            json
          );
                case 'playerLeft':
          return _PlayerLeftPayload.fromJson(
            json
          );
                case 'reconnect':
          return _ReconnectPayload.fromJson(
            json
          );
                case 'ready':
          return _ReadyPayload.fromJson(
            json
          );
                case 'kickPlayer':
          return _KickPlayerPayload.fromJson(
            json
          );
                case 'startGame':
          return _StartGamePayload.fromJson(
            json
          );
                case 'gameStateSnapshot':
          return _GameStateSnapshotPayload.fromJson(
            json
          );
                case 'nextTurn':
          return _NextTurnPayload.fromJson(
            json
          );
                case 'winner':
          return _WinnerPayload.fromJson(
            json
          );
                case 'rollDice':
          return _RollDicePayload.fromJson(
            json
          );
                case 'diceResult':
          return _DiceResultPayload.fromJson(
            json
          );
                case 'moveToken':
          return _MoveTokenPayload.fromJson(
            json
          );
                case 'moveTokenEvent':
          return _MoveTokenEventPayload.fromJson(
            json
          );
                case 'capture':
          return _CapturePayload.fromJson(
            json
          );
                case 'ack':
          return _AckPayload.fromJson(
            json
          );
                case 'ping':
          return _PingPayload.fromJson(
            json
          );
                case 'pong':
          return _PongPayload.fromJson(
            json
          );
                case 'error':
          return _ErrorPayload.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'PacketPayload',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$PacketPayload {



  /// Serializes this PacketPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PacketPayload);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PacketPayload()';
}


}

/// @nodoc
class $PacketPayloadCopyWith<$Res>  {
$PacketPayloadCopyWith(PacketPayload _, $Res Function(PacketPayload) __);
}


/// Adds pattern-matching-related methods to [PacketPayload].
extension PacketPayloadPatterns on PacketPayload {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _JoinRoomPayload value)?  joinRoom,TResult Function( _PlayerJoinedPayload value)?  playerJoined,TResult Function( _PlayerLeftPayload value)?  playerLeft,TResult Function( _ReconnectPayload value)?  reconnect,TResult Function( _ReadyPayload value)?  ready,TResult Function( _KickPlayerPayload value)?  kickPlayer,TResult Function( _StartGamePayload value)?  startGame,TResult Function( _GameStateSnapshotPayload value)?  gameStateSnapshot,TResult Function( _NextTurnPayload value)?  nextTurn,TResult Function( _WinnerPayload value)?  winner,TResult Function( _RollDicePayload value)?  rollDice,TResult Function( _DiceResultPayload value)?  diceResult,TResult Function( _MoveTokenPayload value)?  moveToken,TResult Function( _MoveTokenEventPayload value)?  moveTokenEvent,TResult Function( _CapturePayload value)?  capture,TResult Function( _AckPayload value)?  ack,TResult Function( _PingPayload value)?  ping,TResult Function( _PongPayload value)?  pong,TResult Function( _ErrorPayload value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JoinRoomPayload() when joinRoom != null:
return joinRoom(_that);case _PlayerJoinedPayload() when playerJoined != null:
return playerJoined(_that);case _PlayerLeftPayload() when playerLeft != null:
return playerLeft(_that);case _ReconnectPayload() when reconnect != null:
return reconnect(_that);case _ReadyPayload() when ready != null:
return ready(_that);case _KickPlayerPayload() when kickPlayer != null:
return kickPlayer(_that);case _StartGamePayload() when startGame != null:
return startGame(_that);case _GameStateSnapshotPayload() when gameStateSnapshot != null:
return gameStateSnapshot(_that);case _NextTurnPayload() when nextTurn != null:
return nextTurn(_that);case _WinnerPayload() when winner != null:
return winner(_that);case _RollDicePayload() when rollDice != null:
return rollDice(_that);case _DiceResultPayload() when diceResult != null:
return diceResult(_that);case _MoveTokenPayload() when moveToken != null:
return moveToken(_that);case _MoveTokenEventPayload() when moveTokenEvent != null:
return moveTokenEvent(_that);case _CapturePayload() when capture != null:
return capture(_that);case _AckPayload() when ack != null:
return ack(_that);case _PingPayload() when ping != null:
return ping(_that);case _PongPayload() when pong != null:
return pong(_that);case _ErrorPayload() when error != null:
return error(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _JoinRoomPayload value)  joinRoom,required TResult Function( _PlayerJoinedPayload value)  playerJoined,required TResult Function( _PlayerLeftPayload value)  playerLeft,required TResult Function( _ReconnectPayload value)  reconnect,required TResult Function( _ReadyPayload value)  ready,required TResult Function( _KickPlayerPayload value)  kickPlayer,required TResult Function( _StartGamePayload value)  startGame,required TResult Function( _GameStateSnapshotPayload value)  gameStateSnapshot,required TResult Function( _NextTurnPayload value)  nextTurn,required TResult Function( _WinnerPayload value)  winner,required TResult Function( _RollDicePayload value)  rollDice,required TResult Function( _DiceResultPayload value)  diceResult,required TResult Function( _MoveTokenPayload value)  moveToken,required TResult Function( _MoveTokenEventPayload value)  moveTokenEvent,required TResult Function( _CapturePayload value)  capture,required TResult Function( _AckPayload value)  ack,required TResult Function( _PingPayload value)  ping,required TResult Function( _PongPayload value)  pong,required TResult Function( _ErrorPayload value)  error,}){
final _that = this;
switch (_that) {
case _JoinRoomPayload():
return joinRoom(_that);case _PlayerJoinedPayload():
return playerJoined(_that);case _PlayerLeftPayload():
return playerLeft(_that);case _ReconnectPayload():
return reconnect(_that);case _ReadyPayload():
return ready(_that);case _KickPlayerPayload():
return kickPlayer(_that);case _StartGamePayload():
return startGame(_that);case _GameStateSnapshotPayload():
return gameStateSnapshot(_that);case _NextTurnPayload():
return nextTurn(_that);case _WinnerPayload():
return winner(_that);case _RollDicePayload():
return rollDice(_that);case _DiceResultPayload():
return diceResult(_that);case _MoveTokenPayload():
return moveToken(_that);case _MoveTokenEventPayload():
return moveTokenEvent(_that);case _CapturePayload():
return capture(_that);case _AckPayload():
return ack(_that);case _PingPayload():
return ping(_that);case _PongPayload():
return pong(_that);case _ErrorPayload():
return error(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _JoinRoomPayload value)?  joinRoom,TResult? Function( _PlayerJoinedPayload value)?  playerJoined,TResult? Function( _PlayerLeftPayload value)?  playerLeft,TResult? Function( _ReconnectPayload value)?  reconnect,TResult? Function( _ReadyPayload value)?  ready,TResult? Function( _KickPlayerPayload value)?  kickPlayer,TResult? Function( _StartGamePayload value)?  startGame,TResult? Function( _GameStateSnapshotPayload value)?  gameStateSnapshot,TResult? Function( _NextTurnPayload value)?  nextTurn,TResult? Function( _WinnerPayload value)?  winner,TResult? Function( _RollDicePayload value)?  rollDice,TResult? Function( _DiceResultPayload value)?  diceResult,TResult? Function( _MoveTokenPayload value)?  moveToken,TResult? Function( _MoveTokenEventPayload value)?  moveTokenEvent,TResult? Function( _CapturePayload value)?  capture,TResult? Function( _AckPayload value)?  ack,TResult? Function( _PingPayload value)?  ping,TResult? Function( _PongPayload value)?  pong,TResult? Function( _ErrorPayload value)?  error,}){
final _that = this;
switch (_that) {
case _JoinRoomPayload() when joinRoom != null:
return joinRoom(_that);case _PlayerJoinedPayload() when playerJoined != null:
return playerJoined(_that);case _PlayerLeftPayload() when playerLeft != null:
return playerLeft(_that);case _ReconnectPayload() when reconnect != null:
return reconnect(_that);case _ReadyPayload() when ready != null:
return ready(_that);case _KickPlayerPayload() when kickPlayer != null:
return kickPlayer(_that);case _StartGamePayload() when startGame != null:
return startGame(_that);case _GameStateSnapshotPayload() when gameStateSnapshot != null:
return gameStateSnapshot(_that);case _NextTurnPayload() when nextTurn != null:
return nextTurn(_that);case _WinnerPayload() when winner != null:
return winner(_that);case _RollDicePayload() when rollDice != null:
return rollDice(_that);case _DiceResultPayload() when diceResult != null:
return diceResult(_that);case _MoveTokenPayload() when moveToken != null:
return moveToken(_that);case _MoveTokenEventPayload() when moveTokenEvent != null:
return moveTokenEvent(_that);case _CapturePayload() when capture != null:
return capture(_that);case _AckPayload() when ack != null:
return ack(_that);case _PingPayload() when ping != null:
return ping(_that);case _PongPayload() when pong != null:
return pong(_that);case _ErrorPayload() when error != null:
return error(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String username,  String version)?  joinRoom,TResult Function( String clientId,  String username,  String color)?  playerJoined,TResult Function( String clientId,  String reason)?  playerLeft,TResult Function( String sessionToken)?  reconnect,TResult Function( bool isReady)?  ready,TResult Function( String targetClientId,  String reason)?  kickPlayer,TResult Function( String firstTurnClientId)?  startGame,TResult Function( Map<String, dynamic> state)?  gameStateSnapshot,TResult Function( String activeClientId,  int timeoutMs)?  nextTurn,TResult Function( String clientId,  int rank)?  winner,TResult Function()?  rollDice,TResult Function( int value,  String rollerId)?  diceResult,TResult Function( String tokenId)?  moveToken,TResult Function( String tokenId,  List<int> path)?  moveTokenEvent,TResult Function( String capturingTokenId,  String capturedTokenId,  List<int> returnPath)?  capture,TResult Function( String ackType,  int eventId)?  ack,TResult Function()?  ping,TResult Function()?  pong,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JoinRoomPayload() when joinRoom != null:
return joinRoom(_that.username,_that.version);case _PlayerJoinedPayload() when playerJoined != null:
return playerJoined(_that.clientId,_that.username,_that.color);case _PlayerLeftPayload() when playerLeft != null:
return playerLeft(_that.clientId,_that.reason);case _ReconnectPayload() when reconnect != null:
return reconnect(_that.sessionToken);case _ReadyPayload() when ready != null:
return ready(_that.isReady);case _KickPlayerPayload() when kickPlayer != null:
return kickPlayer(_that.targetClientId,_that.reason);case _StartGamePayload() when startGame != null:
return startGame(_that.firstTurnClientId);case _GameStateSnapshotPayload() when gameStateSnapshot != null:
return gameStateSnapshot(_that.state);case _NextTurnPayload() when nextTurn != null:
return nextTurn(_that.activeClientId,_that.timeoutMs);case _WinnerPayload() when winner != null:
return winner(_that.clientId,_that.rank);case _RollDicePayload() when rollDice != null:
return rollDice();case _DiceResultPayload() when diceResult != null:
return diceResult(_that.value,_that.rollerId);case _MoveTokenPayload() when moveToken != null:
return moveToken(_that.tokenId);case _MoveTokenEventPayload() when moveTokenEvent != null:
return moveTokenEvent(_that.tokenId,_that.path);case _CapturePayload() when capture != null:
return capture(_that.capturingTokenId,_that.capturedTokenId,_that.returnPath);case _AckPayload() when ack != null:
return ack(_that.ackType,_that.eventId);case _PingPayload() when ping != null:
return ping();case _PongPayload() when pong != null:
return pong();case _ErrorPayload() when error != null:
return error(_that.message);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String username,  String version)  joinRoom,required TResult Function( String clientId,  String username,  String color)  playerJoined,required TResult Function( String clientId,  String reason)  playerLeft,required TResult Function( String sessionToken)  reconnect,required TResult Function( bool isReady)  ready,required TResult Function( String targetClientId,  String reason)  kickPlayer,required TResult Function( String firstTurnClientId)  startGame,required TResult Function( Map<String, dynamic> state)  gameStateSnapshot,required TResult Function( String activeClientId,  int timeoutMs)  nextTurn,required TResult Function( String clientId,  int rank)  winner,required TResult Function()  rollDice,required TResult Function( int value,  String rollerId)  diceResult,required TResult Function( String tokenId)  moveToken,required TResult Function( String tokenId,  List<int> path)  moveTokenEvent,required TResult Function( String capturingTokenId,  String capturedTokenId,  List<int> returnPath)  capture,required TResult Function( String ackType,  int eventId)  ack,required TResult Function()  ping,required TResult Function()  pong,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _JoinRoomPayload():
return joinRoom(_that.username,_that.version);case _PlayerJoinedPayload():
return playerJoined(_that.clientId,_that.username,_that.color);case _PlayerLeftPayload():
return playerLeft(_that.clientId,_that.reason);case _ReconnectPayload():
return reconnect(_that.sessionToken);case _ReadyPayload():
return ready(_that.isReady);case _KickPlayerPayload():
return kickPlayer(_that.targetClientId,_that.reason);case _StartGamePayload():
return startGame(_that.firstTurnClientId);case _GameStateSnapshotPayload():
return gameStateSnapshot(_that.state);case _NextTurnPayload():
return nextTurn(_that.activeClientId,_that.timeoutMs);case _WinnerPayload():
return winner(_that.clientId,_that.rank);case _RollDicePayload():
return rollDice();case _DiceResultPayload():
return diceResult(_that.value,_that.rollerId);case _MoveTokenPayload():
return moveToken(_that.tokenId);case _MoveTokenEventPayload():
return moveTokenEvent(_that.tokenId,_that.path);case _CapturePayload():
return capture(_that.capturingTokenId,_that.capturedTokenId,_that.returnPath);case _AckPayload():
return ack(_that.ackType,_that.eventId);case _PingPayload():
return ping();case _PongPayload():
return pong();case _ErrorPayload():
return error(_that.message);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String username,  String version)?  joinRoom,TResult? Function( String clientId,  String username,  String color)?  playerJoined,TResult? Function( String clientId,  String reason)?  playerLeft,TResult? Function( String sessionToken)?  reconnect,TResult? Function( bool isReady)?  ready,TResult? Function( String targetClientId,  String reason)?  kickPlayer,TResult? Function( String firstTurnClientId)?  startGame,TResult? Function( Map<String, dynamic> state)?  gameStateSnapshot,TResult? Function( String activeClientId,  int timeoutMs)?  nextTurn,TResult? Function( String clientId,  int rank)?  winner,TResult? Function()?  rollDice,TResult? Function( int value,  String rollerId)?  diceResult,TResult? Function( String tokenId)?  moveToken,TResult? Function( String tokenId,  List<int> path)?  moveTokenEvent,TResult? Function( String capturingTokenId,  String capturedTokenId,  List<int> returnPath)?  capture,TResult? Function( String ackType,  int eventId)?  ack,TResult? Function()?  ping,TResult? Function()?  pong,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _JoinRoomPayload() when joinRoom != null:
return joinRoom(_that.username,_that.version);case _PlayerJoinedPayload() when playerJoined != null:
return playerJoined(_that.clientId,_that.username,_that.color);case _PlayerLeftPayload() when playerLeft != null:
return playerLeft(_that.clientId,_that.reason);case _ReconnectPayload() when reconnect != null:
return reconnect(_that.sessionToken);case _ReadyPayload() when ready != null:
return ready(_that.isReady);case _KickPlayerPayload() when kickPlayer != null:
return kickPlayer(_that.targetClientId,_that.reason);case _StartGamePayload() when startGame != null:
return startGame(_that.firstTurnClientId);case _GameStateSnapshotPayload() when gameStateSnapshot != null:
return gameStateSnapshot(_that.state);case _NextTurnPayload() when nextTurn != null:
return nextTurn(_that.activeClientId,_that.timeoutMs);case _WinnerPayload() when winner != null:
return winner(_that.clientId,_that.rank);case _RollDicePayload() when rollDice != null:
return rollDice();case _DiceResultPayload() when diceResult != null:
return diceResult(_that.value,_that.rollerId);case _MoveTokenPayload() when moveToken != null:
return moveToken(_that.tokenId);case _MoveTokenEventPayload() when moveTokenEvent != null:
return moveTokenEvent(_that.tokenId,_that.path);case _CapturePayload() when capture != null:
return capture(_that.capturingTokenId,_that.capturedTokenId,_that.returnPath);case _AckPayload() when ack != null:
return ack(_that.ackType,_that.eventId);case _PingPayload() when ping != null:
return ping();case _PongPayload() when pong != null:
return pong();case _ErrorPayload() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JoinRoomPayload implements PacketPayload {
  const _JoinRoomPayload({required this.username, required this.version, final  String? $type}): $type = $type ?? 'joinRoom';
  factory _JoinRoomPayload.fromJson(Map<String, dynamic> json) => _$JoinRoomPayloadFromJson(json);

 final  String username;
 final  String version;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of PacketPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JoinRoomPayloadCopyWith<_JoinRoomPayload> get copyWith => __$JoinRoomPayloadCopyWithImpl<_JoinRoomPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JoinRoomPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JoinRoomPayload&&(identical(other.username, username) || other.username == username)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,username,version);

@override
String toString() {
  return 'PacketPayload.joinRoom(username: $username, version: $version)';
}


}

/// @nodoc
abstract mixin class _$JoinRoomPayloadCopyWith<$Res> implements $PacketPayloadCopyWith<$Res> {
  factory _$JoinRoomPayloadCopyWith(_JoinRoomPayload value, $Res Function(_JoinRoomPayload) _then) = __$JoinRoomPayloadCopyWithImpl;
@useResult
$Res call({
 String username, String version
});




}
/// @nodoc
class __$JoinRoomPayloadCopyWithImpl<$Res>
    implements _$JoinRoomPayloadCopyWith<$Res> {
  __$JoinRoomPayloadCopyWithImpl(this._self, this._then);

  final _JoinRoomPayload _self;
  final $Res Function(_JoinRoomPayload) _then;

/// Create a copy of PacketPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? username = null,Object? version = null,}) {
  return _then(_JoinRoomPayload(
username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _PlayerJoinedPayload implements PacketPayload {
  const _PlayerJoinedPayload({required this.clientId, required this.username, required this.color, final  String? $type}): $type = $type ?? 'playerJoined';
  factory _PlayerJoinedPayload.fromJson(Map<String, dynamic> json) => _$PlayerJoinedPayloadFromJson(json);

 final  String clientId;
 final  String username;
 final  String color;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of PacketPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlayerJoinedPayloadCopyWith<_PlayerJoinedPayload> get copyWith => __$PlayerJoinedPayloadCopyWithImpl<_PlayerJoinedPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlayerJoinedPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlayerJoinedPayload&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.username, username) || other.username == username)&&(identical(other.color, color) || other.color == color));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clientId,username,color);

@override
String toString() {
  return 'PacketPayload.playerJoined(clientId: $clientId, username: $username, color: $color)';
}


}

/// @nodoc
abstract mixin class _$PlayerJoinedPayloadCopyWith<$Res> implements $PacketPayloadCopyWith<$Res> {
  factory _$PlayerJoinedPayloadCopyWith(_PlayerJoinedPayload value, $Res Function(_PlayerJoinedPayload) _then) = __$PlayerJoinedPayloadCopyWithImpl;
@useResult
$Res call({
 String clientId, String username, String color
});




}
/// @nodoc
class __$PlayerJoinedPayloadCopyWithImpl<$Res>
    implements _$PlayerJoinedPayloadCopyWith<$Res> {
  __$PlayerJoinedPayloadCopyWithImpl(this._self, this._then);

  final _PlayerJoinedPayload _self;
  final $Res Function(_PlayerJoinedPayload) _then;

/// Create a copy of PacketPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? clientId = null,Object? username = null,Object? color = null,}) {
  return _then(_PlayerJoinedPayload(
clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _PlayerLeftPayload implements PacketPayload {
  const _PlayerLeftPayload({required this.clientId, required this.reason, final  String? $type}): $type = $type ?? 'playerLeft';
  factory _PlayerLeftPayload.fromJson(Map<String, dynamic> json) => _$PlayerLeftPayloadFromJson(json);

 final  String clientId;
 final  String reason;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of PacketPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlayerLeftPayloadCopyWith<_PlayerLeftPayload> get copyWith => __$PlayerLeftPayloadCopyWithImpl<_PlayerLeftPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlayerLeftPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlayerLeftPayload&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.reason, reason) || other.reason == reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clientId,reason);

@override
String toString() {
  return 'PacketPayload.playerLeft(clientId: $clientId, reason: $reason)';
}


}

/// @nodoc
abstract mixin class _$PlayerLeftPayloadCopyWith<$Res> implements $PacketPayloadCopyWith<$Res> {
  factory _$PlayerLeftPayloadCopyWith(_PlayerLeftPayload value, $Res Function(_PlayerLeftPayload) _then) = __$PlayerLeftPayloadCopyWithImpl;
@useResult
$Res call({
 String clientId, String reason
});




}
/// @nodoc
class __$PlayerLeftPayloadCopyWithImpl<$Res>
    implements _$PlayerLeftPayloadCopyWith<$Res> {
  __$PlayerLeftPayloadCopyWithImpl(this._self, this._then);

  final _PlayerLeftPayload _self;
  final $Res Function(_PlayerLeftPayload) _then;

/// Create a copy of PacketPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? clientId = null,Object? reason = null,}) {
  return _then(_PlayerLeftPayload(
clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _ReconnectPayload implements PacketPayload {
  const _ReconnectPayload({required this.sessionToken, final  String? $type}): $type = $type ?? 'reconnect';
  factory _ReconnectPayload.fromJson(Map<String, dynamic> json) => _$ReconnectPayloadFromJson(json);

 final  String sessionToken;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of PacketPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReconnectPayloadCopyWith<_ReconnectPayload> get copyWith => __$ReconnectPayloadCopyWithImpl<_ReconnectPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReconnectPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReconnectPayload&&(identical(other.sessionToken, sessionToken) || other.sessionToken == sessionToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sessionToken);

@override
String toString() {
  return 'PacketPayload.reconnect(sessionToken: $sessionToken)';
}


}

/// @nodoc
abstract mixin class _$ReconnectPayloadCopyWith<$Res> implements $PacketPayloadCopyWith<$Res> {
  factory _$ReconnectPayloadCopyWith(_ReconnectPayload value, $Res Function(_ReconnectPayload) _then) = __$ReconnectPayloadCopyWithImpl;
@useResult
$Res call({
 String sessionToken
});




}
/// @nodoc
class __$ReconnectPayloadCopyWithImpl<$Res>
    implements _$ReconnectPayloadCopyWith<$Res> {
  __$ReconnectPayloadCopyWithImpl(this._self, this._then);

  final _ReconnectPayload _self;
  final $Res Function(_ReconnectPayload) _then;

/// Create a copy of PacketPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? sessionToken = null,}) {
  return _then(_ReconnectPayload(
sessionToken: null == sessionToken ? _self.sessionToken : sessionToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _ReadyPayload implements PacketPayload {
  const _ReadyPayload({required this.isReady, final  String? $type}): $type = $type ?? 'ready';
  factory _ReadyPayload.fromJson(Map<String, dynamic> json) => _$ReadyPayloadFromJson(json);

 final  bool isReady;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of PacketPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReadyPayloadCopyWith<_ReadyPayload> get copyWith => __$ReadyPayloadCopyWithImpl<_ReadyPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReadyPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReadyPayload&&(identical(other.isReady, isReady) || other.isReady == isReady));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isReady);

@override
String toString() {
  return 'PacketPayload.ready(isReady: $isReady)';
}


}

/// @nodoc
abstract mixin class _$ReadyPayloadCopyWith<$Res> implements $PacketPayloadCopyWith<$Res> {
  factory _$ReadyPayloadCopyWith(_ReadyPayload value, $Res Function(_ReadyPayload) _then) = __$ReadyPayloadCopyWithImpl;
@useResult
$Res call({
 bool isReady
});




}
/// @nodoc
class __$ReadyPayloadCopyWithImpl<$Res>
    implements _$ReadyPayloadCopyWith<$Res> {
  __$ReadyPayloadCopyWithImpl(this._self, this._then);

  final _ReadyPayload _self;
  final $Res Function(_ReadyPayload) _then;

/// Create a copy of PacketPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isReady = null,}) {
  return _then(_ReadyPayload(
isReady: null == isReady ? _self.isReady : isReady // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _KickPlayerPayload implements PacketPayload {
  const _KickPlayerPayload({required this.targetClientId, required this.reason, final  String? $type}): $type = $type ?? 'kickPlayer';
  factory _KickPlayerPayload.fromJson(Map<String, dynamic> json) => _$KickPlayerPayloadFromJson(json);

 final  String targetClientId;
 final  String reason;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of PacketPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$KickPlayerPayloadCopyWith<_KickPlayerPayload> get copyWith => __$KickPlayerPayloadCopyWithImpl<_KickPlayerPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$KickPlayerPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _KickPlayerPayload&&(identical(other.targetClientId, targetClientId) || other.targetClientId == targetClientId)&&(identical(other.reason, reason) || other.reason == reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,targetClientId,reason);

@override
String toString() {
  return 'PacketPayload.kickPlayer(targetClientId: $targetClientId, reason: $reason)';
}


}

/// @nodoc
abstract mixin class _$KickPlayerPayloadCopyWith<$Res> implements $PacketPayloadCopyWith<$Res> {
  factory _$KickPlayerPayloadCopyWith(_KickPlayerPayload value, $Res Function(_KickPlayerPayload) _then) = __$KickPlayerPayloadCopyWithImpl;
@useResult
$Res call({
 String targetClientId, String reason
});




}
/// @nodoc
class __$KickPlayerPayloadCopyWithImpl<$Res>
    implements _$KickPlayerPayloadCopyWith<$Res> {
  __$KickPlayerPayloadCopyWithImpl(this._self, this._then);

  final _KickPlayerPayload _self;
  final $Res Function(_KickPlayerPayload) _then;

/// Create a copy of PacketPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? targetClientId = null,Object? reason = null,}) {
  return _then(_KickPlayerPayload(
targetClientId: null == targetClientId ? _self.targetClientId : targetClientId // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _StartGamePayload implements PacketPayload {
  const _StartGamePayload({required this.firstTurnClientId, final  String? $type}): $type = $type ?? 'startGame';
  factory _StartGamePayload.fromJson(Map<String, dynamic> json) => _$StartGamePayloadFromJson(json);

 final  String firstTurnClientId;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of PacketPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StartGamePayloadCopyWith<_StartGamePayload> get copyWith => __$StartGamePayloadCopyWithImpl<_StartGamePayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StartGamePayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StartGamePayload&&(identical(other.firstTurnClientId, firstTurnClientId) || other.firstTurnClientId == firstTurnClientId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstTurnClientId);

@override
String toString() {
  return 'PacketPayload.startGame(firstTurnClientId: $firstTurnClientId)';
}


}

/// @nodoc
abstract mixin class _$StartGamePayloadCopyWith<$Res> implements $PacketPayloadCopyWith<$Res> {
  factory _$StartGamePayloadCopyWith(_StartGamePayload value, $Res Function(_StartGamePayload) _then) = __$StartGamePayloadCopyWithImpl;
@useResult
$Res call({
 String firstTurnClientId
});




}
/// @nodoc
class __$StartGamePayloadCopyWithImpl<$Res>
    implements _$StartGamePayloadCopyWith<$Res> {
  __$StartGamePayloadCopyWithImpl(this._self, this._then);

  final _StartGamePayload _self;
  final $Res Function(_StartGamePayload) _then;

/// Create a copy of PacketPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? firstTurnClientId = null,}) {
  return _then(_StartGamePayload(
firstTurnClientId: null == firstTurnClientId ? _self.firstTurnClientId : firstTurnClientId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _GameStateSnapshotPayload implements PacketPayload {
  const _GameStateSnapshotPayload({required final  Map<String, dynamic> state, final  String? $type}): _state = state,$type = $type ?? 'gameStateSnapshot';
  factory _GameStateSnapshotPayload.fromJson(Map<String, dynamic> json) => _$GameStateSnapshotPayloadFromJson(json);

 final  Map<String, dynamic> _state;
 Map<String, dynamic> get state {
  if (_state is EqualUnmodifiableMapView) return _state;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_state);
}


@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of PacketPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameStateSnapshotPayloadCopyWith<_GameStateSnapshotPayload> get copyWith => __$GameStateSnapshotPayloadCopyWithImpl<_GameStateSnapshotPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GameStateSnapshotPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameStateSnapshotPayload&&const DeepCollectionEquality().equals(other._state, _state));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_state));

@override
String toString() {
  return 'PacketPayload.gameStateSnapshot(state: $state)';
}


}

/// @nodoc
abstract mixin class _$GameStateSnapshotPayloadCopyWith<$Res> implements $PacketPayloadCopyWith<$Res> {
  factory _$GameStateSnapshotPayloadCopyWith(_GameStateSnapshotPayload value, $Res Function(_GameStateSnapshotPayload) _then) = __$GameStateSnapshotPayloadCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> state
});




}
/// @nodoc
class __$GameStateSnapshotPayloadCopyWithImpl<$Res>
    implements _$GameStateSnapshotPayloadCopyWith<$Res> {
  __$GameStateSnapshotPayloadCopyWithImpl(this._self, this._then);

  final _GameStateSnapshotPayload _self;
  final $Res Function(_GameStateSnapshotPayload) _then;

/// Create a copy of PacketPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? state = null,}) {
  return _then(_GameStateSnapshotPayload(
state: null == state ? _self._state : state // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _NextTurnPayload implements PacketPayload {
  const _NextTurnPayload({required this.activeClientId, required this.timeoutMs, final  String? $type}): $type = $type ?? 'nextTurn';
  factory _NextTurnPayload.fromJson(Map<String, dynamic> json) => _$NextTurnPayloadFromJson(json);

 final  String activeClientId;
 final  int timeoutMs;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of PacketPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NextTurnPayloadCopyWith<_NextTurnPayload> get copyWith => __$NextTurnPayloadCopyWithImpl<_NextTurnPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NextTurnPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NextTurnPayload&&(identical(other.activeClientId, activeClientId) || other.activeClientId == activeClientId)&&(identical(other.timeoutMs, timeoutMs) || other.timeoutMs == timeoutMs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,activeClientId,timeoutMs);

@override
String toString() {
  return 'PacketPayload.nextTurn(activeClientId: $activeClientId, timeoutMs: $timeoutMs)';
}


}

/// @nodoc
abstract mixin class _$NextTurnPayloadCopyWith<$Res> implements $PacketPayloadCopyWith<$Res> {
  factory _$NextTurnPayloadCopyWith(_NextTurnPayload value, $Res Function(_NextTurnPayload) _then) = __$NextTurnPayloadCopyWithImpl;
@useResult
$Res call({
 String activeClientId, int timeoutMs
});




}
/// @nodoc
class __$NextTurnPayloadCopyWithImpl<$Res>
    implements _$NextTurnPayloadCopyWith<$Res> {
  __$NextTurnPayloadCopyWithImpl(this._self, this._then);

  final _NextTurnPayload _self;
  final $Res Function(_NextTurnPayload) _then;

/// Create a copy of PacketPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? activeClientId = null,Object? timeoutMs = null,}) {
  return _then(_NextTurnPayload(
activeClientId: null == activeClientId ? _self.activeClientId : activeClientId // ignore: cast_nullable_to_non_nullable
as String,timeoutMs: null == timeoutMs ? _self.timeoutMs : timeoutMs // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _WinnerPayload implements PacketPayload {
  const _WinnerPayload({required this.clientId, required this.rank, final  String? $type}): $type = $type ?? 'winner';
  factory _WinnerPayload.fromJson(Map<String, dynamic> json) => _$WinnerPayloadFromJson(json);

 final  String clientId;
 final  int rank;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of PacketPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WinnerPayloadCopyWith<_WinnerPayload> get copyWith => __$WinnerPayloadCopyWithImpl<_WinnerPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WinnerPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WinnerPayload&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.rank, rank) || other.rank == rank));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clientId,rank);

@override
String toString() {
  return 'PacketPayload.winner(clientId: $clientId, rank: $rank)';
}


}

/// @nodoc
abstract mixin class _$WinnerPayloadCopyWith<$Res> implements $PacketPayloadCopyWith<$Res> {
  factory _$WinnerPayloadCopyWith(_WinnerPayload value, $Res Function(_WinnerPayload) _then) = __$WinnerPayloadCopyWithImpl;
@useResult
$Res call({
 String clientId, int rank
});




}
/// @nodoc
class __$WinnerPayloadCopyWithImpl<$Res>
    implements _$WinnerPayloadCopyWith<$Res> {
  __$WinnerPayloadCopyWithImpl(this._self, this._then);

  final _WinnerPayload _self;
  final $Res Function(_WinnerPayload) _then;

/// Create a copy of PacketPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? clientId = null,Object? rank = null,}) {
  return _then(_WinnerPayload(
clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,rank: null == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _RollDicePayload implements PacketPayload {
  const _RollDicePayload({final  String? $type}): $type = $type ?? 'rollDice';
  factory _RollDicePayload.fromJson(Map<String, dynamic> json) => _$RollDicePayloadFromJson(json);



@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$RollDicePayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RollDicePayload);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PacketPayload.rollDice()';
}


}




/// @nodoc
@JsonSerializable()

class _DiceResultPayload implements PacketPayload {
  const _DiceResultPayload({required this.value, required this.rollerId, final  String? $type}): $type = $type ?? 'diceResult';
  factory _DiceResultPayload.fromJson(Map<String, dynamic> json) => _$DiceResultPayloadFromJson(json);

 final  int value;
 final  String rollerId;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of PacketPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DiceResultPayloadCopyWith<_DiceResultPayload> get copyWith => __$DiceResultPayloadCopyWithImpl<_DiceResultPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DiceResultPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DiceResultPayload&&(identical(other.value, value) || other.value == value)&&(identical(other.rollerId, rollerId) || other.rollerId == rollerId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,rollerId);

@override
String toString() {
  return 'PacketPayload.diceResult(value: $value, rollerId: $rollerId)';
}


}

/// @nodoc
abstract mixin class _$DiceResultPayloadCopyWith<$Res> implements $PacketPayloadCopyWith<$Res> {
  factory _$DiceResultPayloadCopyWith(_DiceResultPayload value, $Res Function(_DiceResultPayload) _then) = __$DiceResultPayloadCopyWithImpl;
@useResult
$Res call({
 int value, String rollerId
});




}
/// @nodoc
class __$DiceResultPayloadCopyWithImpl<$Res>
    implements _$DiceResultPayloadCopyWith<$Res> {
  __$DiceResultPayloadCopyWithImpl(this._self, this._then);

  final _DiceResultPayload _self;
  final $Res Function(_DiceResultPayload) _then;

/// Create a copy of PacketPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,Object? rollerId = null,}) {
  return _then(_DiceResultPayload(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int,rollerId: null == rollerId ? _self.rollerId : rollerId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _MoveTokenPayload implements PacketPayload {
  const _MoveTokenPayload({required this.tokenId, final  String? $type}): $type = $type ?? 'moveToken';
  factory _MoveTokenPayload.fromJson(Map<String, dynamic> json) => _$MoveTokenPayloadFromJson(json);

 final  String tokenId;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of PacketPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MoveTokenPayloadCopyWith<_MoveTokenPayload> get copyWith => __$MoveTokenPayloadCopyWithImpl<_MoveTokenPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MoveTokenPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MoveTokenPayload&&(identical(other.tokenId, tokenId) || other.tokenId == tokenId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tokenId);

@override
String toString() {
  return 'PacketPayload.moveToken(tokenId: $tokenId)';
}


}

/// @nodoc
abstract mixin class _$MoveTokenPayloadCopyWith<$Res> implements $PacketPayloadCopyWith<$Res> {
  factory _$MoveTokenPayloadCopyWith(_MoveTokenPayload value, $Res Function(_MoveTokenPayload) _then) = __$MoveTokenPayloadCopyWithImpl;
@useResult
$Res call({
 String tokenId
});




}
/// @nodoc
class __$MoveTokenPayloadCopyWithImpl<$Res>
    implements _$MoveTokenPayloadCopyWith<$Res> {
  __$MoveTokenPayloadCopyWithImpl(this._self, this._then);

  final _MoveTokenPayload _self;
  final $Res Function(_MoveTokenPayload) _then;

/// Create a copy of PacketPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tokenId = null,}) {
  return _then(_MoveTokenPayload(
tokenId: null == tokenId ? _self.tokenId : tokenId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _MoveTokenEventPayload implements PacketPayload {
  const _MoveTokenEventPayload({required this.tokenId, required final  List<int> path, final  String? $type}): _path = path,$type = $type ?? 'moveTokenEvent';
  factory _MoveTokenEventPayload.fromJson(Map<String, dynamic> json) => _$MoveTokenEventPayloadFromJson(json);

 final  String tokenId;
 final  List<int> _path;
 List<int> get path {
  if (_path is EqualUnmodifiableListView) return _path;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_path);
}


@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of PacketPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MoveTokenEventPayloadCopyWith<_MoveTokenEventPayload> get copyWith => __$MoveTokenEventPayloadCopyWithImpl<_MoveTokenEventPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MoveTokenEventPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MoveTokenEventPayload&&(identical(other.tokenId, tokenId) || other.tokenId == tokenId)&&const DeepCollectionEquality().equals(other._path, _path));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tokenId,const DeepCollectionEquality().hash(_path));

@override
String toString() {
  return 'PacketPayload.moveTokenEvent(tokenId: $tokenId, path: $path)';
}


}

/// @nodoc
abstract mixin class _$MoveTokenEventPayloadCopyWith<$Res> implements $PacketPayloadCopyWith<$Res> {
  factory _$MoveTokenEventPayloadCopyWith(_MoveTokenEventPayload value, $Res Function(_MoveTokenEventPayload) _then) = __$MoveTokenEventPayloadCopyWithImpl;
@useResult
$Res call({
 String tokenId, List<int> path
});




}
/// @nodoc
class __$MoveTokenEventPayloadCopyWithImpl<$Res>
    implements _$MoveTokenEventPayloadCopyWith<$Res> {
  __$MoveTokenEventPayloadCopyWithImpl(this._self, this._then);

  final _MoveTokenEventPayload _self;
  final $Res Function(_MoveTokenEventPayload) _then;

/// Create a copy of PacketPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tokenId = null,Object? path = null,}) {
  return _then(_MoveTokenEventPayload(
tokenId: null == tokenId ? _self.tokenId : tokenId // ignore: cast_nullable_to_non_nullable
as String,path: null == path ? _self._path : path // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _CapturePayload implements PacketPayload {
  const _CapturePayload({required this.capturingTokenId, required this.capturedTokenId, required final  List<int> returnPath, final  String? $type}): _returnPath = returnPath,$type = $type ?? 'capture';
  factory _CapturePayload.fromJson(Map<String, dynamic> json) => _$CapturePayloadFromJson(json);

 final  String capturingTokenId;
 final  String capturedTokenId;
 final  List<int> _returnPath;
 List<int> get returnPath {
  if (_returnPath is EqualUnmodifiableListView) return _returnPath;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_returnPath);
}


@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of PacketPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CapturePayloadCopyWith<_CapturePayload> get copyWith => __$CapturePayloadCopyWithImpl<_CapturePayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CapturePayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CapturePayload&&(identical(other.capturingTokenId, capturingTokenId) || other.capturingTokenId == capturingTokenId)&&(identical(other.capturedTokenId, capturedTokenId) || other.capturedTokenId == capturedTokenId)&&const DeepCollectionEquality().equals(other._returnPath, _returnPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,capturingTokenId,capturedTokenId,const DeepCollectionEquality().hash(_returnPath));

@override
String toString() {
  return 'PacketPayload.capture(capturingTokenId: $capturingTokenId, capturedTokenId: $capturedTokenId, returnPath: $returnPath)';
}


}

/// @nodoc
abstract mixin class _$CapturePayloadCopyWith<$Res> implements $PacketPayloadCopyWith<$Res> {
  factory _$CapturePayloadCopyWith(_CapturePayload value, $Res Function(_CapturePayload) _then) = __$CapturePayloadCopyWithImpl;
@useResult
$Res call({
 String capturingTokenId, String capturedTokenId, List<int> returnPath
});




}
/// @nodoc
class __$CapturePayloadCopyWithImpl<$Res>
    implements _$CapturePayloadCopyWith<$Res> {
  __$CapturePayloadCopyWithImpl(this._self, this._then);

  final _CapturePayload _self;
  final $Res Function(_CapturePayload) _then;

/// Create a copy of PacketPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? capturingTokenId = null,Object? capturedTokenId = null,Object? returnPath = null,}) {
  return _then(_CapturePayload(
capturingTokenId: null == capturingTokenId ? _self.capturingTokenId : capturingTokenId // ignore: cast_nullable_to_non_nullable
as String,capturedTokenId: null == capturedTokenId ? _self.capturedTokenId : capturedTokenId // ignore: cast_nullable_to_non_nullable
as String,returnPath: null == returnPath ? _self._returnPath : returnPath // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _AckPayload implements PacketPayload {
  const _AckPayload({required this.ackType, required this.eventId, final  String? $type}): $type = $type ?? 'ack';
  factory _AckPayload.fromJson(Map<String, dynamic> json) => _$AckPayloadFromJson(json);

 final  String ackType;
 final  int eventId;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of PacketPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AckPayloadCopyWith<_AckPayload> get copyWith => __$AckPayloadCopyWithImpl<_AckPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AckPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AckPayload&&(identical(other.ackType, ackType) || other.ackType == ackType)&&(identical(other.eventId, eventId) || other.eventId == eventId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ackType,eventId);

@override
String toString() {
  return 'PacketPayload.ack(ackType: $ackType, eventId: $eventId)';
}


}

/// @nodoc
abstract mixin class _$AckPayloadCopyWith<$Res> implements $PacketPayloadCopyWith<$Res> {
  factory _$AckPayloadCopyWith(_AckPayload value, $Res Function(_AckPayload) _then) = __$AckPayloadCopyWithImpl;
@useResult
$Res call({
 String ackType, int eventId
});




}
/// @nodoc
class __$AckPayloadCopyWithImpl<$Res>
    implements _$AckPayloadCopyWith<$Res> {
  __$AckPayloadCopyWithImpl(this._self, this._then);

  final _AckPayload _self;
  final $Res Function(_AckPayload) _then;

/// Create a copy of PacketPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? ackType = null,Object? eventId = null,}) {
  return _then(_AckPayload(
ackType: null == ackType ? _self.ackType : ackType // ignore: cast_nullable_to_non_nullable
as String,eventId: null == eventId ? _self.eventId : eventId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _PingPayload implements PacketPayload {
  const _PingPayload({final  String? $type}): $type = $type ?? 'ping';
  factory _PingPayload.fromJson(Map<String, dynamic> json) => _$PingPayloadFromJson(json);



@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$PingPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PingPayload);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PacketPayload.ping()';
}


}




/// @nodoc
@JsonSerializable()

class _PongPayload implements PacketPayload {
  const _PongPayload({final  String? $type}): $type = $type ?? 'pong';
  factory _PongPayload.fromJson(Map<String, dynamic> json) => _$PongPayloadFromJson(json);



@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$PongPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PongPayload);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PacketPayload.pong()';
}


}




/// @nodoc
@JsonSerializable()

class _ErrorPayload implements PacketPayload {
  const _ErrorPayload({required this.message, final  String? $type}): $type = $type ?? 'error';
  factory _ErrorPayload.fromJson(Map<String, dynamic> json) => _$ErrorPayloadFromJson(json);

 final  String message;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of PacketPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorPayloadCopyWith<_ErrorPayload> get copyWith => __$ErrorPayloadCopyWithImpl<_ErrorPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ErrorPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ErrorPayload&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'PacketPayload.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorPayloadCopyWith<$Res> implements $PacketPayloadCopyWith<$Res> {
  factory _$ErrorPayloadCopyWith(_ErrorPayload value, $Res Function(_ErrorPayload) _then) = __$ErrorPayloadCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ErrorPayloadCopyWithImpl<$Res>
    implements _$ErrorPayloadCopyWith<$Res> {
  __$ErrorPayloadCopyWithImpl(this._self, this._then);

  final _ErrorPayload _self;
  final $Res Function(_ErrorPayload) _then;

/// Create a copy of PacketPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_ErrorPayload(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$Packet {

 String get id; String get clientId; DateTime get timestamp; int get sequenceId; PacketPayload get payload;
/// Create a copy of Packet
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PacketCopyWith<Packet> get copyWith => _$PacketCopyWithImpl<Packet>(this as Packet, _$identity);

  /// Serializes this Packet to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Packet&&(identical(other.id, id) || other.id == id)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.sequenceId, sequenceId) || other.sequenceId == sequenceId)&&(identical(other.payload, payload) || other.payload == payload));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,clientId,timestamp,sequenceId,payload);

@override
String toString() {
  return 'Packet(id: $id, clientId: $clientId, timestamp: $timestamp, sequenceId: $sequenceId, payload: $payload)';
}


}

/// @nodoc
abstract mixin class $PacketCopyWith<$Res>  {
  factory $PacketCopyWith(Packet value, $Res Function(Packet) _then) = _$PacketCopyWithImpl;
@useResult
$Res call({
 String id, String clientId, DateTime timestamp, int sequenceId, PacketPayload payload
});


$PacketPayloadCopyWith<$Res> get payload;

}
/// @nodoc
class _$PacketCopyWithImpl<$Res>
    implements $PacketCopyWith<$Res> {
  _$PacketCopyWithImpl(this._self, this._then);

  final Packet _self;
  final $Res Function(Packet) _then;

/// Create a copy of Packet
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? clientId = null,Object? timestamp = null,Object? sequenceId = null,Object? payload = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,sequenceId: null == sequenceId ? _self.sequenceId : sequenceId // ignore: cast_nullable_to_non_nullable
as int,payload: null == payload ? _self.payload : payload // ignore: cast_nullable_to_non_nullable
as PacketPayload,
  ));
}
/// Create a copy of Packet
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PacketPayloadCopyWith<$Res> get payload {
  
  return $PacketPayloadCopyWith<$Res>(_self.payload, (value) {
    return _then(_self.copyWith(payload: value));
  });
}
}


/// Adds pattern-matching-related methods to [Packet].
extension PacketPatterns on Packet {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Packet value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Packet() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Packet value)  $default,){
final _that = this;
switch (_that) {
case _Packet():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Packet value)?  $default,){
final _that = this;
switch (_that) {
case _Packet() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String clientId,  DateTime timestamp,  int sequenceId,  PacketPayload payload)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Packet() when $default != null:
return $default(_that.id,_that.clientId,_that.timestamp,_that.sequenceId,_that.payload);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String clientId,  DateTime timestamp,  int sequenceId,  PacketPayload payload)  $default,) {final _that = this;
switch (_that) {
case _Packet():
return $default(_that.id,_that.clientId,_that.timestamp,_that.sequenceId,_that.payload);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String clientId,  DateTime timestamp,  int sequenceId,  PacketPayload payload)?  $default,) {final _that = this;
switch (_that) {
case _Packet() when $default != null:
return $default(_that.id,_that.clientId,_that.timestamp,_that.sequenceId,_that.payload);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Packet implements Packet {
  const _Packet({required this.id, required this.clientId, required this.timestamp, required this.sequenceId, required this.payload});
  factory _Packet.fromJson(Map<String, dynamic> json) => _$PacketFromJson(json);

@override final  String id;
@override final  String clientId;
@override final  DateTime timestamp;
@override final  int sequenceId;
@override final  PacketPayload payload;

/// Create a copy of Packet
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PacketCopyWith<_Packet> get copyWith => __$PacketCopyWithImpl<_Packet>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PacketToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Packet&&(identical(other.id, id) || other.id == id)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.sequenceId, sequenceId) || other.sequenceId == sequenceId)&&(identical(other.payload, payload) || other.payload == payload));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,clientId,timestamp,sequenceId,payload);

@override
String toString() {
  return 'Packet(id: $id, clientId: $clientId, timestamp: $timestamp, sequenceId: $sequenceId, payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$PacketCopyWith<$Res> implements $PacketCopyWith<$Res> {
  factory _$PacketCopyWith(_Packet value, $Res Function(_Packet) _then) = __$PacketCopyWithImpl;
@override @useResult
$Res call({
 String id, String clientId, DateTime timestamp, int sequenceId, PacketPayload payload
});


@override $PacketPayloadCopyWith<$Res> get payload;

}
/// @nodoc
class __$PacketCopyWithImpl<$Res>
    implements _$PacketCopyWith<$Res> {
  __$PacketCopyWithImpl(this._self, this._then);

  final _Packet _self;
  final $Res Function(_Packet) _then;

/// Create a copy of Packet
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? clientId = null,Object? timestamp = null,Object? sequenceId = null,Object? payload = null,}) {
  return _then(_Packet(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,sequenceId: null == sequenceId ? _self.sequenceId : sequenceId // ignore: cast_nullable_to_non_nullable
as int,payload: null == payload ? _self.payload : payload // ignore: cast_nullable_to_non_nullable
as PacketPayload,
  ));
}

/// Create a copy of Packet
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PacketPayloadCopyWith<$Res> get payload {
  
  return $PacketPayloadCopyWith<$Res>(_self.payload, (value) {
    return _then(_self.copyWith(payload: value));
  });
}
}

// dart format on
