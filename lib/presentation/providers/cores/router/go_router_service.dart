import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_ce/hive.dart';

import '../../../../core/const/constant.dart';
import '../../../../domain/entities/general_response.dart';
import '../../../../domain/entities/transaction/cart/category_model.dart';
import '../../../../domain/entities/transaction/cart/product_model.dart';
import '../../../../domain/entities/transaction/cart/request/payment/payment_request_model.dart';
import '../../../../domain/entities/user_model.dart';
import '../../../../insoft/pages/rekap.dart';
import '../../../pages/daily_recap/daily_recap_page.dart';
import '../../../pages/discount/discount_mobile_page.dart';
import '../../../pages/expenditure_data/expenditure_data_page.dart';
import '../../../pages/login/login_page.dart';
import '../../../pages/main/main_page.dart';
import '../../../pages/master_data/category_products/add/category_product_add_page.dart';
import '../../../pages/master_data/products/add/product_add_page.dart';
import '../../../pages/payment_methods/payment_method_empty_page.dart';
import '../../../pages/payment_methods/payment_methods_page.dart';
import '../../../pages/pin/pin_screen.dart';
import '../../../pages/printer/multi_device_printer_page.dart';
import '../../../pages/printer/single_device_printer_page.dart';
import '../../../pages/profile/profile_page.dart';
import '../../../pages/qr_table/qr_table_page.dart';
import '../../../pages/receipt/receipt_page.dart';
import '../../../pages/saved_transaction/saved_transaction_page.dart';
import '../../../pages/settings/settting_page.dart';
import '../../../pages/splashscreen/splashscreen.dart';
import '../../../pages/splashscreen/update_screen.dart';
import '../../../pages/split_bill/split_bill_page.dart';
import '../../../pages/transaction_management/transaction_management_page.dart';
import '../../../pages/transaction_success/transaction_success_page.dart';
import '../../main/cart/cart_provider.dart';
import '../http_client/dio_provider.dart';
import 'go_router_provider.dart';

class GoRouterService {
  static GoRouter getRouter(RouterRef ref) => GoRouter(
        routes: [
          GoRoute(
            path: '/splashscreen',
            name: 'splashscreen',
            builder: (context, state) => const SplashScreen(),
            redirect: (context, GoRouterState state) async {
              final dio = ref.read(dioProvider);
              final isUpToDate =
                  await dio.get('/check-version-mobile', queryParameters: {
                'version': versionCode,
              });
              if (isUpToDate.statusCode == 200) {
                final response = GeneralResponse.fromJson(isUpToDate.data);
                print('check version app success');
                print(response.data);
                if (response.status) {
                  final user = Hive.box<UserModel>('userBox');
                  await Future.delayed(const Duration(seconds: 2));
                  if (user.isNotEmpty) {
                    if (kDebugMode) {
                      print('redirect to dashboard');
                    }
                    final isLocked = Hive.box<bool>('is_locked');
                    print(isLocked.get('is_locked'));
                    if (isLocked.isNotEmpty &&
                        isLocked.get('is_locked') == true) {
                      FlutterNativeSplash.remove();
                      return '/pin';
                    }

                    FlutterNativeSplash.remove();
                    return '/dashboard';
                  }
                  FlutterNativeSplash.remove();
                  return '/login';
                } else {
                  print('need to update');
                  FlutterNativeSplash.remove();
                  return '/update';

                  ///check version app failed
                }
              }
              return null;
            },
          ),
          GoRoute(
            path: '/dashboard',
            name: 'dashboard',
            builder: (context, state) => const MainPage(),
          ),
          GoRoute(
            path: '/login',
            name: 'login',
            builder: (context, state) => const LoginPage(),
          ),
          GoRoute(
            path: '/pin',
            name: 'pin',
            builder: (context, state) => const PinScreen(),
          ),
          GoRoute(
            path: '/payment_methods',
            name: 'payment_methods',
            builder: (context, state) {
              // ref.read(getPaymentMethodsProvider.notifier).fetchPaymentMethods();
              return const PaymentMethodsPage();
            },
            redirect: (context, state) async {
              // final paymentMethods =
              //     await ref.read(getPaymentMethodsProvider.future);
              // if (paymentMethods.isEmpty) {
              //   log('payment methods empty');
              //   return '/payment_method_empty';
              // }
              return null; // No redirection needed
            },
          ),
          GoRoute(
            path: '/discount',
            name: 'discount',
            builder: (context, state) => const DiscountMobilePage(),
          ),
          GoRoute(
            path: '/transaction_success',
            name: 'transaction_success',
            builder: (context, state) => const TransactionSuccessPage(),
          ),
          GoRoute(
            path: '/payment_method_empty',
            name: 'payment_method_empty',
            builder: (context, state) => const PaymentMethodEmptyPage(),
          ),
          GoRoute(
            path: '/settings',
            name: 'settings',
            pageBuilder: (context, state) {
              final withScaffold = state.extra as bool? ?? false;
              return CupertinoPage(
                  child: SettingPage(
                withScaffold: withScaffold,
              ));
            },
          ),
          GoRoute(
            path: '/list_device_printer',
            name: 'list_device_printer',
            pageBuilder: (context, state) =>
                const CupertinoPage(child: SingleDevicePrinterPage()),
          ),
          GoRoute(
            path: '/multi_device_printer',
            name: 'multi_device_printer',
            pageBuilder: (context, state) =>
                const CupertinoPage(child: MultiDevicePrinterPage()),
          ),
          GoRoute(
            path: '/printer_page',
            name: 'printer_page',
            builder: (context, state) {
              final paymentReceipt = state.extra as PaymentReceiptModel;
              return ReceiptPage(cartPaymentReceipt: paymentReceipt);
            },
          ),
          GoRoute(
            path: '/transaction_management',
            name: 'transaction_management',
            builder: (context, state) => const TransactionManagementPage(),
          ),
          GoRoute(
            path: '/qr_meja',
            name: 'qr_meja',
            builder: (context, state) => const QrTablePage(),
          ),
          GoRoute(
            path: '/daily_recap',
            name: 'daily_recap',
            builder: (context, state) => const DailyRecapPage(),
          ),
          GoRoute(
            path: '/rekap-v2',
            name: 'rekap-v2',
            builder: (context, state) => Rekap(),
          ),
          GoRoute(
            path: '/expenditure_data',
            name: 'expenditure_data',
            builder: (context, state) => const ExpenditureDataPage(),
          ),
          GoRoute(
            path: '/saved_transaction',
            name: 'saved_transaction',
            builder: (context, state) {
              return const SavedTransactionPage();
            },
          ),
          GoRoute(
            path: '/update',
            name: 'update',
            builder: (context, state) {
              return const UpdateScreen();
            },
          ),
          GoRoute(
            path: '/product_add',
            name: 'product_add',
            builder: (context, state) {
              final ProductModel? product = state.extra as ProductModel?;
              return ProductAddPage(
                model: product,
              );
            },
          ),
          GoRoute(
            path: '/split_bill',
            name: 'split_bill',
            builder: (context, state) {
              final CartState cart = state.extra as CartState;
              return SplitBillPage(
                cart: cart,
              );
            },
          ),
          GoRoute(
            path: '/category_product_add',
            name: 'category_product_add',
            builder: (context, state) {
              final CategoryModel? categoryProduct =
                  state.extra as CategoryModel?;
              return CategoryProductAddPage(
                model: categoryProduct,
              );
            },
          ),
          GoRoute(
              path: '/profile',
              name: 'profile',
              builder: (context, state) => const ProfilePage()),
        ],
        initialLocation: '/splashscreen',
      );
}
