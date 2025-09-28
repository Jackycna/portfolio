import 'package:flutter/material.dart';

class FromBottomSlide extends StatefulWidget {
  final Widget child;
  const FromBottomSlide({super.key, required this.child});

  @override
  State<FromBottomSlide> createState() => _FromBottomSlideState();
}

class _FromBottomSlideState extends State<FromBottomSlide>
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
      begin: Offset(0.0, 1.0),
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
