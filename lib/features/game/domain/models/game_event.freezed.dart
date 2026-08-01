// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
GameEvent _$GameEventFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'diceRolled':
          return _DiceRolled.fromJson(
            json
          );
                case 'tokenMoved':
          return _TokenMoved.fromJson(
            json
          );
                case 'tokenCaptured':
          return _TokenCaptured.fromJson(
            json
          );
                case 'turnPassed':
          return _TurnPassed.fromJson(
            json
          );
                case 'gameOver':
          return _GameOver.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'GameEvent',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$GameEvent {



  /// Serializes this GameEvent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameEvent);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GameEvent()';
}


}

/// @nodoc
class $GameEventCopyWith<$Res>  {
$GameEventCopyWith(GameEvent _, $Res Function(GameEvent) __);
}


/// Adds pattern-matching-related methods to [GameEvent].
extension GameEventPatterns on GameEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _DiceRolled value)?  diceRolled,TResult Function( _TokenMoved value)?  tokenMoved,TResult Function( _TokenCaptured value)?  tokenCaptured,TResult Function( _TurnPassed value)?  turnPassed,TResult Function( _GameOver value)?  gameOver,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DiceRolled() when diceRolled != null:
return diceRolled(_that);case _TokenMoved() when tokenMoved != null:
return tokenMoved(_that);case _TokenCaptured() when tokenCaptured != null:
return tokenCaptured(_that);case _TurnPassed() when turnPassed != null:
return turnPassed(_that);case _GameOver() when gameOver != null:
return gameOver(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _DiceRolled value)  diceRolled,required TResult Function( _TokenMoved value)  tokenMoved,required TResult Function( _TokenCaptured value)  tokenCaptured,required TResult Function( _TurnPassed value)  turnPassed,required TResult Function( _GameOver value)  gameOver,}){
final _that = this;
switch (_that) {
case _DiceRolled():
return diceRolled(_that);case _TokenMoved():
return tokenMoved(_that);case _TokenCaptured():
return tokenCaptured(_that);case _TurnPassed():
return turnPassed(_that);case _GameOver():
return gameOver(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _DiceRolled value)?  diceRolled,TResult? Function( _TokenMoved value)?  tokenMoved,TResult? Function( _TokenCaptured value)?  tokenCaptured,TResult? Function( _TurnPassed value)?  turnPassed,TResult? Function( _GameOver value)?  gameOver,}){
final _that = this;
switch (_that) {
case _DiceRolled() when diceRolled != null:
return diceRolled(_that);case _TokenMoved() when tokenMoved != null:
return tokenMoved(_that);case _TokenCaptured() when tokenCaptured != null:
return tokenCaptured(_that);case _TurnPassed() when turnPassed != null:
return turnPassed(_that);case _GameOver() when gameOver != null:
return gameOver(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String playerId,  int value)?  diceRolled,TResult Function( Move move)?  tokenMoved,TResult Function( String capturingTokenId,  String capturedTokenId)?  tokenCaptured,TResult Function( String nextPlayerId)?  turnPassed,TResult Function( String winnerId)?  gameOver,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DiceRolled() when diceRolled != null:
return diceRolled(_that.playerId,_that.value);case _TokenMoved() when tokenMoved != null:
return tokenMoved(_that.move);case _TokenCaptured() when tokenCaptured != null:
return tokenCaptured(_that.capturingTokenId,_that.capturedTokenId);case _TurnPassed() when turnPassed != null:
return turnPassed(_that.nextPlayerId);case _GameOver() when gameOver != null:
return gameOver(_that.winnerId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String playerId,  int value)  diceRolled,required TResult Function( Move move)  tokenMoved,required TResult Function( String capturingTokenId,  String capturedTokenId)  tokenCaptured,required TResult Function( String nextPlayerId)  turnPassed,required TResult Function( String winnerId)  gameOver,}) {final _that = this;
switch (_that) {
case _DiceRolled():
return diceRolled(_that.playerId,_that.value);case _TokenMoved():
return tokenMoved(_that.move);case _TokenCaptured():
return tokenCaptured(_that.capturingTokenId,_that.capturedTokenId);case _TurnPassed():
return turnPassed(_that.nextPlayerId);case _GameOver():
return gameOver(_that.winnerId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String playerId,  int value)?  diceRolled,TResult? Function( Move move)?  tokenMoved,TResult? Function( String capturingTokenId,  String capturedTokenId)?  tokenCaptured,TResult? Function( String nextPlayerId)?  turnPassed,TResult? Function( String winnerId)?  gameOver,}) {final _that = this;
switch (_that) {
case _DiceRolled() when diceRolled != null:
return diceRolled(_that.playerId,_that.value);case _TokenMoved() when tokenMoved != null:
return tokenMoved(_that.move);case _TokenCaptured() when tokenCaptured != null:
return tokenCaptured(_that.capturingTokenId,_that.capturedTokenId);case _TurnPassed() when turnPassed != null:
return turnPassed(_that.nextPlayerId);case _GameOver() when gameOver != null:
return gameOver(_that.winnerId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DiceRolled implements GameEvent {
  const _DiceRolled({required this.playerId, required this.value, final  String? $type}): $type = $type ?? 'diceRolled';
  factory _DiceRolled.fromJson(Map<String, dynamic> json) => _$DiceRolledFromJson(json);

 final  String playerId;
 final  int value;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of GameEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DiceRolledCopyWith<_DiceRolled> get copyWith => __$DiceRolledCopyWithImpl<_DiceRolled>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DiceRolledToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DiceRolled&&(identical(other.playerId, playerId) || other.playerId == playerId)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,playerId,value);

@override
String toString() {
  return 'GameEvent.diceRolled(playerId: $playerId, value: $value)';
}


}

/// @nodoc
abstract mixin class _$DiceRolledCopyWith<$Res> implements $GameEventCopyWith<$Res> {
  factory _$DiceRolledCopyWith(_DiceRolled value, $Res Function(_DiceRolled) _then) = __$DiceRolledCopyWithImpl;
@useResult
$Res call({
 String playerId, int value
});




}
/// @nodoc
class __$DiceRolledCopyWithImpl<$Res>
    implements _$DiceRolledCopyWith<$Res> {
  __$DiceRolledCopyWithImpl(this._self, this._then);

  final _DiceRolled _self;
  final $Res Function(_DiceRolled) _then;

/// Create a copy of GameEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? playerId = null,Object? value = null,}) {
  return _then(_DiceRolled(
playerId: null == playerId ? _self.playerId : playerId // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _TokenMoved implements GameEvent {
  const _TokenMoved({required this.move, final  String? $type}): $type = $type ?? 'tokenMoved';
  factory _TokenMoved.fromJson(Map<String, dynamic> json) => _$TokenMovedFromJson(json);

 final  Move move;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of GameEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TokenMovedCopyWith<_TokenMoved> get copyWith => __$TokenMovedCopyWithImpl<_TokenMoved>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TokenMovedToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TokenMoved&&(identical(other.move, move) || other.move == move));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,move);

@override
String toString() {
  return 'GameEvent.tokenMoved(move: $move)';
}


}

/// @nodoc
abstract mixin class _$TokenMovedCopyWith<$Res> implements $GameEventCopyWith<$Res> {
  factory _$TokenMovedCopyWith(_TokenMoved value, $Res Function(_TokenMoved) _then) = __$TokenMovedCopyWithImpl;
@useResult
$Res call({
 Move move
});


$MoveCopyWith<$Res> get move;

}
/// @nodoc
class __$TokenMovedCopyWithImpl<$Res>
    implements _$TokenMovedCopyWith<$Res> {
  __$TokenMovedCopyWithImpl(this._self, this._then);

  final _TokenMoved _self;
  final $Res Function(_TokenMoved) _then;

/// Create a copy of GameEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? move = null,}) {
  return _then(_TokenMoved(
move: null == move ? _self.move : move // ignore: cast_nullable_to_non_nullable
as Move,
  ));
}

/// Create a copy of GameEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoveCopyWith<$Res> get move {
  
  return $MoveCopyWith<$Res>(_self.move, (value) {
    return _then(_self.copyWith(move: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class _TokenCaptured implements GameEvent {
  const _TokenCaptured({required this.capturingTokenId, required this.capturedTokenId, final  String? $type}): $type = $type ?? 'tokenCaptured';
  factory _TokenCaptured.fromJson(Map<String, dynamic> json) => _$TokenCapturedFromJson(json);

 final  String capturingTokenId;
 final  String capturedTokenId;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of GameEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TokenCapturedCopyWith<_TokenCaptured> get copyWith => __$TokenCapturedCopyWithImpl<_TokenCaptured>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TokenCapturedToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TokenCaptured&&(identical(other.capturingTokenId, capturingTokenId) || other.capturingTokenId == capturingTokenId)&&(identical(other.capturedTokenId, capturedTokenId) || other.capturedTokenId == capturedTokenId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,capturingTokenId,capturedTokenId);

@override
String toString() {
  return 'GameEvent.tokenCaptured(capturingTokenId: $capturingTokenId, capturedTokenId: $capturedTokenId)';
}


}

/// @nodoc
abstract mixin class _$TokenCapturedCopyWith<$Res> implements $GameEventCopyWith<$Res> {
  factory _$TokenCapturedCopyWith(_TokenCaptured value, $Res Function(_TokenCaptured) _then) = __$TokenCapturedCopyWithImpl;
@useResult
$Res call({
 String capturingTokenId, String capturedTokenId
});




}
/// @nodoc
class __$TokenCapturedCopyWithImpl<$Res>
    implements _$TokenCapturedCopyWith<$Res> {
  __$TokenCapturedCopyWithImpl(this._self, this._then);

  final _TokenCaptured _self;
  final $Res Function(_TokenCaptured) _then;

/// Create a copy of GameEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? capturingTokenId = null,Object? capturedTokenId = null,}) {
  return _then(_TokenCaptured(
capturingTokenId: null == capturingTokenId ? _self.capturingTokenId : capturingTokenId // ignore: cast_nullable_to_non_nullable
as String,capturedTokenId: null == capturedTokenId ? _self.capturedTokenId : capturedTokenId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _TurnPassed implements GameEvent {
  const _TurnPassed({required this.nextPlayerId, final  String? $type}): $type = $type ?? 'turnPassed';
  factory _TurnPassed.fromJson(Map<String, dynamic> json) => _$TurnPassedFromJson(json);

 final  String nextPlayerId;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of GameEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TurnPassedCopyWith<_TurnPassed> get copyWith => __$TurnPassedCopyWithImpl<_TurnPassed>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TurnPassedToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TurnPassed&&(identical(other.nextPlayerId, nextPlayerId) || other.nextPlayerId == nextPlayerId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,nextPlayerId);

@override
String toString() {
  return 'GameEvent.turnPassed(nextPlayerId: $nextPlayerId)';
}


}

/// @nodoc
abstract mixin class _$TurnPassedCopyWith<$Res> implements $GameEventCopyWith<$Res> {
  factory _$TurnPassedCopyWith(_TurnPassed value, $Res Function(_TurnPassed) _then) = __$TurnPassedCopyWithImpl;
@useResult
$Res call({
 String nextPlayerId
});




}
/// @nodoc
class __$TurnPassedCopyWithImpl<$Res>
    implements _$TurnPassedCopyWith<$Res> {
  __$TurnPassedCopyWithImpl(this._self, this._then);

  final _TurnPassed _self;
  final $Res Function(_TurnPassed) _then;

/// Create a copy of GameEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? nextPlayerId = null,}) {
  return _then(_TurnPassed(
nextPlayerId: null == nextPlayerId ? _self.nextPlayerId : nextPlayerId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _GameOver implements GameEvent {
  const _GameOver({required this.winnerId, final  String? $type}): $type = $type ?? 'gameOver';
  factory _GameOver.fromJson(Map<String, dynamic> json) => _$GameOverFromJson(json);

 final  String winnerId;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of GameEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameOverCopyWith<_GameOver> get copyWith => __$GameOverCopyWithImpl<_GameOver>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GameOverToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameOver&&(identical(other.winnerId, winnerId) || other.winnerId == winnerId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,winnerId);

@override
String toString() {
  return 'GameEvent.gameOver(winnerId: $winnerId)';
}


}

/// @nodoc
abstract mixin class _$GameOverCopyWith<$Res> implements $GameEventCopyWith<$Res> {
  factory _$GameOverCopyWith(_GameOver value, $Res Function(_GameOver) _then) = __$GameOverCopyWithImpl;
@useResult
$Res call({
 String winnerId
});




}
/// @nodoc
class __$GameOverCopyWithImpl<$Res>
    implements _$GameOverCopyWith<$Res> {
  __$GameOverCopyWithImpl(this._self, this._then);

  final _GameOver _self;
  final $Res Function(_GameOver) _then;

/// Create a copy of GameEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? winnerId = null,}) {
  return _then(_GameOver(
winnerId: null == winnerId ? _self.winnerId : winnerId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
