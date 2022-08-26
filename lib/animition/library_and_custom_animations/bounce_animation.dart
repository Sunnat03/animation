import 'package:flutter/material.dart';

class BounceAnimation extends StatefulWidget {
  const BounceAnimation({Key? key}) : super(key: key);

  @override
  State<BounceAnimation> createState() => _BounceAnimationState();
}

class _BounceAnimationState extends State<BounceAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    _animation = Tween<double>(
      begin: 400,
      end:0,
    ).animate(CurvedAnimation(parent: _controller,
      curve: const Interval(0.1, 1.0, curve: Curves.elasticIn),
    ));
    _animation.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        _controller.repeat(reverse: true);
      }
    });

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _play() {
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fade Animation"),
        backgroundColor: Colors.blueGrey.shade800,
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child){
            return Padding(padding: EdgeInsets.only(bottom:  _animation.value),
            child: const Icon(Icons.sports_baseball,color: Colors.deepPurpleAccent,size: 125,),
            );
          },
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
