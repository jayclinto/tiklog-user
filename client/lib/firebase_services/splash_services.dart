import 'dart:async';
import 'package:flutter/material.dart';
//import 'package:tiklogistics/screens/home_screen.dart';
import 'package:tiklogistics/screens/onboarding_screen.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const OnboardingScreen())));
  }
}
