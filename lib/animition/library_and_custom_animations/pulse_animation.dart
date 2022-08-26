import 'package:flutter/material.dart';

class PulseAnimation extends StatefulWidget {
  const PulseAnimation({Key? key}) : super(key: key);

  @override
  State<PulseAnimation> createState() => _PulseAnimationState();
}

class _PulseAnimationState extends State<PulseAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Size> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _animation = Tween<Size>(
      begin:const Size(200,200),
      end:const Size(250,250),
    ).animate(CurvedAnimation(parent: _controller,
      curve: Curves.easeIn,
    ));
    _animation.addStatusListener((status) {
     if(status ==  AnimationStatus.completed){
       _controller.repeat();
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
        child:AnimatedBuilder(
          animation: _animation,
          builder: (context, child){
            return Container(
              height: _animation.value.height,
              width: _animation.value.width,
              color: Colors.pink,
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
