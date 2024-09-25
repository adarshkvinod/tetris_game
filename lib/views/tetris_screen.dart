import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';
import '../bloc/tetris_bloc.dart';
import '../bloc/tetris_event.dart';
import '../bloc/tetris_state.dart';
import 'constants/app_images.dart';
import 'game_board.dart';
import 'game_controls.dart';

class TetrisScreen extends StatefulWidget {
  @override
  State<TetrisScreen> createState() => _TetrisScreenState();
}

class _TetrisScreenState extends State<TetrisScreen> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    // Add the observer
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    // Remove the observer
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final bloc = BlocProvider.of<TetrisBloc>(context);
    if (state == AppLifecycleState.paused) {
      // Pause the game when the app is minimized or goes into the background
      bloc.add( PauseGame());
    } else if (state == AppLifecycleState.resumed) {
      // Resume the game when the app comes back to the foreground
      bloc.add( ResumeGame());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TetrisBloc, TetrisState>(
      builder: (context, state) {
        TetrisBloc bloc = BlocProvider.of<TetrisBloc>(context);
        return Scaffold(
          backgroundColor: Colors.black,
          body: Container(
            height: 100.h,
            width: 100.w,
            decoration: const BoxDecoration(
              color: Color(0xFF060110),
              image: DecorationImage(
                image: AssetImage(AppImages.screenBgImage),
                opacity: 0.3,
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: 24),
                Expanded(
                  flex: 4,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.dp),
                      child: GameBoard(), // Display game board
                    ),
                  ),
                ),
                if (!state.isGameOver)
                  Expanded(
                    flex: 2,
                    child: GameControls(), // Display game controls
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
