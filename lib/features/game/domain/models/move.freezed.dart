// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'move.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Move {

 String get tokenId; String get playerId; int get fromPosition; int get toPosition; bool get capturesOpponent; bool get reachesHome;
/// Create a copy of Move
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MoveCopyWith<Move> get copyWith => _$MoveCopyWithImpl<Move>(this as Move, _$identity);

  /// Serializes this Move to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Move&&(identical(other.tokenId, tokenId) || other.tokenId == tokenId)&&(identical(other.playerId, playerId) || other.playerId == playerId)&&(identical(other.fromPosition, fromPosition) || other.fromPosition == fromPosition)&&(identical(other.toPosition, toPosition) || other.toPosition == toPosition)&&(identical(other.capturesOpponent, capturesOpponent) || other.capturesOpponent == capturesOpponent)&&(identical(other.reachesHome, reachesHome) || other.reachesHome == reachesHome));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tokenId,playerId,fromPosition,toPosition,capturesOpponent,reachesHome);

@override
String toString() {
  return 'Move(tokenId: $tokenId, playerId: $playerId, fromPosition: $fromPosition, toPosition: $toPosition, capturesOpponent: $capturesOpponent, reachesHome: $reachesHome)';
}


}

/// @nodoc
abstract mixin class $MoveCopyWith<$Res>  {
  factory $MoveCopyWith(Move value, $Res Function(Move) _then) = _$MoveCopyWithImpl;
@useResult
$Res call({
 String tokenId, String playerId, int fromPosition, int toPosition, bool capturesOpponent, bool reachesHome
});




}
/// @nodoc
class _$MoveCopyWithImpl<$Res>
    implements $MoveCopyWith<$Res> {
  _$MoveCopyWithImpl(this._self, this._then);

  final Move _self;
  final $Res Function(Move) _then;

/// Create a copy of Move
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tokenId = null,Object? playerId = null,Object? fromPosition = null,Object? toPosition = null,Object? capturesOpponent = null,Object? reachesHome = null,}) {
  return _then(_self.copyWith(
tokenId: null == tokenId ? _self.tokenId : tokenId // ignore: cast_nullable_to_non_nullable
as String,playerId: null == playerId ? _self.playerId : playerId // ignore: cast_nullable_to_non_nullable
as String,fromPosition: null == fromPosition ? _self.fromPosition : fromPosition // ignore: cast_nullable_to_non_nullable
as int,toPosition: null == toPosition ? _self.toPosition : toPosition // ignore: cast_nullable_to_non_nullable
as int,capturesOpponent: null == capturesOpponent ? _self.capturesOpponent : capturesOpponent // ignore: cast_nullable_to_non_nullable
as bool,reachesHome: null == reachesHome ? _self.reachesHome : reachesHome // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Move].
extension MovePatterns on Move {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Move value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Move() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Move value)  $default,){
final _that = this;
switch (_that) {
case _Move():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Move value)?  $default,){
final _that = this;
switch (_that) {
case _Move() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String tokenId,  String playerId,  int fromPosition,  int toPosition,  bool capturesOpponent,  bool reachesHome)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Move() when $default != null:
return $default(_that.tokenId,_that.playerId,_that.fromPosition,_that.toPosition,_that.capturesOpponent,_that.reachesHome);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String tokenId,  String playerId,  int fromPosition,  int toPosition,  bool capturesOpponent,  bool reachesHome)  $default,) {final _that = this;
switch (_that) {
case _Move():
return $default(_that.tokenId,_that.playerId,_that.fromPosition,_that.toPosition,_that.capturesOpponent,_that.reachesHome);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String tokenId,  String playerId,  int fromPosition,  int toPosition,  bool capturesOpponent,  bool reachesHome)?  $default,) {final _that = this;
switch (_that) {
case _Move() when $default != null:
return $default(_that.tokenId,_that.playerId,_that.fromPosition,_that.toPosition,_that.capturesOpponent,_that.reachesHome);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Move implements Move {
  const _Move({required this.tokenId, required this.playerId, required this.fromPosition, required this.toPosition, this.capturesOpponent = false, this.reachesHome = false});
  factory _Move.fromJson(Map<String, dynamic> json) => _$MoveFromJson(json);

@override final  String tokenId;
@override final  String playerId;
@override final  int fromPosition;
@override final  int toPosition;
@override@JsonKey() final  bool capturesOpponent;
@override@JsonKey() final  bool reachesHome;

/// Create a copy of Move
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MoveCopyWith<_Move> get copyWith => __$MoveCopyWithImpl<_Move>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MoveToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Move&&(identical(other.tokenId, tokenId) || other.tokenId == tokenId)&&(identical(other.playerId, playerId) || other.playerId == playerId)&&(identical(other.fromPosition, fromPosition) || other.fromPosition == fromPosition)&&(identical(other.toPosition, toPosition) || other.toPosition == toPosition)&&(identical(other.capturesOpponent, capturesOpponent) || other.capturesOpponent == capturesOpponent)&&(identical(other.reachesHome, reachesHome) || other.reachesHome == reachesHome));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tokenId,playerId,fromPosition,toPosition,capturesOpponent,reachesHome);

@override
String toString() {
  return 'Move(tokenId: $tokenId, playerId: $playerId, fromPosition: $fromPosition, toPosition: $toPosition, capturesOpponent: $capturesOpponent, reachesHome: $reachesHome)';
}


}

/// @nodoc
abstract mixin class _$MoveCopyWith<$Res> implements $MoveCopyWith<$Res> {
  factory _$MoveCopyWith(_Move value, $Res Function(_Move) _then) = __$MoveCopyWithImpl;
@override @useResult
$Res call({
 String tokenId, String playerId, int fromPosition, int toPosition, bool capturesOpponent, bool reachesHome
});




}
/// @nodoc
class __$MoveCopyWithImpl<$Res>
    implements _$MoveCopyWith<$Res> {
  __$MoveCopyWithImpl(this._self, this._then);

  final _Move _self;
  final $Res Function(_Move) _then;

/// Create a copy of Move
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tokenId = null,Object? playerId = null,Object? fromPosition = null,Object? toPosition = null,Object? capturesOpponent = null,Object? reachesHome = null,}) {
  return _then(_Move(
tokenId: null == tokenId ? _self.tokenId : tokenId // ignore: cast_nullable_to_non_nullable
as String,playerId: null == playerId ? _self.playerId : playerId // ignore: cast_nullable_to_non_nullable
as String,fromPosition: null == fromPosition ? _self.fromPosition : fromPosition // ignore: cast_nullable_to_non_nullable
as int,toPosition: null == toPosition ? _self.toPosition : toPosition // ignore: cast_nullable_to_non_nullable
as int,capturesOpponent: null == capturesOpponent ? _self.capturesOpponent : capturesOpponent // ignore: cast_nullable_to_non_nullable
as bool,reachesHome: null == reachesHome ? _self.reachesHome : reachesHome // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
