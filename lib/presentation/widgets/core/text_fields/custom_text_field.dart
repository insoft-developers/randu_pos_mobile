import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/const/colors.dart';
import '../text/custom_text.dart';
import 'style/text_field_style.dart';

class CustomTextField extends StatefulWidget {
  final bool obscureText;
  final TextCapitalization textCapitalization;
  final String initialValue;
  final List<TextInputFormatter>? textInputFormatterList;
  final int? maxLine;
  final String? labelText;
  final Widget? labelWidget;
  final String hintText;
  final String errorText;
  final Widget? prefix;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool enabled;
  final bool readOnly;
  final double textFieldHeight;
  final Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final Function(String)? onFieldSubmitted;
  final Function()? onTap;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final FloatingLabelBehavior floatingLabelBehavior;
  final InputBorder? border;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextStyle? errorStyle;
  final InputBorder? errorBorder;
  final bool unfocusTapOutside;

  const CustomTextField({
    super.key,
    this.obscureText = false,
    this.onChanged,
    this.onSaved,
    this.onFieldSubmitted,
    this.onTap,
    this.textCapitalization = TextCapitalization.none,
    this.floatingLabelBehavior = FloatingLabelBehavior.always,
    this.initialValue = '',
    this.textInputFormatterList,
    this.labelText = '',
    this.hintText = '',
    this.errorText = '',
    this.textInputAction,
    this.textInputType,
    this.prefix,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.enabled = true,
    this.readOnly = false,
    this.textFieldHeight = 60,
    this.maxLine,
    this.border,
    this.validator,
    this.labelWidget,
    this.errorStyle =
        const TextStyle(color: CustomColors.pastelRed, fontSize: 12),
    this.errorBorder = const OutlineInputBorder(
        borderSide: BorderSide(color: CustomColors.pastelRed)),
    this.unfocusTapOutside = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final TextEditingController controller = TextEditingController();
  late FloatingLabelBehavior floatingLabelBehavior;
  String? label;

  @override
  void initState() {
    super.initState();
    controller.text = widget.initialValue;
    if (widget.floatingLabelBehavior == FloatingLabelBehavior.always) {
      label = widget.labelText;
      floatingLabelBehavior = widget.floatingLabelBehavior;
    } else {
      floatingLabelBehavior = FloatingLabelBehavior.never;
      if (widget.initialValue.isNotEmpty) {
        label = widget.labelText;
        floatingLabelBehavior = FloatingLabelBehavior.always;
      }
      controller.addListener(() {
        _setFloatingLabelBehavior();
      });
    }
  }

  void _setFloatingLabelBehavior() {
    setState(() {
      if (controller.text.isEmpty) {
        label = null;
        floatingLabelBehavior = FloatingLabelBehavior.never;
      } else {
        label = widget.labelText;
        floatingLabelBehavior = FloatingLabelBehavior.always;
      }
    });
  }

  @override
  Widget build(BuildContext context) => TextFormField(
      onTapOutside: widget.unfocusTapOutside
          ? (event) {
              FocusManager.instance.primaryFocus?.unfocus();
            }
          : (event) {},
      obscureText: widget.obscureText,
      onFieldSubmitted: widget.onFieldSubmitted,
      controller: widget.controller ?? controller,
      enabled: widget.enabled,
      onChanged: widget.onChanged,
      onSaved: widget.onSaved,
      readOnly: widget.readOnly,
      onTap: widget.onTap,
      keyboardType: widget.textInputType,
      textCapitalization: widget.textCapitalization,
      inputFormatters: widget.textInputFormatterList,
      maxLines: widget.maxLine,
      textInputAction: widget.textInputAction,
      validator: widget.validator,
      style: TextFieldStyle.valueTextStyle,
      decoration: TextFieldStyle.inputDecoration.copyWith(
        border: widget.border,
        prefix: widget.prefix,
        prefixIcon: widget.prefixIcon,
        floatingLabelBehavior: floatingLabelBehavior,
        floatingLabelStyle: CustomTextStyle.lightComponentInputLabel,
        labelText: label,
        label: widget.labelWidget,
        errorText: widget.errorText.isNotEmpty ? widget.errorText : null,
        errorStyle: widget.errorStyle,
        hintText: widget.hintText,
        suffixIcon: widget.suffixIcon,

        // filled: true,
        // fillColor: CustomColors.white,
      ));
}
