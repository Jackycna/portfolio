import 'package:flutter/widgets.dart';

class Sizeconfig {
  static late double screenWidth;
  static late double screenHeight;
  static void init(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    screenHeight = mediaQuery.height;
    screenWidth = mediaQuery.width;
  }

  static double wp(double percentage) => screenWidth * percentage / 100;
  static double hp(double percentage) => screenHeight * percentage / 100;
}
