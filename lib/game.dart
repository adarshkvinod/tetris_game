import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Events
abstract class TetrisEvent {}
class StartGame extends TetrisEvent {}
class MovePiece extends TetrisEvent {
  final Direction direction;
  MovePiece(this.direction);
}
class RotatePiece extends TetrisEvent {}
class Tick extends TetrisEvent {}
class NewGame extends TetrisEvent {} // New event for starting a new game

// States
class TetrisState {
  final List<List<Color?>> board;
  final Piece currentPiece;
  final Piece? nextPiece;
  final int score;
  final int level;
  final bool isGameOver;
  final int highScore; // High score field

  TetrisState({
    required this.board,
    required this.currentPiece,
    this.nextPiece,
    required this.score,
    required this.level,
    this.isGameOver = false,
    this.highScore = 0, // Initialize high score
  });

  TetrisState copyWith({
    List<List<Color?>>? board,
    Piece? currentPiece,
    Piece? nextPiece,
    int? score,
    int? level,
    bool? isGameOver,
    int? highScore, // Add high score to copyWith
  }) {
    return TetrisState(
      board: board ?? this.board,
      currentPiece: currentPiece ?? this.currentPiece,
      nextPiece: nextPiece ?? this.nextPiece,
      score: score ?? this.score,
      level: level ?? this.level,
      isGameOver: isGameOver ?? this.isGameOver,
      highScore: highScore ?? this.highScore, // Include high score
    );
  }
}

// BLoC
class TetrisBloc extends Bloc<TetrisEvent, TetrisState> {
  static const int BOARD_WIDTH = 10;
  static const int BOARD_HEIGHT = 10;
  static const int INITIAL_GAME_SPEED = 1000; // Reduced falling speed

  Timer? _timer;

  TetrisBloc() : super(TetrisState(
    board: List.generate(BOARD_HEIGHT, (_) => List.filled(BOARD_WIDTH, null)),
    currentPiece: Piece.random(),
    nextPiece: Piece.random(),
    score: 0,
    level: 1,
    highScore: 0, // Initialize high score
  )) {
    on<StartGame>(_onStartGame);
    on<NewGame>(_onNewGame); // Handle new game event
    on<MovePiece>(_onMovePiece);
    on<RotatePiece>(_onRotatePiece);
    on<Tick>(_onTick);
  }

  void _onStartGame(StartGame event, Emitter<TetrisState> emit) {
    _timer?.cancel();
    _timer = Timer.periodic(Duration(milliseconds: INITIAL_GAME_SPEED), (_) => add(Tick()));
    emit(state.copyWith(
      board: List.generate(BOARD_HEIGHT, (_) => List.filled(BOARD_WIDTH, null)),
      currentPiece: Piece.random(),
      nextPiece: Piece.random(),
      score: 0,
      level: 1,
      isGameOver: false,
    ));
  }

  void _onNewGame(NewGame event, Emitter<TetrisState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    debugPrint(prefs.getInt('highScore').toString(),);
    final storedHighScore = prefs.getInt('highScore') ?? 0;
    _timer?.cancel(); // Stop any existing timer
    emit(TetrisState(
      board: List.generate(BOARD_HEIGHT, (_) => List.filled(BOARD_WIDTH, null)),
      currentPiece: Piece.random(),
      nextPiece: Piece.random(),
      score: 0,
      level: 1,
      isGameOver: false,
      highScore: storedHighScore,
    ));
    _timer = Timer.periodic(Duration(milliseconds: INITIAL_GAME_SPEED), (_) => add(Tick()));
  }

  void _onMovePiece(MovePiece event, Emitter<TetrisState> emit) {
    if (state.isGameOver) return; // Prevent moving after game over
    final newPiece = state.currentPiece.move(event.direction);
    if (_isValidPosition(newPiece)) {
      emit(state.copyWith(currentPiece: newPiece));
    } else if (event.direction == Direction.down) {
      _placePiece(emit);
    }
  }

  void _onRotatePiece(RotatePiece event, Emitter<TetrisState> emit) {
    if (state.isGameOver) return; // Prevent rotation after game over
    final newPiece = state.currentPiece.rotate();
    if (_isValidPosition(newPiece)) {
      emit(state.copyWith(currentPiece: newPiece));
    }
  }

  void _onTick(Tick event, Emitter<TetrisState> emit) {
    if (state.isGameOver) return; // Stop game ticking after game over
    final newPiece = state.currentPiece.move(Direction.down);
    if (_isValidPosition(newPiece)) {
      emit(state.copyWith(currentPiece: newPiece));
    } else {
      _placePiece(emit);
    }
  }

  bool _isValidPosition(Piece piece) {
    for (final position in piece.positions) {
      if (position.x < 0 || position.x >= BOARD_WIDTH ||
          position.y >= BOARD_HEIGHT ||
          (position.y >= 0 && state.board[position.y][position.x] != null)) {
        return false;
      }
    }
    return true;
  }


  void _placePiece(Emitter<TetrisState> emit) {
    final newBoard = List<List<Color?>>.from(state.board);

    // Place the current piece on the board
    for (final position in state.currentPiece.positions) {
      // Game over if any part of the piece is above the board (position.y < 0)
      if (position.y < 0) {
        _updateHighScore(state.score);
        emit(state.copyWith(isGameOver: true));
        _timer?.cancel();
        return;
      }
      // Place the current piece's color on the board
      newBoard[position.y][position.x] = state.currentPiece.color;
    }

    // Clear lines if any and calculate score
    final clearedLines = _clearLines(newBoard);
    final newScore = state.score + _calculateScore(clearedLines);
    final newLevel = (newScore / 1000).floor() + 1;

    // Check if the game is over when spawning a new piece
    final nextPiece = state.nextPiece ?? Piece.random();
    if (!_isValidPosition(nextPiece)) {
      emit(state.copyWith(isGameOver: true));
      _timer?.cancel();
      return;
    }

    // Update speed when level changes
    if (newLevel > state.level) {
      _timer?.cancel();
      _timer = Timer.periodic(
        Duration(milliseconds: INITIAL_GAME_SPEED ~/ newLevel),
            (_) => add(Tick()),
      );
    }

    // Emit new state after placing the piece and updating score/level
    emit(state.copyWith(
      board: newBoard,
      currentPiece: nextPiece,
      nextPiece: Piece.random(),
      score: newScore,
      level: newLevel,
      highScore: state.highScore<newScore ? newScore:state.highScore
    ));
    _updateHighScore(state.score);

  }


  int _clearLines(List<List<Color?>> board) {
    int linesCleared = 0;
    for (int y = BOARD_HEIGHT - 1; y >= 0; y--) {
      if (board[y].every((cell) => cell != null)) {
        board.removeAt(y);
        board.insert(0, List.filled(BOARD_WIDTH, null));
        linesCleared++;
      }
    }
    return linesCleared;
  }

  int _calculateScore(int linesCleared) {
    switch (linesCleared) {
      case 1:
        return 100;
      case 2:
        return 300;
      case 3:
        return 500;
      case 4:
        return 800; // Tetris score for clearing 4 lines at once
      default:
        return 0;
    }
  }

  void _updateHighScore(int currentScore) async {
    final prefs = await SharedPreferences.getInstance();
    final storedHighScore = prefs.getInt('highScore') ?? 0;

    if (currentScore > storedHighScore) {
      await prefs.setInt('highScore', currentScore);

    }
    debugPrint(prefs.getInt('highScore').toString());
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}

// Piece class
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
    final center = positions[1];  // Assume the second position is the center
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

// Tetromino shapes
Piece _IShape() => Piece([Position(0, 1), Position(1, 1), Position(2, 1), Position(3, 1)], Colors.cyan);
Piece _JShape() => Piece([Position(0, 0), Position(0, 1), Position(1, 1), Position(2, 1)], Colors.blue);
Piece _LShape() => Piece([Position(2, 0), Position(0, 1), Position(1, 1), Position(2, 1)], Colors.orange);
Piece _OShape() => Piece([Position(0, 0), Position(1, 0), Position(0, 1), Position(1, 1)], Colors.yellow);
Piece _SShape() => Piece([Position(1, 0), Position(2, 0), Position(0, 1), Position(1, 1)], Colors.green);
Piece _TShape() => Piece([Position(1, 0), Position(0, 1), Position(1, 1), Position(2, 1)], Colors.purple);
Piece _ZShape() => Piece([Position(0, 0), Position(1, 0), Position(1, 1), Position(2, 1)], Colors.red);

// Directions
enum Direction { left, right, down }

// Tetris UI classes

class TetrisScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TetrisBloc, TetrisState>(
        builder: (context, state){
          TetrisBloc bloc = BlocProvider.of<TetrisBloc>(context);
        return Scaffold(
          backgroundColor: Colors.black,
          // appBar: AppBar(
          //   title: Text('Tetris',style: TextStyle(color: Colors.white),),
          //   centerTitle: true,
          //   backgroundColor: Colors.black,
          // ),
          body: Column(
            children: [
              SizedBox(
                height: 56,
              ),
              Expanded(
                flex: 3,
                child: Center(child: GameBoard()),
              ),
              if (!state.isGameOver)
              Expanded(
                flex: 2,
                child: GameControls(),
              ),
            ],
          ),
        );
      }
    );
  }
}

// Game board UI
class GameBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TetrisBloc, TetrisState>(
      builder: (context, state) {
        TetrisBloc bloc = BlocProvider.of<TetrisBloc>(context);
        if (state.isGameOver) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Game Over',
                style: TextStyle(color: Colors.red, fontSize: 48),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: ElevatedButton(
                  onPressed: () => bloc.add(NewGame()), // Start a new game
                  child: Text('New Game'),
                ),
              ),
            ],
          );
        }

        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: TetrisBloc.BOARD_WIDTH,
          ),
          itemCount: TetrisBloc.BOARD_WIDTH * TetrisBloc.BOARD_HEIGHT,
          itemBuilder: (context, index) {
            final x = index % TetrisBloc.BOARD_WIDTH;
            final y = index ~/ TetrisBloc.BOARD_WIDTH;
            final color = _getColorForCell(state, x, y);

            return Container(
              margin: EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: color ?? Colors.grey[900],
                borderRadius: BorderRadius.circular(3),
              ),
            );
          },
        );
      },
    );
  }

  Color? _getColorForCell(TetrisState state, int x, int y) {
    // Check if the current piece occupies this position
    for (final position in state.currentPiece.positions) {
      if (position.x == x && position.y == y) {
        return state.currentPiece.color;
      }
    }

    // Check if there's a piece already placed on the board
    return state.board[y][x];
  }
}

// Game controls UI
class GameControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<TetrisBloc, TetrisState>(
        builder: (context, state) {
          TetrisBloc bloc = BlocProvider.of<TetrisBloc>(context);
        return Column(
          children: [
            SizedBox(
              height: 24,
            ),
            Text(
              'Score: ${bloc.state.score}',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              'High Score: ${bloc.state.highScore}', // Display high score
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              'Level: ${bloc.state.level}',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    onPressed: () => bloc.add(MovePiece(Direction.left)),
                    child: Icon(Icons.arrow_left),
                    backgroundColor: Colors.white,
                  ),
                  FloatingActionButton(
                    onPressed: () => bloc.add(RotatePiece()),
                    child: Icon(Icons.rotate_90_degrees_cw),
                    backgroundColor: Colors.white,
                  ),
                  FloatingActionButton(
                    onPressed: () => bloc.add(MovePiece(Direction.right)),
                    child: Icon(Icons.arrow_right),
                    backgroundColor: Colors.white,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: FloatingActionButton(
                onPressed: () => bloc.add(MovePiece(Direction.down)),
                child: Icon(Icons.arrow_drop_down),
                backgroundColor: Colors.white,
              ),
            ),

          ],
        );
      }
    );
  }
}
