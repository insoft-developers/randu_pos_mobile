import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/const/colors.dart';
import '../../../../../core/utils/custom_alert_dialog.dart';
import '../../../../providers/main/cart/cart_provider.dart';
import '../../../../widgets/core/buttons/randu_button.dart';
import '../../../transaction_mode/transaction_mode_tablet.dart';

class ModeTransactionButton extends ConsumerWidget {
  const ModeTransactionButton({
    super.key,
  });

  void _showTransactionModetDialog(context) async {
    await showCustomAlertDialog(
      context: context,
      onClose: (value) {
        print(value);
      },
      builder: (context) => const TransactionModeTablet(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);
    var tableNumber = cart.table?.noMeja;
    return RanduButton(
        color: tableNumber == null ? CustomColors.primaryColor : Colors.white,
        backgroundColor: tableNumber == null ? null : CustomColors.primaryColor,
        icon: Icons.apps,
        text: tableNumber == null ? 'Tipe Penjualan ' : 'Meja $tableNumber  ',
        onPressed: () {
          _showTransactionModetDialog(context);
        });
  }
}
