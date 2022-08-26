import 'package:flutter/material.dart';

class CustomFadeAnimation extends StatefulWidget {
   Widget child;
   final Duration duration;
   CustomFadeAnimation({required this.child,this.duration = const Duration(milliseconds: 1200), Key? key,}) : super(key: key);

  @override
  State<CustomFadeAnimation> createState() => _CustomFadeAnimationState();
}

class _CustomFadeAnimationState extends State<CustomFadeAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _animation = CurvedAnimation(parent: _controller,
      curve: Curves.easeIn,
    );
    _play();
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
    return FadeTransition(
      opacity: _animation,
      child: widget.child,
    );
  }
}
