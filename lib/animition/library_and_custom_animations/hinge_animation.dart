import 'dart:math';

import 'package:flutter/material.dart';

class HingeAnimation extends StatefulWidget {
  const HingeAnimation({Key? key}) : super(key: key);

  @override
  State<HingeAnimation> createState() => _HingeAnimationState();
}

class _HingeAnimationState extends State<HingeAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _slideAnimation;
  late Animation<double> _rotateAnimation;
  late Animation<double> _opacityAnimation;
  bool isFirst = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 6000),
    );
    _rotateAnimation = Tween<double>(
      begin: 0.0,
      end: 0.15,
    ).animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.bounceOut)));
    _slideAnimation = Tween<double>(
      begin: 100.0,
      end: 600.0,
    ).animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn)));
    _opacityAnimation = Tween<double>(
      begin: 1.0,
      end: 0,
    ).animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(1.0, 1.0, curve: Curves.bounceOut)));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _play() {
    if (isFirst) {
      _controller.forward();
      setState(() {
        isFirst = false;
      });
    } else {
      _controller.reverse();
      setState(() {
        isFirst = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fade Animation"),
        backgroundColor: Colors.blueGrey.shade800,
      ),
      body: AnimatedBuilder(
        animation: _slideAnimation,
        builder: (context, widget) {
          return Container(
            height: 100,
            width: 220,
            margin: EdgeInsets.only(left: 75, top: _slideAnimation.value),
            child: RotationTransition(
              turns: _rotateAnimation,
              child: Center(
                child: Text(
                  "Flutter B17",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color:
                          Color.fromRGBO(0, 0, 128, _opacityAnimation.value)),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey.shade800,
        onPressed: _play,
        child: const Icon(
          Icons.play_arrow,
          size: 30,
        ),
      ),
    );
  }
}
