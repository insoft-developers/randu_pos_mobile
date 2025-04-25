import 'package:flutter/material.dart';

import '../../../../core/const/colors.dart';
import '../../../../core/extensions/context_extension.dart';
import '../text/custom_text.dart';
import '../text_fields/style/text_field_style.dart';

class CustomDropdownButtonFormField<T> extends DropdownButtonFormField {
  CustomDropdownButtonFormField(
      {String? labelText,
      String? errorText,
      Widget? label,
      T? defaultValue,
      Color? color,
      super.validator,
      required BuildContext context,
      super.key,
      super.hint,
      T? value,
      required super.items,
      required super.onChanged,
      super.isDense,
      super.selectedItemBuilder,
      super.isExpanded})
      : super(
          value: value ?? defaultValue,
          icon: const Icon(Icons.arrow_drop_down_rounded),
          style: CustomTextStyle.lightComponentInputText.copyWith(fontSize: 14),
          decoration: TextFieldStyle.inputDecoration.copyWith(
              filled: true,
              fillColor: color ?? CustomColors.pastelOrange,
              focusColor: color ?? CustomColors.pastelOrange,
              hoverColor: color ?? CustomColors.pastelOrange,
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: CustomColors.pastelBlue),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: CustomColors.pastelBlue),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: CustomColors.pastelRed),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: CustomColors.pastelRed),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              errorText: errorText?.isNotEmpty ?? false ? errorText : null,
              errorStyle:
                  const TextStyle(color: CustomColors.pastelRed, fontSize: 12),
              floatingLabelStyle: CustomTextStyle.lightComponentInputLabel,
              labelText: labelText,
              label: label,
              labelStyle: CustomTextStyle.lightComponentInputLabel.copyWith(
                  color: context.isDarkMode
                      ? CustomColors.white
                      : CustomColors.black)),
        );
}
