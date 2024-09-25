import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tetris/views/constants/app_images.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';
import '../bloc/tetris_bloc.dart';
import '../bloc/tetris_event.dart';
import '../bloc/tetris_state.dart';

class GameControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TetrisBloc, TetrisState>(
      builder: (context, state) {
        TetrisBloc bloc = BlocProvider.of<TetrisBloc>(context);
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.transparent,
            const  Color(0xFFFFDF40).withOpacity(0.24),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            )
          ),
          child: Column(
            children: [
              // SizedBox(height: 24),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.dp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Your Score',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),

                        Text(
                          '${bloc.state.score}',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                    BlocBuilder<TetrisBloc, TetrisState>(
                      builder: (context, state) {
                        return IconButton(
                          icon:Image.asset(state.isPaused ?AppImages.gamePlayIcon:AppImages.gamePauseIcon,height: 30.dp,),
                          // Icon(state.isPaused ? Icons.play_arrow : Icons.pause),
                          onPressed: () {
                            if (state.isPaused) {
                              context.read<TetrisBloc>().add( TetrisEvent.resumeGame());
                            } else {
                              context.read<TetrisBloc>().add( TetrisEvent.pauseGame());
                            }
                          },
                        );
                      },
                    ),
                    Column(
                      children: [
                        Text(
                          'High Score', // High score
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Text(
                          '${bloc.state.highScore}', // High score
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.dp),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => bloc.add(MovePiece(Direction.left)),
                    child: Container(
                      padding: EdgeInsets.all(12.dp),
                      height:60.dp,
                      width: 60.dp,
                      decoration: BoxDecoration(
                          color: Color(0xFFFFBE40), shape: BoxShape.circle),
                      child: Image.asset(
                        AppImages.leftArrowIcon,
                        // height: 36.dp,
                      ),
                    ),
                  ),Gap(24.dp),
                  InkWell(
                    onTap: () => bloc.add(RotatePiece()),
                    child: Container(
                      padding: EdgeInsets.all(12.dp),
                      height: 60.dp,
                      width: 60.dp,
                      decoration: BoxDecoration(
                          color: Color(0xFFFFBE40), shape: BoxShape.circle),
                      child: Image.asset(
                        AppImages.rotateArrowIcon,
                        height: 30.dp,
                      ),
                    ),
                  ),
                  Gap(24.dp),
                  InkWell(
                    onTap: () => bloc.add(MovePiece(Direction.right)),
                    child: Container(
                      padding: EdgeInsets.all(12.dp),
                      height: 60.dp,
                      width:60.dp,
                      decoration: BoxDecoration(
                          color: Color(0xFFFFBE40), shape: BoxShape.circle),
                      child: Center(
                        child: Image.asset(
                          AppImages.rightArrowIcon,
                          height: 36.dp,
                        ),
                      ),
                    ),
                  )

                ],
              ),
              Gap(24.dp),
              InkWell(
                onTap: () => bloc.add(MovePiece(Direction.down)),
                child: Container(
                  padding: EdgeInsets.all(12.dp),
                  height: 60.dp,
                  width:60.dp,
                  decoration: BoxDecoration(
                      color: Color(0xFFFFBE40), shape: BoxShape.circle),
                  child: Center(
                    child: Image.asset(
                      AppImages.bottomArrowIcon,
                      height: 30.dp,
                    ),
                  ),
                ),
              ),
              // FloatingActionButton(
              //   onPressed: () => bloc.add(MovePiece(Direction.down)),
              //   child: Icon(Icons.arrow_drop_down),
              //   backgroundColor: Colors.white,
              // ),
            ],
          ),
        );
      },
    );
  }
}
