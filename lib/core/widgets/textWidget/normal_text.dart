import 'package:flutter/material.dart';
import 'package:portfolio_in/core/appColors/app_colors.dart';

class NormalText extends StatelessWidget {
  final String text;
  final double? fontsize;
  const NormalText({super.key, required this.text, this.fontsize});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: AppColors.white, fontSize: fontsize ?? 15),
    );
  }
}
