import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

import '../../../../core/const/log_page.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/utils/confirmation_dialog.dart';
import '../../../../domain/entities/general_request_model.dart';
import '../../../../domain/entities/transaction/cart/request/producs/products_request_model.dart';
import '../../../providers/cores/router/go_router_provider.dart';
import '../../../providers/main/log/user_activity_log_provider/user_activity_log_provider.dart';
import '../../../providers/main/master_data/categories_product/list/get_master_categories_product_provider.dart';
import '../../../providers/main/master_data/products/list/get_master_products_provider.dart';
import '../../../providers/main/page_provider.dart';
import '../../../providers/main/report/daily_recap/daily_recap_provider.dart';
import '../../../providers/main/report/outlet_expense/get_outlet_expense/get_outlet_expense_provider.dart';
import '../../../providers/main/report/qr_table/qr_table_provider.dart';
import '../../../providers/main/report/transaction_management/transaction_management_provider.dart';
import '../../../providers/main/user_data/user_data_provider.dart';

class DrawerMethods {
  // Static method for navigation
  static void navigateToPage(WidgetRef ref, BuildContext context, int pageIndex,
      [String? logPage]) {
    ref.read(routerProvider).pop();
    ref.read(pageProvider.notifier).setPage(pageIndex);
    actionPage(pageIndex, ref, context);
    if (logPage != null) {
      ref.read(userActivityLogProvider.notifier).userActivityLog(logPage);
    }
  }

  // Static method for handling page actions
  static void actionPage(int pageIndex, WidgetRef ref, BuildContext context) {
    switch (pageIndex) {
      case 0:
        // ref.read(routerProvider).goNamed('dashboard');
        break;
      case 1:
        actionManagementTransaction(ref, context);
        break;
      case 2:
        actionDailyRecap(ref, context);
        break;

      case 3:
        actionExpenditureData(ref, context);
        break;
      case 4:
        actionQrTable(ref, context);
        break;
      case 5:
        actionProduct(ref, context);
        break;
      case 6:
        actionCategoryProduct(ref, context);
        break;
      default:
        print('page index : $pageIndex');
        break;
    }
  }

  // Static method for locking the screen
  static Future<void> lockScreen(BuildContext context, WidgetRef ref) async {
    final result = await context.confirmationPopUp(
      type: DialogType.success,
      titleMessage: 'Kunci Layar',
      content: 'Apakah kamu yakin ingin mengunci layar?',
      context: context,
    );
    if (result != null && result) {
      await Hive.box<bool>('is_locked').put('is_locked', true);
      ref.read(routerProvider).goNamed('pin');
      ref
          .read(userActivityLogProvider.notifier)
          .userActivityLog(lockScreenPage);
    }
  }

  // Static method for logout
  static Future<void> logout(BuildContext context, WidgetRef ref) async {
    final result = await context.confirmationPopUp(
      type: DialogType.warning,
      titleMessage: 'Keluar Aplikasi',
      content: 'Apakah kamu yakin ingin keluar dari aplikasi?',
      context: context,
    );
    if (result != null && result) {
      await ref.read(userDataProvider.notifier).logout();
      ref.read(routerProvider).goNamed('login');
    }
  }

  // Static method for transaction management
  static void actionManagementTransaction(WidgetRef ref, BuildContext context) {
    ref.read(transactionManagementProvider.notifier).resetFilter();
    ref
        .read(transactionManagementProvider.notifier)
        .fetchTransaction(request: const GeneralRequestModel(page: 1));

    /// In tablet we at least data but currently we only have 10 data per page
    /// We can remove if the api already have per_page query param
    if (!context.isMobile) {
      ref
          .read(transactionManagementProvider.notifier)
          .fetchTransaction(request: const GeneralRequestModel(page: 2));
    }
  }

  // Static method for daily recap
  static void actionDailyRecap(WidgetRef ref, BuildContext context) {
    ref.read(dailyRecapProvider.notifier).resetState();

    // ref
    //     .read(dailyRecapProvider.notifier)
    //     .fetchDailyRecap(request: const GeneralRequestModel(page: 1));
    ref.read(dailyRecapProvider.notifier).setSelectedDate(DateTime.now());
  }

  // Static method for expenditure data
  static void actionExpenditureData(WidgetRef ref, BuildContext context) {
    ref.read(getOutletExpenseProvider.notifier).resetState();
    ref
        .read(getOutletExpenseProvider.notifier)
        .fetchExpenses(request: const GeneralRequestModel(page: 1));
  }

  // Static method for QR table
  static void actionQrTable(WidgetRef ref, BuildContext context) {
    ref.read(qrTableProvider.notifier).fetchTables('');
  }

  // Static method for product management
  static void actionProduct(WidgetRef ref, BuildContext context) {
    const ProductsRequestModel request = ProductsRequestModel();
    ref
        .read(getMasterProductsProvider.notifier)
        .fetchProducts(request, refresh: true);
  }

  // Static method for category product management
  static void actionCategoryProduct(WidgetRef ref, BuildContext context) {
    ref
        .read(getMasterCategoriesProductProvider.notifier)
        .fetchCategories(refresh: true);
  }
}
