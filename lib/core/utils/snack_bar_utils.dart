import 'package:flutter/material.dart';

import '../../presentation/widgets/core/text/custom_text.dart';

void showSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: CustomText(message),
    action: SnackBarAction(
      label: 'Close',
      onPressed: () {
        if (context.mounted) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        }
      },
    ),
  );
  if (context.mounted) {
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
