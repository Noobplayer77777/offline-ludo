// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lobby.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Lobby {

 Room get room; List<Player> get players; bool get isStarting;
/// Create a copy of Lobby
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LobbyCopyWith<Lobby> get copyWith => _$LobbyCopyWithImpl<Lobby>(this as Lobby, _$identity);

  /// Serializes this Lobby to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Lobby&&(identical(other.room, room) || other.room == room)&&const DeepCollectionEquality().equals(other.players, players)&&(identical(other.isStarting, isStarting) || other.isStarting == isStarting));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,room,const DeepCollectionEquality().hash(players),isStarting);

@override
String toString() {
  return 'Lobby(room: $room, players: $players, isStarting: $isStarting)';
}


}

/// @nodoc
abstract mixin class $LobbyCopyWith<$Res>  {
  factory $LobbyCopyWith(Lobby value, $Res Function(Lobby) _then) = _$LobbyCopyWithImpl;
@useResult
$Res call({
 Room room, List<Player> players, bool isStarting
});


$RoomCopyWith<$Res> get room;

}
/// @nodoc
class _$LobbyCopyWithImpl<$Res>
    implements $LobbyCopyWith<$Res> {
  _$LobbyCopyWithImpl(this._self, this._then);

  final Lobby _self;
  final $Res Function(Lobby) _then;

/// Create a copy of Lobby
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? room = null,Object? players = null,Object? isStarting = null,}) {
  return _then(_self.copyWith(
room: null == room ? _self.room : room // ignore: cast_nullable_to_non_nullable
as Room,players: null == players ? _self.players : players // ignore: cast_nullable_to_non_nullable
as List<Player>,isStarting: null == isStarting ? _self.isStarting : isStarting // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of Lobby
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoomCopyWith<$Res> get room {
  
  return $RoomCopyWith<$Res>(_self.room, (value) {
    return _then(_self.copyWith(room: value));
  });
}
}


/// Adds pattern-matching-related methods to [Lobby].
extension LobbyPatterns on Lobby {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Lobby value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Lobby() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Lobby value)  $default,){
final _that = this;
switch (_that) {
case _Lobby():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Lobby value)?  $default,){
final _that = this;
switch (_that) {
case _Lobby() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Room room,  List<Player> players,  bool isStarting)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Lobby() when $default != null:
return $default(_that.room,_that.players,_that.isStarting);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Room room,  List<Player> players,  bool isStarting)  $default,) {final _that = this;
switch (_that) {
case _Lobby():
return $default(_that.room,_that.players,_that.isStarting);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Room room,  List<Player> players,  bool isStarting)?  $default,) {final _that = this;
switch (_that) {
case _Lobby() when $default != null:
return $default(_that.room,_that.players,_that.isStarting);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Lobby implements Lobby {
  const _Lobby({required this.room, required final  List<Player> players, this.isStarting = false}): _players = players;
  factory _Lobby.fromJson(Map<String, dynamic> json) => _$LobbyFromJson(json);

@override final  Room room;
 final  List<Player> _players;
@override List<Player> get players {
  if (_players is EqualUnmodifiableListView) return _players;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_players);
}

@override@JsonKey() final  bool isStarting;

/// Create a copy of Lobby
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LobbyCopyWith<_Lobby> get copyWith => __$LobbyCopyWithImpl<_Lobby>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LobbyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Lobby&&(identical(other.room, room) || other.room == room)&&const DeepCollectionEquality().equals(other._players, _players)&&(identical(other.isStarting, isStarting) || other.isStarting == isStarting));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,room,const DeepCollectionEquality().hash(_players),isStarting);

@override
String toString() {
  return 'Lobby(room: $room, players: $players, isStarting: $isStarting)';
}


}

/// @nodoc
abstract mixin class _$LobbyCopyWith<$Res> implements $LobbyCopyWith<$Res> {
  factory _$LobbyCopyWith(_Lobby value, $Res Function(_Lobby) _then) = __$LobbyCopyWithImpl;
@override @useResult
$Res call({
 Room room, List<Player> players, bool isStarting
});


@override $RoomCopyWith<$Res> get room;

}
/// @nodoc
class __$LobbyCopyWithImpl<$Res>
    implements _$LobbyCopyWith<$Res> {
  __$LobbyCopyWithImpl(this._self, this._then);

  final _Lobby _self;
  final $Res Function(_Lobby) _then;

/// Create a copy of Lobby
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? room = null,Object? players = null,Object? isStarting = null,}) {
  return _then(_Lobby(
room: null == room ? _self.room : room // ignore: cast_nullable_to_non_nullable
as Room,players: null == players ? _self._players : players // ignore: cast_nullable_to_non_nullable
as List<Player>,isStarting: null == isStarting ? _self.isStarting : isStarting // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of Lobby
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoomCopyWith<$Res> get room {
  
  return $RoomCopyWith<$Res>(_self.room, (value) {
    return _then(_self.copyWith(room: value));
  });
}
}

// dart format on
