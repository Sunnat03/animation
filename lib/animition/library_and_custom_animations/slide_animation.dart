import 'package:flutter/material.dart';

class SlideAnimation extends StatefulWidget {
  const SlideAnimation({Key? key}) : super(key: key);

  @override
  State<SlideAnimation> createState() => _SlideAnimationState();
}

class _SlideAnimationState extends State<SlideAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    _animation = Tween<Offset>(
      begin: Offset.zero,
      end:Offset(1.75,0),
    ).animate(CurvedAnimation(parent: _controller,
      curve: Curves.elasticIn,
    ));

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
        child:SlideTransition(
          position: _animation,
          child:const FlutterLogo(
            size: 150,
          ),
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
