import '../bloc/tetris_event.dart';

enum PieceDirection {
  left,
  right,
  down,
}


class Position {
  final int x;
  final int y;

  Position(this.x, this.y);

  Position move(Direction direction) {
    switch (direction) {
      case Direction.left:
        return Position(x - 1, y);
      case Direction.right:
        return Position(x + 1, y);
      case Direction.down:
        return Position(x, y + 1);
    }
  }

  Position rotateAround(Position center) {
    final dx = x - center.x;
    final dy = y - center.y;
    return Position(center.x - dy, center.y + dx);
  }
}
