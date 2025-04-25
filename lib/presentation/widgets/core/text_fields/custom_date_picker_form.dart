import 'package:flutter/material.dart';

import '../../../../core/const/colors.dart';
import '../../../../core/utils/date_utils.dart';
import '../text/custom_text.dart';
import '../text_fields/custom_text_field.dart';

class CustomDatePickerForm extends StatefulWidget {
  const CustomDatePickerForm({
    required this.label,
    required this.onDateSelected,
    super.key,
    this.initialDate,
    this.currentDate,
    this.lastDate,
    this.hintText = 'dd-mm-yyyy',
    this.validator,
    this.isRequired = false,
    this.errorText = '',
  });

  final String label;
  final Function(DateTime pickedDate) onDateSelected;
  final DateTime? initialDate;
  final String hintText;
  final DateTime? currentDate;
  final DateTime? lastDate;
  final String? Function(String?)? validator;
  final bool isRequired;
  final String errorText;

  @override
  State<CustomDatePickerForm> createState() => _CustomDatePickerFormState();
}

class _CustomDatePickerFormState extends State<CustomDatePickerForm> {
  late final TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controller.text = widget.initialDate != null
        ? formatDateTimeAsString(widget.initialDate, dateFormat: 'dd-MM-yyyy')
        : '';
    return CustomTextField(
      labelWidget: widget.isRequired
          ? RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: widget.label,
                    style: CustomTextStyle.lightComponentInputLabel
                        .copyWith(color: CustomColors.lightTextSecondary)),
                TextSpan(
                    text: '*',
                    style: CustomTextStyle.lightComponentInputLabel
                        .copyWith(color: CustomColors.lightErrorMain)),
              ]),
            )
          : null,
      controller: controller,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      labelText: widget.isRequired ? null : widget.label,
      suffixIcon: const Icon(
        Icons.calendar_today,
        color: CustomColors.darkGray,
      ),
      textFieldHeight: 60,
      readOnly: true,
      onTap: () async {
        await openDatePicker(
            context: context,
            onDateSelected: (value) {
              controller.text =
                  formatDateTimeAsString(value, dateFormat: 'dd-MM-yyyy');

              widget.onDateSelected(value);
            },
            initialDate: widget.initialDate);
      },
      hintText: widget.hintText,
      validator: widget.validator,
      errorText: widget.errorText,
    );
  }
}
