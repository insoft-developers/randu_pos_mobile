import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

import '../../../../core/const/colors.dart';
import '../../../../core/const/constant.dart';
import '../../../../core/const/log_page.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/misc/app_image.dart';
import '../../../../domain/entities/user_model.dart';
import '../../../providers/main/transaction_provider.dart';
import '../text/custom_text.dart';
import 'drawer_methods.dart';
import 'widgets/widgets.dart';

class RanduDrawer extends ConsumerWidget {
  const RanduDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = Hive.box<UserModel>('userBox').get('userBox');
    final isPettyCashEnabled = user?.isPettyCashEnabled ?? false;

    return Drawer(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.zero)),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                if (!context.isLanscapeAndSmallerThan1000)
                  UserAccountsDrawerHeader(
                    accountName: Text(user?.fullname ?? 'User'),
                    accountEmail: Text(user?.email ?? '-'),
                    currentAccountPictureSize: const Size(250, 50),
                    currentAccountPicture: Center(
                      child: getPngImage(
                        'logo-randu-text-daun-putih',
                        width: 100,
                        height: 50,
                      ),
                    ),
                    decoration: const BoxDecoration(
                      color: CustomColors.primaryColor,
                    ),
                  ),
                CashierStatusTile(isPettyCashEnabled: isPettyCashEnabled),
                if (isPettyCashEnabled) const Divider(),
                DrawerListTile(
                  icon: Icons.shopping_cart,
                  title: 'Kasir & Penjualan',
                  onTap: () => DrawerMethods.navigateToPage(ref, context, 0),
                ),
                DrawerListTile(
                  icon: Icons.payment,
                  title: 'Manajemen Pesanan',
                  onTap: () => DrawerMethods.navigateToPage(
                      ref, context, 1, logTransactionManagementPage),
                ),
                // DrawerListTile(
                //   icon: Icons.receipt,
                //   title: 'Rekapitulasi Harian',
                //   onTap: () => DrawerMethods.navigateToPage(
                //       ref, context, 2, logDailyRecapPage),
                // ),
                DrawerListTile(
                  icon: Icons.receipt,
                  title: 'Rekapitulasi Harian',
                  onTap: () =>
                      DrawerMethods.navigateToPage(ref, context, 8, logRekap),
                ),
                DrawerListTile(
                  icon: Icons.monetization_on,
                  title: 'Data Pengeluaran',
                  onTap: () => DrawerMethods.navigateToPage(
                      ref, context, 3, logExpenditureDataPage),
                ),
                DrawerListTile(
                  icon: Icons.qr_code,
                  title: 'QR Meja & Reservasi',
                  onTap: () => DrawerMethods.navigateToPage(
                      ref, context, 4, logQrTablePage),
                ),
                DrawerExpansionTile(
                  icon: Icons.add_box,
                  title: 'Manajemen Produk',
                  children: [
                    DrawerListTile(
                      icon: Icons.production_quantity_limits,
                      title: 'Produk',
                      onTap: () => DrawerMethods.navigateToPage(
                          ref, context, 5, logProductsPage),
                    ),
                    DrawerListTile(
                      icon: Icons.category,
                      title: 'Kategori Produk',
                      onTap: () => DrawerMethods.navigateToPage(
                          ref, context, 6, logCategoriesProductPage),
                    ),
                  ],
                ),
                DrawerListTile(
                  icon: Icons.print,
                  title: 'Printer',
                  onTap: () => DrawerMethods.navigateToPage(ref, context, 7),
                ),
                DrawerListTile(
                  icon: Icons.person_2,
                  title: 'Profile',
                  onTap: () => context.push('/profile'),
                ),
                DrawerListTile(
                  icon: Icons.sync,
                  title: 'Sync Data',
                  onTap: () =>
                      ref.read(transactionDataProvider.notifier).syncData(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: () {
              // showToast('API : $endpoint');
            },
            child: Column(
              children: [
                CustomText('Versi $versionApp',
                    style: CustomTextStyle.lightComponentInputLabel),
                if (!context.isLanscapeAndSmallerThan1000)
                  Column(
                    children: [
                      const SizedBox(height: 8),
                      CustomText(dateBuild,
                          style: CustomTextStyle.lightComponentInputLabel),
                    ],
                  ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: DrawerListTile(
                  icon: Icons.lock,
                  title: 'Kunci',
                  iconColor: CustomColors.lightFgSuccess,
                  onTap: () => DrawerMethods.lockScreen(context, ref),
                ),
              ),
              Expanded(
                child: DrawerListTile(
                  icon: Icons.logout,
                  title: 'Keluar',
                  iconColor: CustomColors.lightErrorMain,
                  onTap: () => DrawerMethods.logout(context, ref),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
