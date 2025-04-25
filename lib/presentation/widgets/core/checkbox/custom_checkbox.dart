import 'package:flutter/material.dart';

import '../../../../core/const/colors.dart';
import '../text/custom_text.dart';

class CustomCheckboxListTile extends CheckboxListTile {
  CustomCheckboxListTile({
    super.key,
    required bool super.value,
    required ValueChanged<bool?> super.onChanged,
    required String title,
    TextStyle? textStyle,
    Color? color,
    super.subtitle,
    super.secondary,
    super.selected,
  }) : super(
          title: CustomText(
            title,
            style: textStyle ?? CustomTextStyle.lightTypographyBody1,
          ),
          controlAffinity: ListTileControlAffinity.leading,
          activeColor: color ?? CustomColors.lightPrimaryMain,
        );
}
