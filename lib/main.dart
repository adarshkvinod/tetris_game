import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tetris/game.dart';
import 'package:tetris/views/splash_screen.dart';
import 'package:tetris/views/tetris_screen.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';

import 'bloc/tetris_bloc.dart';
import 'bloc/tetris_event.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp( TetrisApp());
}

class TetrisApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TheResponsiveBuilder(
      baselineHeight: 932,
      baselineWidth: 430,
      enableTextScaleFactor: false,
      builder: (context, orientation, screenType) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => TetrisBloc()..add(StartGame()),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Tetris',
          home: BlocProvider(
            create: (_) => TetrisBloc()..add(StartGame()),
            child: SplashScreen(),
          ),
        ),
      ),
    );
  }
}
