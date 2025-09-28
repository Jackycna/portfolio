import 'package:flutter/material.dart';
import 'package:portfolio_in/core/appColors/app_colors.dart';

class TitleText extends StatelessWidget {
  final String text;
  final double? fontsize;
  final TextStyle? style;
  final Color? color;
  const TitleText({
    super.key,
    required this.text,
    this.fontsize,
    this.style,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          style ??
          TextStyle(
            color: color ?? AppColors.white,
            fontSize: fontsize ?? 20,
            fontWeight: FontWeight.bold,
          ),
    );
  }
}
