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

class ChooseTransactionModeMobile extends ConsumerStatefulWidget {
  const ChooseTransactionModeMobile({super.key});

  @override
  ConsumerState<ChooseTransactionModeMobile> createState() =>
      _ChooseTransactionModeMobileState();
}

class _ChooseTransactionModeMobileState
    extends ConsumerState<ChooseTransactionModeMobile> {
  @override
  initState() {
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
    return Flexible(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          tables is AsyncLoading
              ? GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 2,
                  ),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return const Skeleton(radius: 8);
                  },
                )
              : tables is AsyncError
                  ? CustomText('Error : ${tablesProvider.error.toString()}')
                  : ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height *
                            0.5, // Limit the height to 50% of the screen
                      ),
                      child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                          childAspectRatio: 2,
                        ),
                        itemCount: tables.length,
                        itemBuilder: (context, index) {
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
                            child: TransactionOption(
                              value: tables[index],
                              chosenTable: tablesProvider.value?.chosenTable,
                              selectedInCart:
                                  tables[index].id == cart.table?.id,
                            ),
                          );
                        },
                      ),
                    ),
          const SizedBox(
            height: 16,
          ),
          Row(
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
                  onTap: () async {
                    ref.read(cartProvider.notifier).setTable(chosenTable);
                    ref
                        .read(cartProvider.notifier)
                        .setSaleType(saleType!.value);
                    if (ref.read(routerProvider).canPop()) {
                      ref.read(routerProvider).pop();
                    }
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
