import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/const/colors.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../providers/main/report/transaction_management/transaction_management_provider.dart';
import '../../../widgets/core/container/custom_rounded_container.dart';
import '../../../widgets/core/text/custom_text.dart';

enum SelectedRangeEnum {
  isToday,
  isYesterday,
  isThisWeek,
  isLastWeek,
  isThisMonth,
  isLastMonth,
  isThisYear,
  isLastYear,
  isRangeDate,
}

class DateDropdown extends ConsumerWidget {
  DateDropdown({super.key});

  final dropdownItem = [
    {'value': '', 'label': 'Semua'},
    {'value': SelectedRangeEnum.isRangeDate.name, 'label': 'Range Tanggal'},
    {'value': SelectedRangeEnum.isToday.name, 'label': 'Hari Ini'},
    {'value': SelectedRangeEnum.isYesterday.name, 'label': 'Kemarin'},
    // {'value': SelectedRangeEnum.isThisWeek.name, 'label': 'Minggu Ini'},
    // {'value': SelectedRangeEnum.isLastWeek.name, 'label': 'Minggu Lalu'},
    {'value': SelectedRangeEnum.isThisMonth.name, 'label': 'Bulan Ini'},
    {'value': SelectedRangeEnum.isLastMonth.name, 'label': 'Bulan Lalu'},
    {'value': SelectedRangeEnum.isThisYear.name, 'label': 'Tahun Ini'},
    {'value': SelectedRangeEnum.isLastYear.name, 'label': 'Tahun Lalu'},
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactionState = ref.watch(transactionManagementProvider);

    return CustomRoundedContainer(
      height: context.isMobile ? 50 : 40,
      shadow: const [],
      radius: 2,
      border: Border.all(color: CustomColors.gray),
      padding: const EdgeInsets.fromLTRB(8, 2, 8, 8),
      child: DropdownButton(
        isDense: true,
        isExpanded: true,
        borderRadius: BorderRadius.circular(4),
        alignment: Alignment.center,
        focusColor: CustomColors.primaryColor,
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
        icon: const Padding(
          padding: EdgeInsets.only(left: 8),
          child: Icon(Icons.calendar_month),
        ),
        iconSize: 20,
        value: transactionState.value!.selectedDateLabel,
        items: dropdownItem.map((e) {
          return DropdownMenuItem(
            value: e['value'] ?? '',
            child: Text(e['label'] ?? '', style: CustomTextStyle.productName),
          );
        }).toList(),
        onChanged: (value) {
          print('onChanged $value');
          ref.read(transactionManagementProvider.notifier).onDateChange(value);
        },
      ),
    );
  }
}
