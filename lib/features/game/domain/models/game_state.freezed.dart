// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GameState {

 String get roomId; List<Player> get players; List<Token> get tokens; Dice get currentDice; GamePhase get phase; BoardPath get boardPath; String? get activePlayerId; String? get winnerId; int get consecutiveSixesCount; bool get hasRolledDice;
/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameStateCopyWith<GameState> get copyWith => _$GameStateCopyWithImpl<GameState>(this as GameState, _$identity);

  /// Serializes this GameState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameState&&(identical(other.roomId, roomId) || other.roomId == roomId)&&const DeepCollectionEquality().equals(other.players, players)&&const DeepCollectionEquality().equals(other.tokens, tokens)&&(identical(other.currentDice, currentDice) || other.currentDice == currentDice)&&(identical(other.phase, phase) || other.phase == phase)&&(identical(other.boardPath, boardPath) || other.boardPath == boardPath)&&(identical(other.activePlayerId, activePlayerId) || other.activePlayerId == activePlayerId)&&(identical(other.winnerId, winnerId) || other.winnerId == winnerId)&&(identical(other.consecutiveSixesCount, consecutiveSixesCount) || other.consecutiveSixesCount == consecutiveSixesCount)&&(identical(other.hasRolledDice, hasRolledDice) || other.hasRolledDice == hasRolledDice));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,roomId,const DeepCollectionEquality().hash(players),const DeepCollectionEquality().hash(tokens),currentDice,phase,boardPath,activePlayerId,winnerId,consecutiveSixesCount,hasRolledDice);

@override
String toString() {
  return 'GameState(roomId: $roomId, players: $players, tokens: $tokens, currentDice: $currentDice, phase: $phase, boardPath: $boardPath, activePlayerId: $activePlayerId, winnerId: $winnerId, consecutiveSixesCount: $consecutiveSixesCount, hasRolledDice: $hasRolledDice)';
}


}

/// @nodoc
abstract mixin class $GameStateCopyWith<$Res>  {
  factory $GameStateCopyWith(GameState value, $Res Function(GameState) _then) = _$GameStateCopyWithImpl;
@useResult
$Res call({
 String roomId, List<Player> players, List<Token> tokens, Dice currentDice, GamePhase phase, BoardPath boardPath, String? activePlayerId, String? winnerId, int consecutiveSixesCount, bool hasRolledDice
});


$DiceCopyWith<$Res> get currentDice;$BoardPathCopyWith<$Res> get boardPath;

}
/// @nodoc
class _$GameStateCopyWithImpl<$Res>
    implements $GameStateCopyWith<$Res> {
  _$GameStateCopyWithImpl(this._self, this._then);

  final GameState _self;
  final $Res Function(GameState) _then;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? roomId = null,Object? players = null,Object? tokens = null,Object? currentDice = null,Object? phase = null,Object? boardPath = null,Object? activePlayerId = freezed,Object? winnerId = freezed,Object? consecutiveSixesCount = null,Object? hasRolledDice = null,}) {
  return _then(_self.copyWith(
roomId: null == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String,players: null == players ? _self.players : players // ignore: cast_nullable_to_non_nullable
as List<Player>,tokens: null == tokens ? _self.tokens : tokens // ignore: cast_nullable_to_non_nullable
as List<Token>,currentDice: null == currentDice ? _self.currentDice : currentDice // ignore: cast_nullable_to_non_nullable
as Dice,phase: null == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as GamePhase,boardPath: null == boardPath ? _self.boardPath : boardPath // ignore: cast_nullable_to_non_nullable
as BoardPath,activePlayerId: freezed == activePlayerId ? _self.activePlayerId : activePlayerId // ignore: cast_nullable_to_non_nullable
as String?,winnerId: freezed == winnerId ? _self.winnerId : winnerId // ignore: cast_nullable_to_non_nullable
as String?,consecutiveSixesCount: null == consecutiveSixesCount ? _self.consecutiveSixesCount : consecutiveSixesCount // ignore: cast_nullable_to_non_nullable
as int,hasRolledDice: null == hasRolledDice ? _self.hasRolledDice : hasRolledDice // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DiceCopyWith<$Res> get currentDice {
  
  return $DiceCopyWith<$Res>(_self.currentDice, (value) {
    return _then(_self.copyWith(currentDice: value));
  });
}/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BoardPathCopyWith<$Res> get boardPath {
  
  return $BoardPathCopyWith<$Res>(_self.boardPath, (value) {
    return _then(_self.copyWith(boardPath: value));
  });
}
}


/// Adds pattern-matching-related methods to [GameState].
extension GameStatePatterns on GameState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GameState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GameState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GameState value)  $default,){
final _that = this;
switch (_that) {
case _GameState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GameState value)?  $default,){
final _that = this;
switch (_that) {
case _GameState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String roomId,  List<Player> players,  List<Token> tokens,  Dice currentDice,  GamePhase phase,  BoardPath boardPath,  String? activePlayerId,  String? winnerId,  int consecutiveSixesCount,  bool hasRolledDice)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GameState() when $default != null:
return $default(_that.roomId,_that.players,_that.tokens,_that.currentDice,_that.phase,_that.boardPath,_that.activePlayerId,_that.winnerId,_that.consecutiveSixesCount,_that.hasRolledDice);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String roomId,  List<Player> players,  List<Token> tokens,  Dice currentDice,  GamePhase phase,  BoardPath boardPath,  String? activePlayerId,  String? winnerId,  int consecutiveSixesCount,  bool hasRolledDice)  $default,) {final _that = this;
switch (_that) {
case _GameState():
return $default(_that.roomId,_that.players,_that.tokens,_that.currentDice,_that.phase,_that.boardPath,_that.activePlayerId,_that.winnerId,_that.consecutiveSixesCount,_that.hasRolledDice);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String roomId,  List<Player> players,  List<Token> tokens,  Dice currentDice,  GamePhase phase,  BoardPath boardPath,  String? activePlayerId,  String? winnerId,  int consecutiveSixesCount,  bool hasRolledDice)?  $default,) {final _that = this;
switch (_that) {
case _GameState() when $default != null:
return $default(_that.roomId,_that.players,_that.tokens,_that.currentDice,_that.phase,_that.boardPath,_that.activePlayerId,_that.winnerId,_that.consecutiveSixesCount,_that.hasRolledDice);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GameState implements GameState {
  const _GameState({required this.roomId, required final  List<Player> players, required final  List<Token> tokens, required this.currentDice, required this.phase, required this.boardPath, this.activePlayerId, this.winnerId, this.consecutiveSixesCount = 0, this.hasRolledDice = false}): _players = players,_tokens = tokens;
  factory _GameState.fromJson(Map<String, dynamic> json) => _$GameStateFromJson(json);

@override final  String roomId;
 final  List<Player> _players;
@override List<Player> get players {
  if (_players is EqualUnmodifiableListView) return _players;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_players);
}

 final  List<Token> _tokens;
@override List<Token> get tokens {
  if (_tokens is EqualUnmodifiableListView) return _tokens;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tokens);
}

@override final  Dice currentDice;
@override final  GamePhase phase;
@override final  BoardPath boardPath;
@override final  String? activePlayerId;
@override final  String? winnerId;
@override@JsonKey() final  int consecutiveSixesCount;
@override@JsonKey() final  bool hasRolledDice;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameStateCopyWith<_GameState> get copyWith => __$GameStateCopyWithImpl<_GameState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GameStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameState&&(identical(other.roomId, roomId) || other.roomId == roomId)&&const DeepCollectionEquality().equals(other._players, _players)&&const DeepCollectionEquality().equals(other._tokens, _tokens)&&(identical(other.currentDice, currentDice) || other.currentDice == currentDice)&&(identical(other.phase, phase) || other.phase == phase)&&(identical(other.boardPath, boardPath) || other.boardPath == boardPath)&&(identical(other.activePlayerId, activePlayerId) || other.activePlayerId == activePlayerId)&&(identical(other.winnerId, winnerId) || other.winnerId == winnerId)&&(identical(other.consecutiveSixesCount, consecutiveSixesCount) || other.consecutiveSixesCount == consecutiveSixesCount)&&(identical(other.hasRolledDice, hasRolledDice) || other.hasRolledDice == hasRolledDice));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,roomId,const DeepCollectionEquality().hash(_players),const DeepCollectionEquality().hash(_tokens),currentDice,phase,boardPath,activePlayerId,winnerId,consecutiveSixesCount,hasRolledDice);

@override
String toString() {
  return 'GameState(roomId: $roomId, players: $players, tokens: $tokens, currentDice: $currentDice, phase: $phase, boardPath: $boardPath, activePlayerId: $activePlayerId, winnerId: $winnerId, consecutiveSixesCount: $consecutiveSixesCount, hasRolledDice: $hasRolledDice)';
}


}

/// @nodoc
abstract mixin class _$GameStateCopyWith<$Res> implements $GameStateCopyWith<$Res> {
  factory _$GameStateCopyWith(_GameState value, $Res Function(_GameState) _then) = __$GameStateCopyWithImpl;
@override @useResult
$Res call({
 String roomId, List<Player> players, List<Token> tokens, Dice currentDice, GamePhase phase, BoardPath boardPath, String? activePlayerId, String? winnerId, int consecutiveSixesCount, bool hasRolledDice
});


@override $DiceCopyWith<$Res> get currentDice;@override $BoardPathCopyWith<$Res> get boardPath;

}
/// @nodoc
class __$GameStateCopyWithImpl<$Res>
    implements _$GameStateCopyWith<$Res> {
  __$GameStateCopyWithImpl(this._self, this._then);

  final _GameState _self;
  final $Res Function(_GameState) _then;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? roomId = null,Object? players = null,Object? tokens = null,Object? currentDice = null,Object? phase = null,Object? boardPath = null,Object? activePlayerId = freezed,Object? winnerId = freezed,Object? consecutiveSixesCount = null,Object? hasRolledDice = null,}) {
  return _then(_GameState(
roomId: null == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String,players: null == players ? _self._players : players // ignore: cast_nullable_to_non_nullable
as List<Player>,tokens: null == tokens ? _self._tokens : tokens // ignore: cast_nullable_to_non_nullable
as List<Token>,currentDice: null == currentDice ? _self.currentDice : currentDice // ignore: cast_nullable_to_non_nullable
as Dice,phase: null == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as GamePhase,boardPath: null == boardPath ? _self.boardPath : boardPath // ignore: cast_nullable_to_non_nullable
as BoardPath,activePlayerId: freezed == activePlayerId ? _self.activePlayerId : activePlayerId // ignore: cast_nullable_to_non_nullable
as String?,winnerId: freezed == winnerId ? _self.winnerId : winnerId // ignore: cast_nullable_to_non_nullable
as String?,consecutiveSixesCount: null == consecutiveSixesCount ? _self.consecutiveSixesCount : consecutiveSixesCount // ignore: cast_nullable_to_non_nullable
as int,hasRolledDice: null == hasRolledDice ? _self.hasRolledDice : hasRolledDice // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DiceCopyWith<$Res> get currentDice {
  
  return $DiceCopyWith<$Res>(_self.currentDice, (value) {
    return _then(_self.copyWith(currentDice: value));
  });
}/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BoardPathCopyWith<$Res> get boardPath {
  
  return $BoardPathCopyWith<$Res>(_self.boardPath, (value) {
    return _then(_self.copyWith(boardPath: value));
  });
}
}

// dart format on
