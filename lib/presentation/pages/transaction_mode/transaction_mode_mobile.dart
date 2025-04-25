import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/main/cart/get_tables/get_tables_provider.dart';
import '../../widgets/core/text_fields/custom_text_field.dart';
import 'widgets/choose_transaction_mode_mobile.dart';
import 'widgets/transaction_mode_title.dart';

class TransactionModeMobile extends ConsumerWidget {
  const TransactionModeMobile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          top: 16,
          left: 16,
          right: 16),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const TransactionModeTitle(),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: CustomTextField(
                hintText: 'Cari Meja...',
                onChanged: (value) {
                  print('search $value');
                  return ref
                      .read(getTablesProvider.notifier)
                      .fetchTables(query: value);
                },
              ),
            ),
            const SizedBox(height: 16),
            const ChooseTransactionModeMobile(),
            const SizedBox(
              height: 24,
            )
          ],
        ),
      ),
    );
  }
}
