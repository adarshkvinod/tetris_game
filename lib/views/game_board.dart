import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/tetris_bloc.dart';
import '../bloc/tetris_event.dart';
import '../bloc/tetris_state.dart';

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
                  onPressed: () => bloc.add(NewGame()), // New Game event
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
