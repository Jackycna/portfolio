import 'package:flutter/material.dart';
import 'package:portfolio_in/core/animation/tap_animation/tap_animation.dart';

class Animationwidget extends StatefulWidget {
  final Widget child;
  const Animationwidget({super.key, required this.child});

  @override
  State<Animationwidget> createState() => _AnimationwidgetState();
}

class _AnimationwidgetState extends State<Animationwidget> {
  OverlayEntry? _overlayEntry;

  void _showAnimation(Offset position) {
    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        left: position.dx,
        top: position.dy,
        child: TapAnimationWidget(),
      ),
    );
    Overlay.of(context).insert(_overlayEntry!);
    Future.delayed(Duration(milliseconds: 300), () {
      _overlayEntry?.remove();
      _overlayEntry = null;
    });
  }

  @override
  void dispose() {
    _overlayEntry!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTapDown: (details) {
        _showAnimation(details.localPosition);
      },
      child: widget.child,
    );
  }
}
