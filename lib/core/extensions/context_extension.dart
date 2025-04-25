import 'dart:math';

import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  bool get isDarkMode =>
      MediaQuery.of(this).platformBrightness == Brightness.dark;

  double get screenWidth => MediaQuery.of(this).size.width;

  double get screenHeight => MediaQuery.of(this).size.height;

  double get screenDiagonal =>
      sqrt(screenWidth * screenWidth + screenHeight * screenHeight);

  bool get isPotraitOrSmallerThan1000 =>
      orientation == Orientation.portrait || screenDiagonal < 1000;
  bool get isLanscapeAndSmallerThan1000 =>
      orientation == Orientation.landscape && screenDiagonal < 1000;

  Orientation get orientation => MediaQuery.of(this).orientation;

  bool get isMobile => screenWidth < 700;

  bool get isTablet => screenWidth >= 700;

  bool get isPotrait => orientation == Orientation.portrait;

  bool get isLandscape => orientation == Orientation.landscape;
}
