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
                case 'ready':
          return _ReadyPayload.fromJson(
            json
          );
                case 'rollDice':
          return _RollDicePayload.fromJson(
            json
          );
                case 'moveToken':
          return _MoveTokenPayload.fromJson(
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _JoinRoomPayload value)?  joinRoom,TResult Function( _ReadyPayload value)?  ready,TResult Function( _RollDicePayload value)?  rollDice,TResult Function( _MoveTokenPayload value)?  moveToken,TResult Function( _PingPayload value)?  ping,TResult Function( _PongPayload value)?  pong,TResult Function( _ErrorPayload value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JoinRoomPayload() when joinRoom != null:
return joinRoom(_that);case _ReadyPayload() when ready != null:
return ready(_that);case _RollDicePayload() when rollDice != null:
return rollDice(_that);case _MoveTokenPayload() when moveToken != null:
return moveToken(_that);case _PingPayload() when ping != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _JoinRoomPayload value)  joinRoom,required TResult Function( _ReadyPayload value)  ready,required TResult Function( _RollDicePayload value)  rollDice,required TResult Function( _MoveTokenPayload value)  moveToken,required TResult Function( _PingPayload value)  ping,required TResult Function( _PongPayload value)  pong,required TResult Function( _ErrorPayload value)  error,}){
final _that = this;
switch (_that) {
case _JoinRoomPayload():
return joinRoom(_that);case _ReadyPayload():
return ready(_that);case _RollDicePayload():
return rollDice(_that);case _MoveTokenPayload():
return moveToken(_that);case _PingPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _JoinRoomPayload value)?  joinRoom,TResult? Function( _ReadyPayload value)?  ready,TResult? Function( _RollDicePayload value)?  rollDice,TResult? Function( _MoveTokenPayload value)?  moveToken,TResult? Function( _PingPayload value)?  ping,TResult? Function( _PongPayload value)?  pong,TResult? Function( _ErrorPayload value)?  error,}){
final _that = this;
switch (_that) {
case _JoinRoomPayload() when joinRoom != null:
return joinRoom(_that);case _ReadyPayload() when ready != null:
return ready(_that);case _RollDicePayload() when rollDice != null:
return rollDice(_that);case _MoveTokenPayload() when moveToken != null:
return moveToken(_that);case _PingPayload() when ping != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String username,  String version)?  joinRoom,TResult Function( bool isReady)?  ready,TResult Function()?  rollDice,TResult Function( String tokenId)?  moveToken,TResult Function()?  ping,TResult Function()?  pong,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JoinRoomPayload() when joinRoom != null:
return joinRoom(_that.username,_that.version);case _ReadyPayload() when ready != null:
return ready(_that.isReady);case _RollDicePayload() when rollDice != null:
return rollDice();case _MoveTokenPayload() when moveToken != null:
return moveToken(_that.tokenId);case _PingPayload() when ping != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String username,  String version)  joinRoom,required TResult Function( bool isReady)  ready,required TResult Function()  rollDice,required TResult Function( String tokenId)  moveToken,required TResult Function()  ping,required TResult Function()  pong,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _JoinRoomPayload():
return joinRoom(_that.username,_that.version);case _ReadyPayload():
return ready(_that.isReady);case _RollDicePayload():
return rollDice();case _MoveTokenPayload():
return moveToken(_that.tokenId);case _PingPayload():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String username,  String version)?  joinRoom,TResult? Function( bool isReady)?  ready,TResult? Function()?  rollDice,TResult? Function( String tokenId)?  moveToken,TResult? Function()?  ping,TResult? Function()?  pong,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _JoinRoomPayload() when joinRoom != null:
return joinRoom(_that.username,_that.version);case _ReadyPayload() when ready != null:
return ready(_that.isReady);case _RollDicePayload() when rollDice != null:
return rollDice();case _MoveTokenPayload() when moveToken != null:
return moveToken(_that.tokenId);case _PingPayload() when ping != null:
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
