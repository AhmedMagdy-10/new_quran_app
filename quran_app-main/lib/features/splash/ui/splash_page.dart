import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quran_app/features/home/ui/home_page.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashIconSize: 50,
      nextScreen: const HomePage(),
      splash: Column(children: [
        Center(
          child: LottieBuilder.asset(
            'assets/lottie/Animation - 1725720597665.json',
          ),
        ),
      ]),
    );
  }
}
