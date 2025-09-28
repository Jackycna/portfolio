import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_in/core/appColors/app_colors.dart';

class TapAnimationWidget extends StatefulWidget {
  const TapAnimationWidget({super.key});

  @override
  TapAnimationWidgetState createState() => TapAnimationWidgetState();
}

class TapAnimationWidgetState extends State<TapAnimationWidget> {
  late ConfettiController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ConfettiController(duration: Duration(milliseconds: 200));
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ConfettiWidget(
      confettiController: _controller,
      blastDirectionality: BlastDirectionality.explosive,
      numberOfParticles: 5,
      maxBlastForce: 2,
      minBlastForce: 1,
      colors: [AppColors.pink],
      emissionFrequency: 1,
      gravity: 0.1,
      minimumSize: Size(1, 5),
      maximumSize: Size(5, 10),
    );
  }
}
