import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:tetris/main.dart';
import 'package:tetris/views/constants/app_animations.dart';
import 'package:tetris/views/constants/app_images.dart';
import 'package:tetris/views/tetris_screen.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';

import 'game_menu_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _navigateToGame();
    super.initState();
  }
  void _navigateToGame(){
    Future.delayed(Duration(seconds: 4), () {
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => GameMenuScreen(),),);
    });
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
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  SizedBox(
                      // height: 80.dp,
                      width: 60.dp,
                      child: Lottie.asset(AppAnimations.splashLoadingAnimation),),
                  Gap(24.dp)
                ]),
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
