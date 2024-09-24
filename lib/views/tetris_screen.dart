import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/tetris_bloc.dart';
import '../bloc/tetris_state.dart';
import 'game_board.dart';
import 'game_controls.dart';

class TetrisScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TetrisBloc, TetrisState>(
      builder: (context, state) {
        TetrisBloc bloc = BlocProvider.of<TetrisBloc>(context);
        return Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            children: [
              SizedBox(height: 56),
              Expanded(
                flex: 3,
                child: Center(child: GameBoard()), // Display game board
              ),
              if (!state.isGameOver)
                Expanded(
                  flex: 2,
                  child: GameControls(), // Display game controls
                ),
            ],
          ),
        );
      },
    );
  }
}
