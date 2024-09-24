import 'dart:math';
import 'package:flutter/material.dart';
import '../bloc/tetris_event.dart';
import 'position.dart';

class Piece {
  final List<Position> positions;
  final Color color;

  Piece(this.positions, this.color);

  Piece move(Direction direction) {
    return Piece(
      positions.map((pos) => pos.move(direction)).toList(),
      color,
    );
  }

  Piece rotate() {
    final center = positions[1];
    return Piece(
      positions.map((pos) => pos.rotateAround(center)).toList(),
      color,
    );
  }

  static Piece random() {
    final shapes = [
      _IShape(),
      _JShape(),
      _LShape(),
      _OShape(),
      _SShape(),
      _TShape(),
      _ZShape(),
    ];
    return shapes[Random().nextInt(shapes.length)];
  }
}

// Define your shapes here (_IShape, _JShape, etc.)
// Tetromino shapes
Piece _IShape() => Piece(
    [Position(0, 1), Position(1, 1), Position(2, 1), Position(3, 1)],
    Colors.cyan);
Piece _JShape() => Piece(
    [Position(0, 0), Position(0, 1), Position(1, 1), Position(2, 1)],
    Colors.blue);
Piece _LShape() => Piece(
    [Position(2, 0), Position(0, 1), Position(1, 1), Position(2, 1)],
    Colors.orange);
Piece _OShape() => Piece(
    [Position(0, 0), Position(1, 0), Position(0, 1), Position(1, 1)],
    Colors.yellow);
Piece _SShape() => Piece(
    [Position(1, 0), Position(2, 0), Position(0, 1), Position(1, 1)],
    Colors.green);
Piece _TShape() => Piece(
    [Position(1, 0), Position(0, 1), Position(1, 1), Position(2, 1)],
    Colors.purple);
Piece _ZShape() => Piece(
    [Position(0, 0), Position(1, 0), Position(1, 1), Position(2, 1)],
    Colors.red);
