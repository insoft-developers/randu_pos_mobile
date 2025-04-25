import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../presentation/pages/start_shift/start_shift_mobile.dart';
import '../../presentation/pages/start_shift/start_shift_tablet.dart';
import '../extensions/context_extension.dart';
import 'custom_alert_dialog.dart';
import 'rounded_bottom_sheet.dart';

Future<void> showStartShiftDialog(BuildContext context, WidgetRef ref) async {
  if (context.isMobile) {
    await showRoundedBottomSheet(
      context: context,
      isDismissible: false,
      onClose: (value) {
        print(value);
      },
      builder: (context) => const StartShiftMobile(),
      enableDrag: false,
    );
  } else {
    await showCustomAlertDialog(
      context: context,
      onClose: (value) {
        print(value);
        // ref.watch(openCashierProvider(initialCashAmount: value));
      },
      builder: (context) =>
          const SizedBox(width: 500, child: StartShiftTablet()),
    );
  }
}
