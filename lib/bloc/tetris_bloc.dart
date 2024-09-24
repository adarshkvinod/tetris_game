import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../entities/piece.dart';
import 'tetris_event.dart';
import 'tetris_state.dart';

class TetrisBloc extends Bloc<TetrisEvent, TetrisState> {
  static const int BOARD_WIDTH = 10;
  static const int BOARD_HEIGHT = 10;
  static const int INITIAL_GAME_SPEED = 1000; // Initial falling speed in milliseconds

  Timer? _timer;

  TetrisBloc()
      : super(TetrisState(
    board: List.generate(BOARD_HEIGHT, (_) => List.filled(BOARD_WIDTH, null)),
    currentPiece: Piece.random(),
    nextPiece: Piece.random(),
    score: 0,
    level: 1,
  )) {
    on<StartGame>(_onStartGame);
    on<NewGame>(_onNewGame);
    on<MovePiece>(_onMovePiece);
    on<RotatePiece>(_onRotatePiece);
    on<Tick>(_onTick);
  }

  // Start the game
  void _onStartGame(StartGame event, Emitter<TetrisState> emit) {
    _timer?.cancel();
    _timer = Timer.periodic(
      const Duration(milliseconds: INITIAL_GAME_SPEED),
          (_) => add(const TetrisEvent.tick()),
    );
    emit(state.copyWith(
      board: List.generate(BOARD_HEIGHT, (_) => List.filled(BOARD_WIDTH, null)),
      currentPiece: Piece.random(),
      nextPiece: Piece.random(),
      score: 0,
      level: 1,
      isGameOver: false,
    ));
  }

  // Start a new game
  void _onNewGame(NewGame event, Emitter<TetrisState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    final storedHighScore = prefs.getInt('highScore') ?? 0;
    _timer?.cancel();
    emit(TetrisState(
      board: List.generate(BOARD_HEIGHT, (_) => List.filled(BOARD_WIDTH, null)),
      currentPiece: Piece.random(),
      nextPiece: Piece.random(),
      score: 0,
      level: 1,
      isGameOver: false,
      highScore: storedHighScore,
    ));
    _timer = Timer.periodic(
      const Duration(milliseconds: INITIAL_GAME_SPEED),
          (_) => add(const TetrisEvent.tick()),
    );
  }

  // Handle piece movement
  void _onMovePiece(MovePiece event, Emitter<TetrisState> emit) {
    if (state.isGameOver) return;
    final newPiece = state.currentPiece.move(event.direction);
    if (_isValidPosition(newPiece)) {
      emit(state.copyWith(currentPiece: newPiece));
    } else if (event.direction == Direction.down) {
      _placePiece(emit);
    }
  }

  // Handle piece rotation
  void _onRotatePiece(RotatePiece event, Emitter<TetrisState> emit) {
    if (state.isGameOver) return;
    final newPiece = state.currentPiece.rotate();
    if (_isValidPosition(newPiece)) {
      emit(state.copyWith(currentPiece: newPiece));
    }
  }

  // Game tick (piece falls)
  void _onTick(Tick event, Emitter<TetrisState> emit) {
    if (state.isGameOver) return;
    final newPiece = state.currentPiece.move(Direction.down);
    if (_isValidPosition(newPiece)) {
      emit(state.copyWith(currentPiece: newPiece));
    } else {
      _placePiece(emit);
    }
  }

  // Check if the current piece's position is valid
  bool _isValidPosition(Piece piece) {
    for (final position in piece.positions) {
      if (position.x < 0 ||
          position.x >= BOARD_WIDTH ||
          position.y >= BOARD_HEIGHT ||
          (position.y >= 0 && state.board[position.y][position.x] != null)) {
        return false;
      }
    }
    return true;
  }

  // Place the current piece on the board and generate a new piece
  void _placePiece(Emitter<TetrisState> emit) {
    final newBoard = List<List<Color?>>.from(state.board);

    for (final position in state.currentPiece.positions) {
      if (position.y < 0) {
        _updateHighScore(state.score);
        emit(state.copyWith(isGameOver: true));
        _timer?.cancel();
        return;
      }
      newBoard[position.y][position.x] = state.currentPiece.color;
    }

    final clearedLines = _clearLines(newBoard);
    final newScore = state.score + _calculateScore(clearedLines);
    final newLevel = (newScore / 1000).floor() + 1;

    final nextPiece = state.nextPiece ?? Piece.random();
    if (!_isValidPosition(nextPiece)) {
      emit(state.copyWith(isGameOver: true));
      _timer?.cancel();
      return;
    }

    if (newLevel > state.level) {
      _timer?.cancel();
      _timer = Timer.periodic(
        Duration(milliseconds: INITIAL_GAME_SPEED ~/ newLevel),
            (_) => add(const TetrisEvent.tick()),
      );
    }

    emit(state.copyWith(
      board: newBoard,
      currentPiece: nextPiece,
      nextPiece: Piece.random(),
      score: newScore,
      level: newLevel,
      highScore: state.highScore < newScore ? newScore : state.highScore,
    ));

    _updateHighScore(newScore);
  }

  // Clear completed lines from the board
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

  // Calculate the score based on the number of cleared lines
  int _calculateScore(int linesCleared) {
    switch (linesCleared) {
      case 1:
        return 100;
      case 2:
        return 300;
      case 3:
        return 500;
      case 4:
        return 800;
      default:
        return 0;
    }
  }

  // Update the high score using SharedPreferences
  void _updateHighScore(int currentScore) async {
    final prefs = await SharedPreferences.getInstance();
    final storedHighScore = prefs.getInt('highScore') ?? 0;

    if (currentScore > storedHighScore) {
      await prefs.setInt('highScore', currentScore);
    }
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
