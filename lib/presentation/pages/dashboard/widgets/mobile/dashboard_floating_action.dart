import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/misc/app_image.dart';
import '../../../../../core/utils/rounded_bottom_sheet.dart';
import '../../../../providers/cores/router/go_router_provider.dart';
import '../../../../providers/main/cart/cart_provider.dart';
import '../../../../providers/main/saved/get_saved_transactions/get_saved_transactions_provider.dart';
import '../../../../widgets/core/container/custom_rounded_container.dart';
import '../../../../widgets/core/text/custom_text.dart';
import '../shipping_fee_input.dart';

class DashboardFloatingAction extends ConsumerStatefulWidget {
  const DashboardFloatingAction({super.key});

  @override
  ConsumerState<DashboardFloatingAction> createState() =>
      _DashboardFloatingActionState();
}

class _DashboardFloatingActionState
    extends ConsumerState<DashboardFloatingAction> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(getSavedTransactionsProvider.notifier).fetchSavedTransactions();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cart = ref.watch(cartProvider);
    final savedTransaction = ref.watch(getSavedTransactionsProvider);
    List<CartState> listSavedTransaction = savedTransaction.value ?? [];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              if (listSavedTransaction.isNotEmpty) {
                ref.read(routerProvider).pushNamed('saved_transaction');
              }
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(12),
                ),
                color: listSavedTransaction.isNotEmpty
                    ? Colors.lightBlue[100]
                    : Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  getSvgImage('basket-shopping', color: Colors.blue),
                  const SizedBox(width: 2),
                  Text(
                    'Tersimpan',
                    style: CustomTextStyle.lightComponentInputLabel.copyWith(
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(width: 4),
                  if (listSavedTransaction.isNotEmpty)
                    CustomRoundedContainer(
                      radius: 2,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 2),
                      color: Colors.red[600],
                      child: Text(
                        listSavedTransaction.length.toString(),
                        style: CustomTextStyle.lightComponentInputLabel
                            .copyWith(color: Colors.white, fontSize: 11),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 12),
          child: VerticalDivider(width: 1),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () async {
              await showRoundedBottomSheet(
                context: context,
                isDismissible: false,
                onClose: (value) {
                  print(value);
                },
                builder: (context) => const ShippingFeeInput(),
                enableDrag: false,
              );
            },
            child: Container(
              color: (cart.orderFee ?? 0) > 0
                  ? Colors.lightBlue[100]
                  : Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.local_shipping_outlined,
                    size: 24,
                    color: Colors.blue,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Tambahan',
                    style: CustomTextStyle.lightComponentInputLabel.copyWith(
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 12),
          child: VerticalDivider(width: 1),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              ref.read(routerProvider).pushNamed('discount');
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.horizontal(
                  right: Radius.circular(12),
                ),
                color: cart.discount != null
                    ? Colors.lightBlue[100]
                    : Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  getSvgImage(
                    'discount',
                    width: 20,
                    height: 20,
                    color: Colors.blue,
                  ),
                  const SizedBox(width: 4),
                  Text('Voucher',
                      style: CustomTextStyle.lightComponentInputLabel.copyWith(
                        color: Colors.black87,
                      ))
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
