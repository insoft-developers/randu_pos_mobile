import 'package:flutter/material.dart';

import '../../../../core/const/colors.dart';

class CustomTextStyle {
  static const TextStyle _textStyle = TextStyle();
  static TextStyle get h4 {
    double fontSize = 28;
    return _textStyle.copyWith(
        fontSize: fontSize,
        height: _fontHeight(fontSize: fontSize, figmaLineHeight: 32.02),
        fontWeight: CustomFontWeight.bold.value);
  }

  static TextStyle get h3 {
    double fontSize = 32;
    return _textStyle.copyWith(
        fontSize: fontSize,
        height: _fontHeight(fontSize: fontSize, figmaLineHeight: 32.02),
        fontWeight: CustomFontWeight.bold.value);
  }

  static TextStyle get h5 {
    double fontSize = 24;
    return _textStyle.copyWith(
        fontSize: fontSize,
        height: _fontHeight(fontSize: fontSize, figmaLineHeight: 28.02),
        fontWeight: CustomFontWeight.bold.value,
        letterSpacing: 0);
  }

  static TextStyle get h5ExtraBold {
    double fontSize = 24;
    return _textStyle.copyWith(
        fontSize: fontSize,
        height: _fontHeight(fontSize: fontSize, figmaLineHeight: 28.02),
        fontWeight: CustomFontWeight.extraBold.value,
        letterSpacing: 0);
  }

  static TextStyle get h6Bold {
    double fontSize = 20;
    return _textStyle.copyWith(
      fontSize: fontSize,
      height: _fontHeight(fontSize: fontSize, figmaLineHeight: 20),
      fontWeight: CustomFontWeight.bold.value,
    );
  }

  static TextStyle get h6 {
    double fontSize = 20;
    return _textStyle.copyWith(
      fontSize: fontSize,
      height: _fontHeight(fontSize: fontSize, figmaLineHeight: 28),
      fontWeight: CustomFontWeight.medium.value,
    );
  }

  static TextStyle get lightTypographyH6 {
    double fontSize = 20;
    return _textStyle.copyWith(
        fontSize: fontSize,
        height: _fontHeight(fontSize: fontSize, figmaLineHeight: 32.02),
        fontWeight: CustomFontWeight.medium.value,
        letterSpacing: 0.15);
  }

  static TextStyle get h7Bold {
    double fontSize = 18;
    return _textStyle.copyWith(
      fontSize: fontSize,
      height: _fontHeight(fontSize: fontSize, figmaLineHeight: 18),
      fontWeight: CustomFontWeight.bold.value,
    );
  }

  static TextStyle get lightComponentsChip {
    double fontSize = 13;
    return _textStyle.copyWith(
        fontSize: fontSize,
        height: _fontHeight(fontSize: fontSize, figmaLineHeight: 18),
        fontWeight: CustomFontWeight.regular.value);
  }

  static TextStyle get lightTypographyCaption {
    double fontSize = 12;
    return _textStyle.copyWith(
        fontSize: fontSize,
        height: _fontHeight(fontSize: fontSize, figmaLineHeight: 19.9),
        fontWeight: CustomFontWeight.regular.value,
        letterSpacing: 0.4);
  }

  static TextStyle get lightTypographyCaptionMinHeight {
    double fontSize = 12;
    return _textStyle.copyWith(
        fontSize: fontSize,
        height: _fontHeight(fontSize: fontSize, figmaLineHeight: 16),
        fontWeight: CustomFontWeight.regular.value,
        letterSpacing: 0.4);
  }

  static TextStyle get lightTypographyCaptionMediumMinHeight {
    double fontSize = 12;
    return _textStyle.copyWith(
        fontSize: fontSize,
        height: _fontHeight(fontSize: fontSize, figmaLineHeight: 16),
        fontWeight: CustomFontWeight.medium.value,
        letterSpacing: 0.4);
  }

  static TextStyle lightComponentsButtonLarge = _textStyle.copyWith(
      fontSize: 15,
      height: 1.2,
      fontWeight: CustomFontWeight.medium.value,
      letterSpacing: 0.46);

  static TextStyle lightComponentsButtonMedium = _textStyle.copyWith(
      fontSize: 14,
      height: 1.2,
      fontWeight: CustomFontWeight.medium.value,
      letterSpacing: 0.46);

  static TextStyle lightTypographyBody1SemiBold = _textStyle.copyWith(
    fontSize: 16,
    height: 1.2,
    fontWeight: CustomFontWeight.semiBold.value,
    letterSpacing: 0.15,
  );

  static TextStyle lightTypographyBody1 = _textStyle.copyWith(
    fontSize: 16,
    height: 1.2,
    fontWeight: CustomFontWeight.regular.value,
    letterSpacing: 0.15,
  );

  static TextStyle lightTypographyBody2 = _textStyle.copyWith(
    fontSize: 14,
    height: 1.2,
    fontWeight: CustomFontWeight.regular.value,
    letterSpacing: 0.15,
  );

  static TextStyle get body1 {
    double fontSize = 16;
    return _textStyle.copyWith(
        fontSize: fontSize,
        height: _fontHeight(fontSize: fontSize, figmaLineHeight: 20.96),
        fontWeight: CustomFontWeight.regular.value,
        letterSpacing: 0.15);
  }

  static TextStyle get lightComponentsBadgeLabel {
    double fontSize = 12;
    return _textStyle.copyWith(
        fontSize: fontSize,
        height: _fontHeight(fontSize: fontSize, figmaLineHeight: 20),
        fontWeight: CustomFontWeight.medium.value,
        letterSpacing: 0.14);
  }

  static TextStyle get lightComponentsBadgeLabelBold {
    double fontSize = 12;
    return _textStyle.copyWith(
        fontSize: fontSize,
        height: _fontHeight(fontSize: fontSize, figmaLineHeight: 20),
        fontWeight: CustomFontWeight.bold.value,
        letterSpacing: 0.14);
  }

  static TextStyle get body1SemiBold {
    double fontSize = 16;
    return _textStyle.copyWith(
        fontSize: fontSize,
        height: _fontHeight(fontSize: fontSize, figmaLineHeight: 24),
        fontWeight: CustomFontWeight.semiBold.value,
        letterSpacing: 0.15);
  }

  static TextStyle get body2 {
    double fontSize = 14;
    return _textStyle.copyWith(
        fontSize: fontSize,
        height: _fontHeight(fontSize: fontSize, figmaLineHeight: 18.62),
        fontWeight: CustomFontWeight.regular.value,
        letterSpacing: 0.15);
  }

  static TextStyle get body2AndHalf {
    double fontSize = 14.5;
    return _textStyle.copyWith(
        fontSize: fontSize,
        height: _fontHeight(fontSize: fontSize, figmaLineHeight: 18.62),
        fontWeight: CustomFontWeight.regular.value,
        letterSpacing: 0.15);
  }

  static TextStyle body2SemiBold = _textStyle.copyWith(
      fontSize: 14,
      height: 1.2,
      fontWeight: CustomFontWeight.semiBold.value,
      letterSpacing: 0.5);

  static TextStyle lightComponentInputText = _textStyle.copyWith(
      letterSpacing: 0.15,
      fontSize: 16,
      height: 1.2,
      fontWeight: CustomFontWeight.regular.value);

  static TextStyle lightComponentInputTextSemiBold = _textStyle.copyWith(
      letterSpacing: 0.5,
      fontSize: 16,
      height: 1.2,
      fontWeight: CustomFontWeight.semiBold.value);

  static TextStyle get body3 {
    double fontSize = 13;
    return _textStyle.copyWith(
        fontSize: fontSize,
        height: _fontHeight(fontSize: fontSize, figmaLineHeight: 18.62),
        fontWeight: CustomFontWeight.regular.value,
        letterSpacing: 0.15);
  }

  static TextStyle get lightComponentInputLabel {
    double fontSize = 12;
    return _textStyle.copyWith(
        letterSpacing: 0.15,
        fontSize: fontSize,
        height: _fontHeight(fontSize: fontSize, figmaLineHeight: 12),
        fontWeight: CustomFontWeight.regular.value);
  }

  static TextStyle get lightComponentInputLabelBold {
    double fontSize = 12;
    return _textStyle.copyWith(
        letterSpacing: 0.15,
        fontSize: fontSize,
        height: _fontHeight(fontSize: fontSize, figmaLineHeight: 12),
        fontWeight: CustomFontWeight.bold.value);
  }

  static TextStyle get mobileDialogTitle {
    double fontSize = 16;
    return _textStyle.copyWith(
      letterSpacing: 0.15,
      fontSize: fontSize,
      fontWeight: CustomFontWeight.medium.value,
      color: Colors.white,
    );
  }

  static TextStyle get tabletDialogTitle {
    double fontSize = 18;
    return _textStyle.copyWith(
      letterSpacing: 0.15,
      fontSize: fontSize,
      fontWeight: CustomFontWeight.semiBold.value,
      color: Colors.white,
    );
  }

  static TextStyle get mobileDialogText {
    double fontSize = 14;
    return _textStyle.copyWith(
      letterSpacing: 0.15,
      fontSize: fontSize,
      fontWeight: CustomFontWeight.medium.value,
      color: CustomColors.black,
    );
  }

  static TextStyle get tabletDialogText {
    double fontSize = 16;
    return _textStyle.copyWith(
      letterSpacing: 0.15,
      fontSize: fontSize,
      fontWeight: CustomFontWeight.medium.value,
      color: CustomColors.black,
    );
  }

  static TextStyle get productName {
    double fontSize = 13;
    return _textStyle.copyWith(
      letterSpacing: 0.15,
      fontSize: fontSize,
      fontWeight: CustomFontWeight.medium.value,
    );
  }
}

double _fontHeight(
        {required double fontSize, required double figmaLineHeight}) =>
    figmaLineHeight / fontSize;

enum CustomFontWeight {
  thin(FontWeight.w100),
  extraLight(FontWeight.w200),
  light(FontWeight.w300),
  regular(FontWeight.w400),
  medium(FontWeight.w500),
  semiBold(FontWeight.w600),
  bold(FontWeight.w700),
  extraBold(FontWeight.w800);

  final FontWeight value;

  const CustomFontWeight(this.value);
}
