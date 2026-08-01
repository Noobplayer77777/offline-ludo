// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'board_path.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BoardPath {

 List<int> get safeZones; int get totalTrackLength;
/// Create a copy of BoardPath
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BoardPathCopyWith<BoardPath> get copyWith => _$BoardPathCopyWithImpl<BoardPath>(this as BoardPath, _$identity);

  /// Serializes this BoardPath to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BoardPath&&const DeepCollectionEquality().equals(other.safeZones, safeZones)&&(identical(other.totalTrackLength, totalTrackLength) || other.totalTrackLength == totalTrackLength));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(safeZones),totalTrackLength);

@override
String toString() {
  return 'BoardPath(safeZones: $safeZones, totalTrackLength: $totalTrackLength)';
}


}

/// @nodoc
abstract mixin class $BoardPathCopyWith<$Res>  {
  factory $BoardPathCopyWith(BoardPath value, $Res Function(BoardPath) _then) = _$BoardPathCopyWithImpl;
@useResult
$Res call({
 List<int> safeZones, int totalTrackLength
});




}
/// @nodoc
class _$BoardPathCopyWithImpl<$Res>
    implements $BoardPathCopyWith<$Res> {
  _$BoardPathCopyWithImpl(this._self, this._then);

  final BoardPath _self;
  final $Res Function(BoardPath) _then;

/// Create a copy of BoardPath
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? safeZones = null,Object? totalTrackLength = null,}) {
  return _then(_self.copyWith(
safeZones: null == safeZones ? _self.safeZones : safeZones // ignore: cast_nullable_to_non_nullable
as List<int>,totalTrackLength: null == totalTrackLength ? _self.totalTrackLength : totalTrackLength // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [BoardPath].
extension BoardPathPatterns on BoardPath {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BoardPath value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BoardPath() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BoardPath value)  $default,){
final _that = this;
switch (_that) {
case _BoardPath():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BoardPath value)?  $default,){
final _that = this;
switch (_that) {
case _BoardPath() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<int> safeZones,  int totalTrackLength)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BoardPath() when $default != null:
return $default(_that.safeZones,_that.totalTrackLength);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<int> safeZones,  int totalTrackLength)  $default,) {final _that = this;
switch (_that) {
case _BoardPath():
return $default(_that.safeZones,_that.totalTrackLength);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<int> safeZones,  int totalTrackLength)?  $default,) {final _that = this;
switch (_that) {
case _BoardPath() when $default != null:
return $default(_that.safeZones,_that.totalTrackLength);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BoardPath implements BoardPath {
  const _BoardPath({required final  List<int> safeZones, required this.totalTrackLength}): _safeZones = safeZones;
  factory _BoardPath.fromJson(Map<String, dynamic> json) => _$BoardPathFromJson(json);

 final  List<int> _safeZones;
@override List<int> get safeZones {
  if (_safeZones is EqualUnmodifiableListView) return _safeZones;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_safeZones);
}

@override final  int totalTrackLength;

/// Create a copy of BoardPath
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BoardPathCopyWith<_BoardPath> get copyWith => __$BoardPathCopyWithImpl<_BoardPath>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BoardPathToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BoardPath&&const DeepCollectionEquality().equals(other._safeZones, _safeZones)&&(identical(other.totalTrackLength, totalTrackLength) || other.totalTrackLength == totalTrackLength));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_safeZones),totalTrackLength);

@override
String toString() {
  return 'BoardPath(safeZones: $safeZones, totalTrackLength: $totalTrackLength)';
}


}

/// @nodoc
abstract mixin class _$BoardPathCopyWith<$Res> implements $BoardPathCopyWith<$Res> {
  factory _$BoardPathCopyWith(_BoardPath value, $Res Function(_BoardPath) _then) = __$BoardPathCopyWithImpl;
@override @useResult
$Res call({
 List<int> safeZones, int totalTrackLength
});




}
/// @nodoc
class __$BoardPathCopyWithImpl<$Res>
    implements _$BoardPathCopyWith<$Res> {
  __$BoardPathCopyWithImpl(this._self, this._then);

  final _BoardPath _self;
  final $Res Function(_BoardPath) _then;

/// Create a copy of BoardPath
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? safeZones = null,Object? totalTrackLength = null,}) {
  return _then(_BoardPath(
safeZones: null == safeZones ? _self._safeZones : safeZones // ignore: cast_nullable_to_non_nullable
as List<int>,totalTrackLength: null == totalTrackLength ? _self.totalTrackLength : totalTrackLength // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
