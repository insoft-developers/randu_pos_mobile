import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/main/report/transaction_management/transaction_management_provider.dart';
import '../../../widgets/core/chips/selectable_chips.dart';

class StatusSelector extends ConsumerWidget {
  StatusSelector({super.key});

  final listTransactionStatus = [
    {'name': null, 'label': 'Semua'},
    {'name': 0, 'label': 'Pending'},
    {'name': 1, 'label': 'Process'},
    {'name': 2, 'label': 'Cooking/Packing'},
    {'name': 3, 'label': 'Shipped'},
    {'name': 4, 'label': 'Completed'},
    {'name': 5, 'label': 'Canceled'},
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactionState = ref.watch(transactionManagementProvider);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: listTransactionStatus.map((status) {
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: SelectableChips(
              horizontalPadding: 16,
              label: status['label'] as String? ?? '',
              active:
                  transactionState.value?.transactionStatus == status['name'],
              onTap: () => ref
                  .read(transactionManagementProvider.notifier)
                  .setTransactionStatus(status['name'] as int?),
            ),
          );
        }).toList(),
      ),
    );
  }
}
