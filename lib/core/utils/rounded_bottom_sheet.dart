import 'package:flutter/material.dart';

Future<void> showRoundedBottomSheet({
  required BuildContext context,
  required Widget Function(BuildContext) builder,
  Function(dynamic)? onClose,
  BoxConstraints? constraints,
  bool isDismissible = true,
  bool enableDrag = true,
  Color? backgroundColor,
}) async =>
    showModalBottomSheet(
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      backgroundColor: backgroundColor ?? Colors.white,
      isDismissible: isDismissible,
      constraints: constraints,
      context: context,
      enableDrag: enableDrag,
      isScrollControlled: true,
      builder: builder,
    ).then((value) {
      if (onClose != null) {
        onClose(value);
      }
    });
