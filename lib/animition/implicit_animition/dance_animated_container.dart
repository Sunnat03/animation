import 'dart:math';

import 'package:flutter/material.dart';

class DanceAnimatedContainer extends StatefulWidget {
  const DanceAnimatedContainer({Key? key}) : super(key: key);

  @override
  State<DanceAnimatedContainer> createState() => _DanceAnimatedContainerState();
}

class _DanceAnimatedContainerState extends State<DanceAnimatedContainer> {
  double _height = 200;
  double _width = 200;
  Color _color = Colors.pinkAccent;
  double _borderRadius = 0;


  void _play(){
    int size =MediaQuery.of(context).size.width.toInt();
    _height =Random().nextInt(size).toDouble();
    _width =Random().nextInt(size).toDouble();
    _color = Color.fromRGBO(Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 1);
    _borderRadius = Random().nextInt(size ~/ 2).toDouble();

    setState((){

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Container"),
        backgroundColor: Colors.blueGrey.shade800,
      ),
      body: Center(
        child: AnimatedContainer(
          duration:const Duration(milliseconds: 700),
          height: _height,
          width: _width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_borderRadius),
            color: _color,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey.shade800,
        onPressed: _play,
        child:const Icon(Icons.play_arrow, size: 30,),
      ),
    );
  }
}
