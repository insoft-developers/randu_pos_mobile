import 'package:flutter/material.dart';

Future<void> showCustomAlertDialog({
  required BuildContext context,
  required Widget Function(BuildContext) builder,
  Function(dynamic)? onClose,
  bool barrierDismissable = false,
}) async =>
    showDialog(
      useSafeArea: true,
      context: context,
      builder: builder,
      barrierDismissible: barrierDismissable,
    ).then((value) {
      if (onClose != null) {
        onClose(value);
      }
    });
