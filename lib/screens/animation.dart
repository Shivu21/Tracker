
import 'package:flutter/material.dart';

class FadeInDemo extends StatefulWidget {
  @override
  _FadeInDemoState createState() => _FadeInDemoState();
}

class _FadeInDemoState extends State<FadeInDemo> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..forward();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: const Text('Fade In', style: TextStyle(fontSize: 24)),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}