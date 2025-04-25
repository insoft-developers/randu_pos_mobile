import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/const/colors.dart';
import '../../../../../core/utils/rounded_bottom_sheet.dart';
import '../../../../providers/main/cart/cart_provider.dart';
import '../../../../providers/main/cart/search_product/search_product_provider.dart';
import '../../../../widgets/core/buttons/randu_button.dart';
import '../../../transaction_mode/transaction_mode_mobile.dart';
import '../phone_number_input.dart';
import '../search_product.dart';
import 'name_and_additional_info.dart';

class DashboardHeaderActionMobile extends ConsumerStatefulWidget {
  final bool isCartPage;

  const DashboardHeaderActionMobile({super.key, this.isCartPage = false});

  @override
  ConsumerState<DashboardHeaderActionMobile> createState() =>
      _DashboardHeaderActionMobileState();
}

class _DashboardHeaderActionMobileState
    extends ConsumerState<DashboardHeaderActionMobile> {
  @override
  Widget build(BuildContext context) {
    final cart = ref.watch(cartProvider);
    var tableNumber = cart.table?.noMeja;
    var customer = cart.customer;
    final showSearch = ref.watch(activateSearchProductProvider);
    return Stack(
      children: [
        Row(
          children: [
            RanduButton(
                color: tableNumber == null
                    ? Colors.white
                    : CustomColors.primaryColor,
                backgroundColor:
                    tableNumber != null ? Colors.white.withValues(alpha: 0.9) : null,
                text: tableNumber == null
                    ? 'Tipe Penjualan '
                    : 'Meja $tableNumber  ',
                icon: Icons.apps,
                onPressed: () async {
                  await showRoundedBottomSheet(
                    context: context,
                    isDismissible: false,
                    onClose: (value) {
                      print(value);
                    },
                    builder: (context) => const TransactionModeMobile(),
                    enableDrag: false,
                  );
                }),
            const Spacer(flex: 12),
            RanduButton(
                color:
                    customer == null ? Colors.white : CustomColors.primaryColor,
                backgroundColor:
                    customer != null ? Colors.white.withValues(alpha: 0.9) : null,
                icon: Icons.person_sharp,
                onPressed: () async {
                  await showRoundedBottomSheet(
                    context: context,
                    isDismissible: false,
                    onClose: (value) {
                      print(value);
                    },
                    builder: (context) => const NameAndAdditionalInfo(),
                    enableDrag: false,
                  );
                }),
            const Spacer(flex: 1),
            RanduButton(
                color: Colors.white,
                icon: Icons.phone_android_outlined,
                onPressed: () async {
                  await showRoundedBottomSheet(
                    context: context,
                    isDismissible: false,
                    onClose: (value) {
                      print(value);
                    },
                    builder: (context) => const PhoneNumberInput(),
                    enableDrag: false,
                  );
                }),
            widget.isCartPage ? const SizedBox.shrink() : const Spacer(),
            widget.isCartPage
                ? const SizedBox.shrink()
                : RanduButton(
                    color: Colors.white,
                    icon: Icons.search,
                    onPressed: () async {
                      ref
                          .read(activateSearchProductProvider.notifier)
                          .toggleSearch();
                    },
                  ),
          ],
        ),
        if (showSearch) const SearchProductDashboard() else const SizedBox(),
      ],
    );
  }
}
