

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bitfx_application/ui/views/welcome/welcome_view.dart';
import 'package:flutter/material.dart';

import '../../colors/button_color.dart';

class SplashView extends StatefulWidget {
  const SplashView({ Key? key }) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 700,
      splash: 'assets/icon/icon.png',
      nextScreen: WelcomeView(),
      splashTransition: SplashTransition.slideTransition,
      backgroundColor: mainGrey,
      splashIconSize: 400,
    );
  }
}