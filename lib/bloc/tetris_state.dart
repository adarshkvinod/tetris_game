import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../entities/piece.dart';

part 'tetris_state.freezed.dart';

@freezed
class TetrisState with _$TetrisState {
  const factory TetrisState({
    required List<List<Color?>> board,
    required Piece currentPiece,
    Piece? nextPiece,
    required int score,
    required int level,
    @Default(false) bool isGameOver,
    @Default(0) int highScore,
  }) = _TetrisState;
}
