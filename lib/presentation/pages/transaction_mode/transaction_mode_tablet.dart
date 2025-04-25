import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/main/cart/get_tables/get_tables_provider.dart';
import '../../widgets/core/text_fields/custom_text_field.dart';
import 'widgets/choose_transaction_mode_tablet.dart';
import 'widgets/transaction_mode_title.dart';

class TransactionModeTablet extends ConsumerWidget {
  const TransactionModeTablet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      backgroundColor: Colors.white,
      content: SizedBox(
        width: 700,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const TransactionModeTitle(),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomTextField(
                            hintText: 'Cari Meja...',
                            onChanged: (value) => ref
                                .read(getTablesProvider.notifier)
                                .fetchTables(query: value),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const ChooseTransactionModeTablet(),
            ],
          ),
        ),
      ),
    );
  }
}
