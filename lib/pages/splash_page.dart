import 'package:animation/animition/library_and_custom_animations/custom_fade_animation.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomFadeAnimation(
          duration: const Duration(milliseconds:3000 ),
          child: const FlutterLogo(
            size: 250,
          ),
        ),
      ),
    );
  }
}
