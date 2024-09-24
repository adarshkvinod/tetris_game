// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tetris_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TetrisState {
  List<List<Color?>> get board => throw _privateConstructorUsedError;
  Piece get currentPiece => throw _privateConstructorUsedError;
  Piece? get nextPiece => throw _privateConstructorUsedError;
  int get score => throw _privateConstructorUsedError;
  int get level => throw _privateConstructorUsedError;
  bool get isGameOver => throw _privateConstructorUsedError;
  int get highScore => throw _privateConstructorUsedError;

  /// Create a copy of TetrisState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TetrisStateCopyWith<TetrisState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TetrisStateCopyWith<$Res> {
  factory $TetrisStateCopyWith(
          TetrisState value, $Res Function(TetrisState) then) =
      _$TetrisStateCopyWithImpl<$Res, TetrisState>;
  @useResult
  $Res call(
      {List<List<Color?>> board,
      Piece currentPiece,
      Piece? nextPiece,
      int score,
      int level,
      bool isGameOver,
      int highScore});
}

/// @nodoc
class _$TetrisStateCopyWithImpl<$Res, $Val extends TetrisState>
    implements $TetrisStateCopyWith<$Res> {
  _$TetrisStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TetrisState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? board = null,
    Object? currentPiece = freezed,
    Object? nextPiece = freezed,
    Object? score = null,
    Object? level = null,
    Object? isGameOver = null,
    Object? highScore = null,
  }) {
    return _then(_value.copyWith(
      board: null == board
          ? _value.board
          : board // ignore: cast_nullable_to_non_nullable
              as List<List<Color?>>,
      currentPiece: freezed == currentPiece
          ? _value.currentPiece
          : currentPiece // ignore: cast_nullable_to_non_nullable
              as Piece,
      nextPiece: freezed == nextPiece
          ? _value.nextPiece
          : nextPiece // ignore: cast_nullable_to_non_nullable
              as Piece?,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      isGameOver: null == isGameOver
          ? _value.isGameOver
          : isGameOver // ignore: cast_nullable_to_non_nullable
              as bool,
      highScore: null == highScore
          ? _value.highScore
          : highScore // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TetrisStateImplCopyWith<$Res>
    implements $TetrisStateCopyWith<$Res> {
  factory _$$TetrisStateImplCopyWith(
          _$TetrisStateImpl value, $Res Function(_$TetrisStateImpl) then) =
      __$$TetrisStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<List<Color?>> board,
      Piece currentPiece,
      Piece? nextPiece,
      int score,
      int level,
      bool isGameOver,
      int highScore});
}

/// @nodoc
class __$$TetrisStateImplCopyWithImpl<$Res>
    extends _$TetrisStateCopyWithImpl<$Res, _$TetrisStateImpl>
    implements _$$TetrisStateImplCopyWith<$Res> {
  __$$TetrisStateImplCopyWithImpl(
      _$TetrisStateImpl _value, $Res Function(_$TetrisStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TetrisState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? board = null,
    Object? currentPiece = freezed,
    Object? nextPiece = freezed,
    Object? score = null,
    Object? level = null,
    Object? isGameOver = null,
    Object? highScore = null,
  }) {
    return _then(_$TetrisStateImpl(
      board: null == board
          ? _value._board
          : board // ignore: cast_nullable_to_non_nullable
              as List<List<Color?>>,
      currentPiece: freezed == currentPiece
          ? _value.currentPiece
          : currentPiece // ignore: cast_nullable_to_non_nullable
              as Piece,
      nextPiece: freezed == nextPiece
          ? _value.nextPiece
          : nextPiece // ignore: cast_nullable_to_non_nullable
              as Piece?,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      isGameOver: null == isGameOver
          ? _value.isGameOver
          : isGameOver // ignore: cast_nullable_to_non_nullable
              as bool,
      highScore: null == highScore
          ? _value.highScore
          : highScore // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$TetrisStateImpl implements _TetrisState {
  const _$TetrisStateImpl(
      {required final List<List<Color?>> board,
      required this.currentPiece,
      this.nextPiece,
      required this.score,
      required this.level,
      this.isGameOver = false,
      this.highScore = 0})
      : _board = board;

  final List<List<Color?>> _board;
  @override
  List<List<Color?>> get board {
    if (_board is EqualUnmodifiableListView) return _board;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_board);
  }

  @override
  final Piece currentPiece;
  @override
  final Piece? nextPiece;
  @override
  final int score;
  @override
  final int level;
  @override
  @JsonKey()
  final bool isGameOver;
  @override
  @JsonKey()
  final int highScore;

  @override
  String toString() {
    return 'TetrisState(board: $board, currentPiece: $currentPiece, nextPiece: $nextPiece, score: $score, level: $level, isGameOver: $isGameOver, highScore: $highScore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TetrisStateImpl &&
            const DeepCollectionEquality().equals(other._board, _board) &&
            const DeepCollectionEquality()
                .equals(other.currentPiece, currentPiece) &&
            const DeepCollectionEquality().equals(other.nextPiece, nextPiece) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.isGameOver, isGameOver) ||
                other.isGameOver == isGameOver) &&
            (identical(other.highScore, highScore) ||
                other.highScore == highScore));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_board),
      const DeepCollectionEquality().hash(currentPiece),
      const DeepCollectionEquality().hash(nextPiece),
      score,
      level,
      isGameOver,
      highScore);

  /// Create a copy of TetrisState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TetrisStateImplCopyWith<_$TetrisStateImpl> get copyWith =>
      __$$TetrisStateImplCopyWithImpl<_$TetrisStateImpl>(this, _$identity);
}

abstract class _TetrisState implements TetrisState {
  const factory _TetrisState(
      {required final List<List<Color?>> board,
      required final Piece currentPiece,
      final Piece? nextPiece,
      required final int score,
      required final int level,
      final bool isGameOver,
      final int highScore}) = _$TetrisStateImpl;

  @override
  List<List<Color?>> get board;
  @override
  Piece get currentPiece;
  @override
  Piece? get nextPiece;
  @override
  int get score;
  @override
  int get level;
  @override
  bool get isGameOver;
  @override
  int get highScore;

  /// Create a copy of TetrisState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TetrisStateImplCopyWith<_$TetrisStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
