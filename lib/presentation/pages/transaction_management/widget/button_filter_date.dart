import 'package:flutter/material.dart';

import '../../../../core/const/colors.dart';

class ButtonFilterDate extends StatelessWidget {
  const ButtonFilterDate(
      {super.key, required this.label, required this.onPressed});
  final String label;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: const ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Colors.white),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
            Radius.circular(4),
          )),
        ),
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        ),
        side: WidgetStatePropertyAll(BorderSide(color: CustomColors.gray)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(label), const Icon(Icons.calendar_month)],
      ),
    );
  }
}
