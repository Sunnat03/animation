import 'dart:math';

import 'package:flutter/material.dart';

class FlipAnimation extends StatefulWidget {
  const FlipAnimation({Key? key}) : super(key: key);

  @override
  State<FlipAnimation> createState() => _FlipAnimationState();
}

class _FlipAnimationState extends State<FlipAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool isFirst = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    _animation = Tween<double>(
      begin: 0.0,
      end:1.0,
    ).animate(_controller);
   _animation.addListener(() => setState((){}));

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _play() {
   if(isFirst){
     _controller.forward();
     setState((){
       isFirst = false;
     });
   }else{
  _controller.reverse();
  setState((){
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
      body: Center(
        child: Transform(
          alignment: FractionalOffset.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.002)
            ..rotateZ(10000* pi * _animation.value),
          child: const Icon(Icons.accessibility_new, color: Colors.pink,size: 150,),
        ),
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
