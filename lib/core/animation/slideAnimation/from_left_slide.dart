import 'package:flutter/material.dart';

class FromLeftSlide extends StatefulWidget {
  final Widget child;
  const FromLeftSlide({super.key, required this.child});

  @override
  State<FromLeftSlide> createState() => _FromLeftSlideState();
}

class _FromLeftSlideState extends State<FromLeftSlide>
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
      begin: Offset(-1.0, 0.0),
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
