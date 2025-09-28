import 'dart:async';

import 'package:flutter/material.dart';

class TextAnimation extends StatefulWidget {
  final String text;
  final Duration duration;
  final TextStyle style;
  const TextAnimation({
    super.key,
    required this.text,
    required this.duration,
    required this.style,
  });

  @override
  State<TextAnimation> createState() => _TextAnimationState();
}

class _TextAnimationState extends State<TextAnimation> {
  late Timer _timer;
  int index = 0;
  String visibleText = '';
  @override
  void initState() {
    super.initState();
    showText();
  }

  void showText() {
    _timer = Timer.periodic(widget.duration, (timer) {
      if (index < widget.text.length) {
        setState(() {
          visibleText += widget.text[index];
        });
        index++;
      } else {
        _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(visibleText, style: widget.style);
  }
}
