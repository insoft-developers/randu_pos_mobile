import 'package:flutter/material.dart';

import '../extensions/context_extension.dart';

class CustomColors {
  ///Set app colors here
  static const black = Color(0XFF000000);
  static const white = Color(0XFFFFFFFF);
  static const gray = Color(0XFFD2D2D2);
  static const darkGray = Color(0XFF878787);
  static const lightPrimaryMain = Color(0XFF2352A4);
  static const lightGreyGrey = Color(0XFFE0E0E0);
  static const lightTextPrimary = Color(0XFF544F5A);
  static const lightTextSecondary = Color(0XFF79767E);
  static const lightTextDisabled = Color(0XFFB4B2B7);
  static const lightBackgroundBodyBackground = Color(0xFFF4F5FA);
  static const lightWarningMain = Color(0xFFFFB400);
  static const lightSuccessMain = Color(0xFF499414);
  static const lightInfoMain = Color(0xFF16B1FF);
  static const lightErrorMain = Color(0XFFFF4C51);
  static const lightCustomBackgroundErrorBackground = Color(0XFFFEE8E7);
  static const blue = Color(0xFF0087CB);
  static const lightOtherOutlinedBorder = Color(0XFFD2D1D3);
  static const lightBgSuccess = Color(0XFFE8FFEA);
  static const lightFgSuccess = Color(0XFF00B42A);

  ///new AAIL
  static const darkMode1 = Color(0xFF131415);
  static const darkMode3 = Color(0xFF353941);
  static const primaryColor = Color(0xFF385a9c);
  static const secondaryColor = Color(0xFF90B8F8);
  static const containerBGLight = Color.fromRGBO(145, 180, 237, 1);

  static const pastelOrange = Color(0XFFFEB144);
  static const pastelRed = Color(0XFFFF6663);
  static const pastelGreen = Color(0XFF8CE28C);
  static const pastelBlue = Color(0XFF9EC1CF);
  static const pastelPurple = Color(0XFFD6B2F0);
  static const pastelGold = Color(0xFFfdd060);
  static const darkPrimaryMain = Color(0XFF2352A4);
  static const darkWarningMain = Color(0xFFFFD427);
  static const darkSuccessMain = Color(0xFF459114);

  static const strongOrange = Color(0xFFF07404);
  static const productBlue = Color(0xFFADD8E6);
  static const productBlue2 = Color(0xFFD1EAF0);

  ///GRADIENT FOR PAYMENT METHOD
  static const gradientOrangeStart = Color(0xFFec940c);
  static const gradientOrangeEnd = Color(0xFF944414);

  static const gradientGreenStart = Color(0xFF5ccca4);
  static const gradientGreenEnd = Color(0xFF097756);

  static const gradientRedStart = Color(0xFFf45474);
  static const gradientRedEnd = Color(0xFFa7173c);
}

class CustomGradient {
  static LinearGradient linearPrimary(BuildContext context) =>
      LinearGradient(colors: [
        context.isDarkMode ? CustomColors.darkMode3 : CustomColors.white,
        CustomColors.primaryColor.withValues(alpha: 0.7)
      ]);
  static LinearGradient linearSecondary(BuildContext context) =>
      const LinearGradient(colors: [
        Color(0xFFE1F3FF),
        Color(0xFFC7C7C7),
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter);
}
