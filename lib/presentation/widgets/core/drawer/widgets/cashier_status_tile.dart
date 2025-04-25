import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

import '../../../../../core/const/colors.dart';
import '../../../../../core/const/constant.dart';
import '../../../../../core/extensions/context_extension.dart';
import '../../../../../core/utils/confirmation_dialog.dart';
import '../../../../../core/utils/custom_alert_dialog.dart';
import '../../../../../core/utils/open_cashier_util.dart';
import '../../../../../core/utils/rounded_bottom_sheet.dart';
import '../../../../pages/saved_transaction/widget/saved_transaction_list.dart';
import '../../../../providers/main/saved/get_saved_transactions/get_saved_transactions_provider.dart';
import '../../../../providers/main/transaction_provider.dart';

class CashierStatusTile extends ConsumerWidget {
  final bool isPettyCashEnabled;

  const CashierStatusTile({super.key, required this.isPettyCashEnabled});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ValueListenableBuilder(
      valueListenable: Hive.box<bool>(isCashierOpenData).listenable(),
      builder: (context, box, child) {
        final isCashierOpen = box.get(isCashierOpenData) ?? false;

        return !isPettyCashEnabled
            ? const SizedBox.shrink()
            : ListTile(
                leading: const Icon(Icons.store, color: CustomColors.blue),
                title: Text(isCashierOpen ? 'Tutup Kasir' : 'Buka Kasir'),
                subtitle: Text(isCashierOpen
                    ? 'Posisi Kasir Sedang Dibuka'
                    : 'Posisi Kasir Sedang Ditutup'),
                trailing: Icon(
                  isCashierOpen
                      ? Icons.check_circle
                      : Icons.error_outline_outlined,
                  color: isCashierOpen ? Colors.green : Colors.red,
                ),
                onTap: () async {
                  if (isCashierOpen) {
                    await _closeCashier(context, ref);
                  } else {
                    showStartShiftDialog(context, ref);
                  }
                },
              );
      },
    );
  }

  Future<void> _closeCashier(BuildContext context, WidgetRef ref) async {
    final listSavedTransaction = ref.read(getSavedTransactionsProvider).value;
    if (listSavedTransaction != null && listSavedTransaction.isNotEmpty) {
      _showSavedTransactionDialog(context, ref);
    } else {
      const titleMessage = 'Tutup Kasir';
      const content = 'Apakah kamu yakin ingin menutup kasir?';
      final result = await context.confirmationPopUp(
        context: context,
        titleMessage: titleMessage,
        content: content,
        type: DialogType.warning,
      );
      if (result != null && result) {
        await ref.read(transactionDataProvider.notifier).closeCashier();
      }
    }
  }

  void _showSavedTransactionDialog(BuildContext context, WidgetRef ref) async {
    if (context.isMobile) {
      await showRoundedBottomSheet(
        context: context,
        isDismissible: true,
        onClose: (value) {
          print(value);
        },
        builder: (context) => const SavedTransactionList(),
        enableDrag: true,
      );
    } else {
      await showCustomAlertDialog(
        context: context,
        onClose: (value) {
          print(value);
        },
        builder: (context) => const AlertDialog(
          content: SizedBox(width: 500, child: SavedTransactionList()),
        ),
      );
    }
  }
}
