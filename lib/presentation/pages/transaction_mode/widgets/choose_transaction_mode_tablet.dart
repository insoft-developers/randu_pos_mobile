import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/entities/transaction/cart/table_model.dart';
import '../../../../domain/entities/transaction/sale_type/sale_type_enum.dart';
import '../../../providers/cores/router/go_router_provider.dart';
import '../../../providers/main/cart/cart_provider.dart';
import '../../../providers/main/cart/get_tables/get_tables_provider.dart';
import '../../../widgets/core/buttons/primary_button.dart';
import '../../../widgets/core/loading/skeleton.dart';
import '../../../widgets/core/text/custom_text.dart';
import 'transaction_option.dart';

class ChooseTransactionModeTablet extends ConsumerStatefulWidget {
  const ChooseTransactionModeTablet({super.key});

  @override
  ConsumerState<ChooseTransactionModeTablet> createState() =>
      _ChooseTransactionModeTabletState();
}

class _ChooseTransactionModeTabletState
    extends ConsumerState<ChooseTransactionModeTablet> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(getTablesProvider.notifier).fetchTables();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final tablesProvider = ref.watch(getTablesProvider);
    final cart = ref.watch(cartProvider);

    List<TableModel> tables = tablesProvider.value?.tables ?? [];
    TableModel? chosenTable = tablesProvider.value?.chosenTable;
    SaleTypeEnum? saleType = tablesProvider.value?.saleType;
    return ConstrainedBox(
      constraints:
          BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          tables is AsyncLoading
              ? Expanded(
                  child: Wrap(
                    spacing: 16, // Horizontal spacing between children
                    runSpacing: 16, // Vertical spacing between rows
                    children: List.generate(8, (index) {
                      return const SizedBox(
                        width: 200, // Fixed width to mimic grid behavior
                        child: Skeleton(radius: 8),
                      );
                    }),
                  ),
                )
              : tables is AsyncError
                  ? CustomText('Error: ${tablesProvider.toString()}')
                  : Expanded(
                      child: GridView.count(
                        crossAxisCount: 4,
                        semanticChildCount: tables.length,
                        childAspectRatio: 3,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        children: List.generate(tables.length, (index) {
                          return GestureDetector(
                            onTap: () {
                              final tableSelected = tables[index];
                              if (tableSelected.getAvailability() ==
                                  TableAvailability.reserved) {
                                return;
                              }
                              ref
                                  .read(getTablesProvider.notifier)
                                  .setChosenTable(tableSelected);
                            },
                            child: SizedBox(
                              width: 200, // Fixed width to mimic grid behavior
                              child: TransactionOption(
                                value: tables[index],
                                chosenTable: chosenTable,
                                selectedInCart: tables[index] == cart.table,
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
          const SizedBox(height: 40),
          Container(
            padding: MediaQuery.of(context).viewInsets,
            width: 350,
            height: 50,
            child: Row(
              children: [
                Expanded(
                    child: PrimaryButton(
                  label: 'Batal',
                  onTap: () {
                    Navigator.pop(context);
                  },
                  buttonPrimaryType: ButtonPrimaryType.outlinedError,
                )),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: PrimaryButton(
                    disabled: chosenTable == null && saleType == null,
                    label: 'Proses',
                    onTap: () {
                      // if (chosenTable == null) return;
                      ref.read(cartProvider.notifier).setTable(chosenTable);
                      ref
                          .read(cartProvider.notifier)
                          .setSaleType(saleType!.value);
                      ref.read(routerProvider).pop();
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
