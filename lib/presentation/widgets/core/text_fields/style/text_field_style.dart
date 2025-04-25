import 'package:flutter/material.dart';
import '../../../../../core/const/colors.dart';
import '../../text/custom_text_style.dart';

class TextFieldStyle {
  static OutlineInputBorder nonFocusedBorder = const OutlineInputBorder(
      borderSide: BorderSide(color: CustomColors.darkGray, width: 1),
      borderRadius: BorderRadius.all(Radius.circular(10)));

  static OutlineInputBorder errorBorder = const OutlineInputBorder(
      borderSide: BorderSide(color: CustomColors.pastelRed, width: 1),
      borderRadius: BorderRadius.all(Radius.circular(10)));

  static OutlineInputBorder focusedBorder = const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(color: CustomColors.primaryColor, width: 1));

  static TextStyle errorTextStyle = CustomTextStyle.lightTypographyCaption
      .copyWith(color: CustomColors.pastelRed, height: 1);

  static TextStyle labelTextStyle =
      CustomTextStyle.lightTypographyCaption.copyWith(height: 1.2);

  static TextStyle hintTextStyle = CustomTextStyle.body2
      .copyWith(color: CustomColors.lightTextSecondary, height: 1.3);

  static TextStyle valueTextStyle = CustomTextStyle.body2.copyWith(height: 1.3);

  static EdgeInsets contentPadding = const EdgeInsets.fromLTRB(17, 17, 17, 6);

  static InputDecoration inputDecoration = InputDecoration(
      contentPadding: contentPadding,
      border: nonFocusedBorder,
      enabledBorder: nonFocusedBorder,
      focusedBorder: focusedBorder,
      errorBorder: errorBorder,
      focusedErrorBorder: focusedBorder,
      errorStyle: errorTextStyle,
      labelStyle: labelTextStyle,
      hintStyle: hintTextStyle);
}
