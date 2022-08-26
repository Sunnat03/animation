import 'package:animation/animition/implicit_animition/dance_animated_container.dart';
import 'package:animation/pages/splash_page.dart';
import 'package:flutter/material.dart';

import 'animeted/animated_positioned.dart';
import 'animeted/animeted_list.dart';
import 'animeted/card_swipe.dart';
import 'animeted/carusel_animeted.dart';
import 'animeted/custom_tween.dart';
import 'animeted/focus_image.dart';
import 'animeted/hero_animeted.dart';
import 'animeted/spring_phsics.dart';
import 'animition/implicit_animition/animeted_container.dart';
import 'animition/library_and_custom_animations/bounce_animation.dart';
import 'animition/library_and_custom_animations/fade_animation.dart';
import 'animition/library_and_custom_animations/flip_animation.dart';
import 'animition/library_and_custom_animations/hinge_animation.dart';
import 'animition/library_and_custom_animations/pulse_animation.dart';
import 'animition/library_and_custom_animations/slide_animation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Animation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CustomTweenA(),
    );
  }
}
