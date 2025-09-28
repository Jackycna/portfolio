import 'package:flutter/material.dart';

class FromRightSlide extends StatefulWidget {
  final Widget child;
  const FromRightSlide({super.key, required this.child});

  @override
  State<FromRightSlide> createState() => _FromRightSlideState();
}

class _FromRightSlideState extends State<FromRightSlide>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offset;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _offset = Tween<Offset>(
      begin: Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.ease));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(position: _offset, child: widget.child);
  }
}
