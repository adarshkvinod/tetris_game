import 'package:freezed_annotation/freezed_annotation.dart';

part 'tetris_event.freezed.dart';

enum Direction { left, right, down }

@freezed
class TetrisEvent with _$TetrisEvent {
  const factory TetrisEvent.startGame() = StartGame;
  const factory TetrisEvent.movePiece(Direction direction) = MovePiece;
  const factory TetrisEvent.rotatePiece() = RotatePiece;
  const factory TetrisEvent.tick() = Tick;
  const factory TetrisEvent.newGame() = NewGame;
}
