import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/date_utils.dart';
import '../../../providers/main/report/transaction_management/transaction_management_provider.dart';
import 'button_filter_date.dart';

class DateRangeSelector extends ConsumerWidget {
  const DateRangeSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactionState = ref.watch(transactionManagementProvider);

    return Row(
      children: [
        Expanded(
          child: ButtonFilterDate(
            label: transactionState.value?.startDate ?? 'Start Date',
            onPressed: () async {
              await openDatePicker(
                context: context,
                lastDate: DateTime.now(),
                onDateSelected: (date) {
                  ref
                      .read(transactionManagementProvider.notifier)
                      .onDateSelected(date: date, isStartDate: true);
                },
              );
            },
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: ButtonFilterDate(
            label: ref.watch(transactionManagementProvider).value?.endDate ??
                'End Date',
            onPressed: () async {
              await openDatePicker(
                context: context,
                lastDate: DateTime.now(),
                onDateSelected: (date) {
                  ref
                      .read(transactionManagementProvider.notifier)
                      .onDateSelected(date: date, isStartDate: false);
                },
              );
            },
          ),
        )
      ],
    );
  }
}
