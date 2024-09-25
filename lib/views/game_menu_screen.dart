  import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
  import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:tetris/views/constants/app_audio.dart';
import 'package:tetris/views/game_primary_button.dart';
import 'package:tetris/views/tetris_screen.dart';
  import 'package:the_responsive_builder/the_responsive_builder.dart';

  import 'constants/app_images.dart';

  class GameMenuScreen extends StatefulWidget {
    const GameMenuScreen({super.key});

  @override
  State<GameMenuScreen> createState() => _GameMenuScreenState();
}

class _GameMenuScreenState extends State<GameMenuScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _playBackgroundMusic();
  }

  @override
  void dispose() {
    _stopBackgroundMusic();
    super.dispose();
  }

  void _playBackgroundMusic() async {
    await _audioPlayer.setReleaseMode(ReleaseMode.loop);
    await _audioPlayer.play(AssetSource('audio/game_menu_bg_audio.mp3'), volume: 0.5);
  }

  void _stopBackgroundMusic() async {
    await _audioPlayer.stop();
  }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Container(
          height: 100.h,
          width: 100.w,
          decoration: const BoxDecoration(
              color: Color(0xFF060110),
              image: DecorationImage(
                image: AssetImage(AppImages.screenBgImage),
                fit: BoxFit.cover,
              )),
  child: Stack(
    alignment: Alignment.center,
    children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GamePrimaryButton(buttonText: 'Play Game',
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => TetrisScreen(),));
          },
          ),
          Gap(16.dp),
          GamePrimaryButton(buttonText: 'Exit Game',onTap: () {
            SystemNavigator.pop();
          },),
          Gap(24.dp)
        ],
      ),
      Image.asset(
        AppImages.tetrisLogo,
        height: 155.dp,
      ),
      
    ],
  ),
        ),
      );
    }
}
