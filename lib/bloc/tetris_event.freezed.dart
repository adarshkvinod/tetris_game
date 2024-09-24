// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tetris_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TetrisEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startGame,
    required TResult Function(Direction direction) movePiece,
    required TResult Function() rotatePiece,
    required TResult Function() tick,
    required TResult Function() newGame,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startGame,
    TResult? Function(Direction direction)? movePiece,
    TResult? Function()? rotatePiece,
    TResult? Function()? tick,
    TResult? Function()? newGame,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startGame,
    TResult Function(Direction direction)? movePiece,
    TResult Function()? rotatePiece,
    TResult Function()? tick,
    TResult Function()? newGame,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartGame value) startGame,
    required TResult Function(MovePiece value) movePiece,
    required TResult Function(RotatePiece value) rotatePiece,
    required TResult Function(Tick value) tick,
    required TResult Function(NewGame value) newGame,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartGame value)? startGame,
    TResult? Function(MovePiece value)? movePiece,
    TResult? Function(RotatePiece value)? rotatePiece,
    TResult? Function(Tick value)? tick,
    TResult? Function(NewGame value)? newGame,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartGame value)? startGame,
    TResult Function(MovePiece value)? movePiece,
    TResult Function(RotatePiece value)? rotatePiece,
    TResult Function(Tick value)? tick,
    TResult Function(NewGame value)? newGame,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TetrisEventCopyWith<$Res> {
  factory $TetrisEventCopyWith(
          TetrisEvent value, $Res Function(TetrisEvent) then) =
      _$TetrisEventCopyWithImpl<$Res, TetrisEvent>;
}

/// @nodoc
class _$TetrisEventCopyWithImpl<$Res, $Val extends TetrisEvent>
    implements $TetrisEventCopyWith<$Res> {
  _$TetrisEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TetrisEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartGameImplCopyWith<$Res> {
  factory _$$StartGameImplCopyWith(
          _$StartGameImpl value, $Res Function(_$StartGameImpl) then) =
      __$$StartGameImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartGameImplCopyWithImpl<$Res>
    extends _$TetrisEventCopyWithImpl<$Res, _$StartGameImpl>
    implements _$$StartGameImplCopyWith<$Res> {
  __$$StartGameImplCopyWithImpl(
      _$StartGameImpl _value, $Res Function(_$StartGameImpl) _then)
      : super(_value, _then);

  /// Create a copy of TetrisEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartGameImpl implements StartGame {
  const _$StartGameImpl();

  @override
  String toString() {
    return 'TetrisEvent.startGame()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartGameImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startGame,
    required TResult Function(Direction direction) movePiece,
    required TResult Function() rotatePiece,
    required TResult Function() tick,
    required TResult Function() newGame,
  }) {
    return startGame();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startGame,
    TResult? Function(Direction direction)? movePiece,
    TResult? Function()? rotatePiece,
    TResult? Function()? tick,
    TResult? Function()? newGame,
  }) {
    return startGame?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startGame,
    TResult Function(Direction direction)? movePiece,
    TResult Function()? rotatePiece,
    TResult Function()? tick,
    TResult Function()? newGame,
    required TResult orElse(),
  }) {
    if (startGame != null) {
      return startGame();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartGame value) startGame,
    required TResult Function(MovePiece value) movePiece,
    required TResult Function(RotatePiece value) rotatePiece,
    required TResult Function(Tick value) tick,
    required TResult Function(NewGame value) newGame,
  }) {
    return startGame(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartGame value)? startGame,
    TResult? Function(MovePiece value)? movePiece,
    TResult? Function(RotatePiece value)? rotatePiece,
    TResult? Function(Tick value)? tick,
    TResult? Function(NewGame value)? newGame,
  }) {
    return startGame?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartGame value)? startGame,
    TResult Function(MovePiece value)? movePiece,
    TResult Function(RotatePiece value)? rotatePiece,
    TResult Function(Tick value)? tick,
    TResult Function(NewGame value)? newGame,
    required TResult orElse(),
  }) {
    if (startGame != null) {
      return startGame(this);
    }
    return orElse();
  }
}

abstract class StartGame implements TetrisEvent {
  const factory StartGame() = _$StartGameImpl;
}

/// @nodoc
abstract class _$$MovePieceImplCopyWith<$Res> {
  factory _$$MovePieceImplCopyWith(
          _$MovePieceImpl value, $Res Function(_$MovePieceImpl) then) =
      __$$MovePieceImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Direction direction});
}

/// @nodoc
class __$$MovePieceImplCopyWithImpl<$Res>
    extends _$TetrisEventCopyWithImpl<$Res, _$MovePieceImpl>
    implements _$$MovePieceImplCopyWith<$Res> {
  __$$MovePieceImplCopyWithImpl(
      _$MovePieceImpl _value, $Res Function(_$MovePieceImpl) _then)
      : super(_value, _then);

  /// Create a copy of TetrisEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? direction = null,
  }) {
    return _then(_$MovePieceImpl(
      null == direction
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as Direction,
    ));
  }
}

/// @nodoc

class _$MovePieceImpl implements MovePiece {
  const _$MovePieceImpl(this.direction);

  @override
  final Direction direction;

  @override
  String toString() {
    return 'TetrisEvent.movePiece(direction: $direction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovePieceImpl &&
            (identical(other.direction, direction) ||
                other.direction == direction));
  }

  @override
  int get hashCode => Object.hash(runtimeType, direction);

  /// Create a copy of TetrisEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MovePieceImplCopyWith<_$MovePieceImpl> get copyWith =>
      __$$MovePieceImplCopyWithImpl<_$MovePieceImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startGame,
    required TResult Function(Direction direction) movePiece,
    required TResult Function() rotatePiece,
    required TResult Function() tick,
    required TResult Function() newGame,
  }) {
    return movePiece(direction);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startGame,
    TResult? Function(Direction direction)? movePiece,
    TResult? Function()? rotatePiece,
    TResult? Function()? tick,
    TResult? Function()? newGame,
  }) {
    return movePiece?.call(direction);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startGame,
    TResult Function(Direction direction)? movePiece,
    TResult Function()? rotatePiece,
    TResult Function()? tick,
    TResult Function()? newGame,
    required TResult orElse(),
  }) {
    if (movePiece != null) {
      return movePiece(direction);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartGame value) startGame,
    required TResult Function(MovePiece value) movePiece,
    required TResult Function(RotatePiece value) rotatePiece,
    required TResult Function(Tick value) tick,
    required TResult Function(NewGame value) newGame,
  }) {
    return movePiece(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartGame value)? startGame,
    TResult? Function(MovePiece value)? movePiece,
    TResult? Function(RotatePiece value)? rotatePiece,
    TResult? Function(Tick value)? tick,
    TResult? Function(NewGame value)? newGame,
  }) {
    return movePiece?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartGame value)? startGame,
    TResult Function(MovePiece value)? movePiece,
    TResult Function(RotatePiece value)? rotatePiece,
    TResult Function(Tick value)? tick,
    TResult Function(NewGame value)? newGame,
    required TResult orElse(),
  }) {
    if (movePiece != null) {
      return movePiece(this);
    }
    return orElse();
  }
}

abstract class MovePiece implements TetrisEvent {
  const factory MovePiece(final Direction direction) = _$MovePieceImpl;

  Direction get direction;

  /// Create a copy of TetrisEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MovePieceImplCopyWith<_$MovePieceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RotatePieceImplCopyWith<$Res> {
  factory _$$RotatePieceImplCopyWith(
          _$RotatePieceImpl value, $Res Function(_$RotatePieceImpl) then) =
      __$$RotatePieceImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RotatePieceImplCopyWithImpl<$Res>
    extends _$TetrisEventCopyWithImpl<$Res, _$RotatePieceImpl>
    implements _$$RotatePieceImplCopyWith<$Res> {
  __$$RotatePieceImplCopyWithImpl(
      _$RotatePieceImpl _value, $Res Function(_$RotatePieceImpl) _then)
      : super(_value, _then);

  /// Create a copy of TetrisEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RotatePieceImpl implements RotatePiece {
  const _$RotatePieceImpl();

  @override
  String toString() {
    return 'TetrisEvent.rotatePiece()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RotatePieceImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startGame,
    required TResult Function(Direction direction) movePiece,
    required TResult Function() rotatePiece,
    required TResult Function() tick,
    required TResult Function() newGame,
  }) {
    return rotatePiece();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startGame,
    TResult? Function(Direction direction)? movePiece,
    TResult? Function()? rotatePiece,
    TResult? Function()? tick,
    TResult? Function()? newGame,
  }) {
    return rotatePiece?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startGame,
    TResult Function(Direction direction)? movePiece,
    TResult Function()? rotatePiece,
    TResult Function()? tick,
    TResult Function()? newGame,
    required TResult orElse(),
  }) {
    if (rotatePiece != null) {
      return rotatePiece();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartGame value) startGame,
    required TResult Function(MovePiece value) movePiece,
    required TResult Function(RotatePiece value) rotatePiece,
    required TResult Function(Tick value) tick,
    required TResult Function(NewGame value) newGame,
  }) {
    return rotatePiece(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartGame value)? startGame,
    TResult? Function(MovePiece value)? movePiece,
    TResult? Function(RotatePiece value)? rotatePiece,
    TResult? Function(Tick value)? tick,
    TResult? Function(NewGame value)? newGame,
  }) {
    return rotatePiece?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartGame value)? startGame,
    TResult Function(MovePiece value)? movePiece,
    TResult Function(RotatePiece value)? rotatePiece,
    TResult Function(Tick value)? tick,
    TResult Function(NewGame value)? newGame,
    required TResult orElse(),
  }) {
    if (rotatePiece != null) {
      return rotatePiece(this);
    }
    return orElse();
  }
}

abstract class RotatePiece implements TetrisEvent {
  const factory RotatePiece() = _$RotatePieceImpl;
}

/// @nodoc
abstract class _$$TickImplCopyWith<$Res> {
  factory _$$TickImplCopyWith(
          _$TickImpl value, $Res Function(_$TickImpl) then) =
      __$$TickImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TickImplCopyWithImpl<$Res>
    extends _$TetrisEventCopyWithImpl<$Res, _$TickImpl>
    implements _$$TickImplCopyWith<$Res> {
  __$$TickImplCopyWithImpl(_$TickImpl _value, $Res Function(_$TickImpl) _then)
      : super(_value, _then);

  /// Create a copy of TetrisEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TickImpl implements Tick {
  const _$TickImpl();

  @override
  String toString() {
    return 'TetrisEvent.tick()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TickImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startGame,
    required TResult Function(Direction direction) movePiece,
    required TResult Function() rotatePiece,
    required TResult Function() tick,
    required TResult Function() newGame,
  }) {
    return tick();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startGame,
    TResult? Function(Direction direction)? movePiece,
    TResult? Function()? rotatePiece,
    TResult? Function()? tick,
    TResult? Function()? newGame,
  }) {
    return tick?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startGame,
    TResult Function(Direction direction)? movePiece,
    TResult Function()? rotatePiece,
    TResult Function()? tick,
    TResult Function()? newGame,
    required TResult orElse(),
  }) {
    if (tick != null) {
      return tick();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartGame value) startGame,
    required TResult Function(MovePiece value) movePiece,
    required TResult Function(RotatePiece value) rotatePiece,
    required TResult Function(Tick value) tick,
    required TResult Function(NewGame value) newGame,
  }) {
    return tick(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartGame value)? startGame,
    TResult? Function(MovePiece value)? movePiece,
    TResult? Function(RotatePiece value)? rotatePiece,
    TResult? Function(Tick value)? tick,
    TResult? Function(NewGame value)? newGame,
  }) {
    return tick?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartGame value)? startGame,
    TResult Function(MovePiece value)? movePiece,
    TResult Function(RotatePiece value)? rotatePiece,
    TResult Function(Tick value)? tick,
    TResult Function(NewGame value)? newGame,
    required TResult orElse(),
  }) {
    if (tick != null) {
      return tick(this);
    }
    return orElse();
  }
}

abstract class Tick implements TetrisEvent {
  const factory Tick() = _$TickImpl;
}

/// @nodoc
abstract class _$$NewGameImplCopyWith<$Res> {
  factory _$$NewGameImplCopyWith(
          _$NewGameImpl value, $Res Function(_$NewGameImpl) then) =
      __$$NewGameImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NewGameImplCopyWithImpl<$Res>
    extends _$TetrisEventCopyWithImpl<$Res, _$NewGameImpl>
    implements _$$NewGameImplCopyWith<$Res> {
  __$$NewGameImplCopyWithImpl(
      _$NewGameImpl _value, $Res Function(_$NewGameImpl) _then)
      : super(_value, _then);

  /// Create a copy of TetrisEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$NewGameImpl implements NewGame {
  const _$NewGameImpl();

  @override
  String toString() {
    return 'TetrisEvent.newGame()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NewGameImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startGame,
    required TResult Function(Direction direction) movePiece,
    required TResult Function() rotatePiece,
    required TResult Function() tick,
    required TResult Function() newGame,
  }) {
    return newGame();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startGame,
    TResult? Function(Direction direction)? movePiece,
    TResult? Function()? rotatePiece,
    TResult? Function()? tick,
    TResult? Function()? newGame,
  }) {
    return newGame?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startGame,
    TResult Function(Direction direction)? movePiece,
    TResult Function()? rotatePiece,
    TResult Function()? tick,
    TResult Function()? newGame,
    required TResult orElse(),
  }) {
    if (newGame != null) {
      return newGame();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartGame value) startGame,
    required TResult Function(MovePiece value) movePiece,
    required TResult Function(RotatePiece value) rotatePiece,
    required TResult Function(Tick value) tick,
    required TResult Function(NewGame value) newGame,
  }) {
    return newGame(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartGame value)? startGame,
    TResult? Function(MovePiece value)? movePiece,
    TResult? Function(RotatePiece value)? rotatePiece,
    TResult? Function(Tick value)? tick,
    TResult? Function(NewGame value)? newGame,
  }) {
    return newGame?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartGame value)? startGame,
    TResult Function(MovePiece value)? movePiece,
    TResult Function(RotatePiece value)? rotatePiece,
    TResult Function(Tick value)? tick,
    TResult Function(NewGame value)? newGame,
    required TResult orElse(),
  }) {
    if (newGame != null) {
      return newGame(this);
    }
    return orElse();
  }
}

abstract class NewGame implements TetrisEvent {
  const factory NewGame() = _$NewGameImpl;
}
