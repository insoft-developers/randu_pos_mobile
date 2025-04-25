import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/const/colors.dart';
import '../../providers/cores/router/go_router_provider.dart';
import '../../providers/main/saved/get_saved_transactions/get_saved_transactions_provider.dart';
import '../../widgets/core/buttons/primary_button.dart';
import 'widget/saved_transaction_item.dart';

class SavedTransactionPageTablet extends ConsumerWidget {
  const SavedTransactionPageTablet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final savedTransaction = ref.watch(getSavedTransactionsProvider);
    var listSavedTransaction = savedTransaction.value ?? [];

    ref.listen(getSavedTransactionsProvider, (previous, next) {
      if (next.value == null || next.value!.isEmpty) {
        ref.read(routerProvider).goNamed('dashboard');
      }
    });

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Expanded(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 400,
                    childAspectRatio: 1.8,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                  ),
                  itemBuilder: (context, index) {
                    var item = listSavedTransaction[index];

                    return SavedTransactionItem(item: item);
                  },
                  itemCount: listSavedTransaction.length)),
          Row(
            children: [
              const Spacer(flex: 2),
              Expanded(
                child: PrimaryButton(
                  buttonPrimaryType: ButtonPrimaryType.outlinedWhitePrimary,
                  label: 'Kembali',
                  preFixWidget: const Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: Icon(Icons.chevron_left,
                        color: CustomColors.primaryColor),
                  ),
                  onTap: () {
                    ref.read(routerProvider).goNamed('dashboard');
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
