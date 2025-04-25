import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

import '../../../core/const/colors.dart';
import '../../../core/const/constant.dart';
import '../../../core/const/log_page.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/utils/confirmation_dialog.dart';
import '../../../core/utils/custom_alert_dialog.dart';
import '../../../core/utils/rounded_bottom_sheet.dart';
import '../../../domain/entities/transaction/cart/request/producs/products_request_model.dart';
import '../../../domain/entities/user_model.dart';
import '../../../domain/usecases/report/outlet_expense/create_outlet_expense/create_outlet_expense_uc.dart';
import '../../../insoft/pages/rekap.dart';
import '../../providers/cores/connectivity_service/check_connectivity_provider.dart';
import '../../providers/main/cart/get_category_product/category_product_provider.dart';
import '../../providers/main/cart/get_payment_methods/get_payment_methods_provider.dart';
import '../../providers/main/cart/get_products/get_products_provider.dart';
import '../../providers/main/cart/get_tables/get_tables_provider.dart';
import '../../providers/main/log/user_activity_log_provider/user_activity_log_provider.dart';
import '../../providers/main/page_provider.dart';
import '../../providers/main/printer/multi_printer/printer_multi_provider.dart';
import '../../providers/main/printer/printer_service_provider.dart';
import '../../providers/main/report/outlet_expense/create_outlet_expense/create_outlet_expense_provider.dart';
import '../../providers/main/user_data/user_data_provider.dart';
import '../../widgets/core/drawer/randu_drawer.dart';
import '../../widgets/core/text/custom_text.dart';
import '../daily_recap/daily_recap_page.dart';
import '../dashboard/dashboard_page.dart';
import '../expenditure_data/create_expense_form.dart';
import '../expenditure_data/expenditure_data_page.dart';
import '../master_data/category_products/list/categories_product_page.dart';
import '../master_data/products/list/products_page.dart';
import '../qr_table/qr_table_page.dart';
import '../settings/settting_page.dart';
import '../transaction_management/transaction_management_page.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(connectionStatusProvider.notifier).checkConnection();
      const ProductsRequestModel request = ProductsRequestModel();
      await ref.read(userDataProvider.notifier).getUser();
      Future.wait([
        ref
            .read(categoryProductProvider.notifier)
            .fetchCategories(refresh: true),
        ref
            .read(getProductsProvider.notifier)
            .fetchProducts(request, refresh: true),
        ref
            .read(getPaymentMethodsProvider.notifier)
            .fetchPaymentMethods(refresh: true),
        ref.read(getTablesProvider.notifier).fetchTables(refresh: true),
        ref
            .read(userActivityLogProvider.notifier)
            .userActivityLog(logDashboardPage),
      ]);
      ref.read(printerServiceProvider.notifier).automaticallyConnectPrinter();
      ref.read(printerMultiProvider.notifier).getPrinterFolders();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final page = ref.watch(pageProvider.select((p) => p.page));
    return PopScope(
      onPopInvokedWithResult: (bool didPop, _) async {
        if (didPop) return;

        final result = await context.confirmationPopUp(
          context: context,
          isCancelable: false,
          titleMessage: 'Keluar Aplikasi',
          content: 'Apakah kamu yakin ingin keluar dari aplikasi?',
          type: DialogType.warning,
        );
        final bool shouldPop = result ?? false;
        if (context.mounted && shouldPop) {
          SystemNavigator.pop();
        }
      },
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          drawer: const RanduDrawer(),
          onDrawerChanged: (isOpen) {},
          floatingActionButton: ValueListenableBuilder(
            valueListenable: Hive.box<bool>(isCashierOpenData).listenable(),
            builder: (context, box, child) {
              if ((box.get(isCashierOpenData) ?? false) && page == 3) {
                return buildFloatingActionButton(
                    box.get(isCashierOpenData) ?? false, context, ref, page);
              }
              return const SizedBox.shrink();
            },
          ),
          body: ValueListenableBuilder(
            valueListenable: Hive.box<UserModel>('userBox').listenable(),
            builder: (context, box, child) {
              if (box.get('userBox') != null) {
                return IndexedStack(
                  index: page,
                  children: [
                    const DashboardPage(),
                    const TransactionManagementPage(),
                    const DailyRecapPage(),
                    const ExpenditureDataPage(),
                    const QrTablePage(),
                    // AttendancePage(),
                    const ProductsPage(),
                    const CategoriesProductPage(),
                    const SettingPage(
                      withScaffold: false,
                    ),
                    Rekap()
                  ],
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }

  Widget buildFloatingActionButton(
      bool isCashierOpen, BuildContext context, WidgetRef ref, int page) {
    return FloatingActionButton.extended(
      backgroundColor:
          isCashierOpen ? CustomColors.primaryColor : CustomColors.darkGray,
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      onPressed: () async {
        if (!isCashierOpen) return;
        if (context.isMobile) {
          await showRoundedBottomSheet(
            context: context,
            isDismissible: false,
            onClose: (value) {
              print(value);
            },
            builder: (context) => CreateExpenseForm(
              title: 'Masukkan Data',
              onSave: (name, amount) async {
                final result = await context.confirmationPopUp(
                    context: context,
                    titleMessage: 'Konfirmasi',
                    content:
                        'Apakah anda yakin ingin menambahkan pengeluaran ini?',
                    type: DialogType.warning);
                if (result != null && result) {
                  final params = CreateOutletExpenseParams(
                      amount: int.parse(amount), name: name);
                  ref
                      .read(createOutletExpenseProvider.notifier)
                      .createOutletExpense(params);
                  if (context.mounted) {
                    context.pop();
                  }
                }
              },
              onCancel: () {
                print('Comment editing canceled');
              },
            ),
            enableDrag: false,
          );
        } else {
          await showCustomAlertDialog(
            context: context,
            barrierDismissable: false,
            onClose: (value) {
              print(value);
            },
            builder: (context) => AlertDialog(
              content: SizedBox(
                width: 500, // MediaQuery.of(context).size.width * 0.5,
                child: CreateExpenseForm(
                  title: 'Masukkan Data',
                  onSave: (name, amount) async {
                    print('onsave');
                    final result = await context.confirmationPopUp(
                        context: context,
                        titleMessage: 'Konfirmasi',
                        content:
                            'Apakah anda yakin ingin menambahkan pengeluaran ini?',
                        type: DialogType.warning);
                    if (result != null && result) {
                      final params = CreateOutletExpenseParams(
                          amount: int.parse(amount), name: name);
                      ref
                          .read(createOutletExpenseProvider.notifier)
                          .createOutletExpense(params);
                      if (context.mounted) {
                        context.pop();
                      }
                    }
                  },
                  onCancel: () {
                    print('Comment editing canceled');
                  },
                ),
              ),
            ),
          );
        }
      },
      label: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: CustomText(
          'Tambah Pengeluaran',
          style: CustomTextStyle.mobileDialogText.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
