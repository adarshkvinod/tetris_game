import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/tetris_bloc.dart';
import '../bloc/tetris_event.dart';
import '../bloc/tetris_state.dart';

class GameControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TetrisBloc, TetrisState>(
      builder: (context, state) {
        TetrisBloc bloc = BlocProvider.of<TetrisBloc>(context);
        return Column(
          children: [
            SizedBox(height: 24),
            Text(
              'Score: ${bloc.state.score}',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              'High Score: ${bloc.state.highScore}', // High score
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
      },
    );
  }
}
