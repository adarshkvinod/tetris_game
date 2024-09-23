import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tetris/game.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp( TetrisApp());
}

class TetrisApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tetris',
      home: BlocProvider(
        create: (_) => TetrisBloc()..add(StartGame()),
        child: TetrisScreen(),
      ),
    );
  }
}
