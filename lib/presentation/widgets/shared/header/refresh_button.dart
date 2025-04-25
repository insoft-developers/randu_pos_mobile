import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/entities/general_request_model.dart';
import '../../../../domain/entities/transaction/cart/request/producs/products_request_model.dart';
import '../../../providers/main/master_data/categories_product/list/get_master_categories_product_provider.dart';
import '../../../providers/main/master_data/products/list/get_master_products_provider.dart';
import '../../../providers/main/page_provider.dart';
import '../../../providers/main/report/daily_recap/daily_recap_provider.dart';
import '../../../providers/main/report/outlet_expense/get_outlet_expense/get_outlet_expense_provider.dart';
import '../../../providers/main/report/qr_table/qr_table_provider.dart';
import '../../../providers/main/report/transaction_management/transaction_management_provider.dart';

class RefreshButton extends ConsumerWidget {
  const RefreshButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () {
        final page = ref.watch(pageProvider.select((value) => value.page));
        if (page == 1) {
          ref.read(transactionManagementProvider.notifier).resetValue();
          ref
              .read(transactionManagementProvider.notifier)
              .fetchTransaction(request: const GeneralRequestModel(page: 1));
        } else if (page == 2) {
          var selected = ref.read(dailyRecapProvider).value?.selectedDate;
          ref.read(dailyRecapProvider.notifier).resetState();
          ref
              .read(dailyRecapProvider.notifier)
              .setSelectedDate(selected ?? DateTime.now());
        } else if (page == 3) {
          ref.read(getOutletExpenseProvider.notifier).resetState();
          ref
              .read(getOutletExpenseProvider.notifier)
              .fetchExpenses(request: const GeneralRequestModel(page: 1));
        } else if (page == 4) {
          ref.read(qrTableProvider.notifier).fetchTables('');
        } else if (page == 5) {
          const request = ProductsRequestModel();
          ref
              .read(getMasterProductsProvider.notifier)
              .fetchProducts(request, refresh: true);
        } else if (page == 6) {
          ref
              .read(getMasterCategoriesProductProvider.notifier)
              .fetchCategories(refresh: true);
        }
      },
      icon: const Icon(
        Icons.refresh_rounded,
        color: Colors.white,
        size: 24,
      ),
    );
  }
}
