import 'package:flutter/material.dart';
import 'package:portfolio_in/core/appColors/app_colors.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: AppColors.scaffoldblack,
    primaryColor: AppColors.pink,
    appBarTheme: AppBarTheme(backgroundColor: AppColors.scaffoldblack),
    fontFamily: 'popins',
  );
}
