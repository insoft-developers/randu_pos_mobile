import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/const/colors.dart';
import '../../../../domain/entities/transaction/sale_type/sale_type_enum.dart';
import '../../../providers/main/cart/cart_provider.dart';
import '../../../providers/main/cart/get_tables/get_tables_provider.dart';
import '../../../widgets/core/dropdown/custom_dropdown_button_form_field.dart';
import '../../../widgets/core/text/custom_text.dart';

class TransactionModeTitle extends ConsumerWidget {
  const TransactionModeTitle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: CustomDropdownButtonFormField(
          context: context,
          items: SaleTypeEnum.values
              .map((value) => DropdownMenuItem(
                  value: value,
                  child: CustomText(
                    value.name,
                    style: const TextStyle(color: CustomColors.black),
                  )))
              .toList(),
          // value: ref.watch(
          //     getTablesProvider.select((state) => state.value?.saleType)),
          value: ref.watch(cartProvider.select((state) => state.saleTypeEnum)),
          onChanged: (value) {
            print(value);
            ref.read(getTablesProvider.notifier).setSaleType(value);
            // ref.read(cartProvider.notifier).setSaleType(valueEnum.value);
          }),
    );
  }
}
