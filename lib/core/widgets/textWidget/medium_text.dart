import 'package:flutter/material.dart';
import 'package:portfolio_in/core/appColors/app_colors.dart';

class MediumText extends StatelessWidget {
  final String text;
  final double? fontsize;
  const MediumText({super.key, required this.text, this.fontsize});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: AppColors.white,
        fontSize: fontsize ?? 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
