import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/const/colors.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../providers/main/saved/get_saved_transactions/get_saved_transactions_provider.dart';
import '../../../widgets/core/buttons/primary_button.dart';
import '../../../widgets/core/text/custom_text.dart';
import 'saved_transaction_item.dart';

class SavedTransactionList extends ConsumerWidget {
  const SavedTransactionList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final savedTransaction = ref.watch(getSavedTransactionsProvider);
    var listSavedTransaction = savedTransaction.value ?? [];

    ref.listen(getSavedTransactionsProvider, (previous, next) {
      if (next.value == null || next.value!.isEmpty) {
        context.pop();
        context.pop();
      }
    });

    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: context.isMobile
            ? EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                top: 16,
                left: 16,
                right: 16)
            : null,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(context.isMobile ? 12 : 16),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
                color: CustomColors.primaryColor,
              ),
              child: Center(
                child: CustomText(
                  'Transaksi Aktif',
                  style: context.isMobile
                      ? CustomTextStyle.mobileDialogTitle
                      : CustomTextStyle.tabletDialogTitle,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
                child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: context.isMobile ? 8 : 12),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    var item = listSavedTransaction[index];

                    return SavedTransactionItem(
                      item: item,
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(
                        color: CustomColors.darkGray,
                        thickness: 1,
                      ),
                  itemCount: listSavedTransaction.length),
            )),
            const SizedBox(height: 8),
            PrimaryButton(
              buttonPrimaryType: ButtonPrimaryType.outlinedError,
              label: 'Batal',
              onTap: () {
                context.pop();
              },
            ),
            SizedBox(height: context.isMobile ? 16 : 0),
          ],
        ));
  }
}
