
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:oktoast/oktoast.dart';

import '../../../core/const/colors.dart';
import '../../../core/utils/currency_utils.dart';
import '../../../core/utils/date_utils.dart';
import '../../providers/main/cart/cart_provider.dart';
import '../../providers/main/split_bill/split_bill_transaction/split_bill_transaction_provider.dart';
import '../../widgets/core/buttons/primary_button.dart';
import '../../widgets/core/container/custom_rounded_container.dart';
import '../../widgets/core/line/Line.dart';
import '../../widgets/core/line/advanced_line.dart';
import '../../widgets/core/text/custom_text_style.dart';
import 'widgets/split_bill_list_item.dart';

class SplitBillPage extends ConsumerStatefulWidget {
  final CartState cart;
  const SplitBillPage({super.key, required this.cart});

  @override
  ConsumerState createState() => _SplitBillPageState();
}

class _SplitBillPageState extends ConsumerState<SplitBillPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(splitBillTransactionProvider.notifier).initItem(widget.cart);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cart = widget.cart;
    String? tableNumber = cart.table?.noMeja;
    String? note = cart.customer?.name;

    final cartSplit = ref
        .watch(splitBillTransactionProvider.select((value) => value.splitCart));

    final cartOriginal = ref.watch(
        splitBillTransactionProvider.select((value) => value.originalCart));

    _splitBillListener(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Split Bill'),
      ),
      body: ListView(padding: const EdgeInsets.all(16), children: [
        _transactionHeader(cart),
        _transactionOptionalInfo(note, tableNumber, cart),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: AdvancedLine(
            direction: Axis.horizontal,
            line: DashedLine(dashSize: 8),
            paintDef: Paint()
              ..color = CustomColors.darkGray
              ..strokeWidth = 1,
          ),
        ),
        const SplitBillListItem()
      ]),
      bottomNavigationBar: _bottomNavButton(cartSplit, cartOriginal),
    );
  }

  Widget _bottomNavButton(CartState? cartSplit, CartState? cartOriginal) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: PrimaryButton(
          disabled:
              cartSplit?.totalQuantity == 0 || cartOriginal?.totalQuantity == 0,
          label: 'Split Bill',
          onTap: () {
            ref
                .read(splitBillTransactionProvider.notifier)
                .splitBillTransaction();
          }),
    );
  }

  Widget _transactionOptionalInfo(
      String? note, String? tableNumber, CartState cart) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        note != null
            ? Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.person_2_outlined,
                      size: 16,
                      color: CustomColors.darkGray,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        'Pelanggan : $note',
                        style: CustomTextStyle.body3.copyWith(
                          fontSize: 12,
                          color: CustomColors.darkGray,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : const Spacer(),
        const SizedBox(width: 14),
        tableNumber != null
            ? CustomRoundedContainer(
                shadow: const [],
                radius: 4,
                color: Colors.lightBlue.shade100,
                padding: const EdgeInsets.fromLTRB(8, 3, 8, 4),
                child: Text(
                  'Meja ${cart.table?.noMeja ?? '1'}',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: Colors.blue.shade800,
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }

  Widget _transactionHeader(CartState cart) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cart.savedCartInfo?.id ?? '-',
                  style: CustomTextStyle.productName
                      .copyWith(color: Colors.blue.shade800),
                ),
                const SizedBox(height: 4),
                Text(
                  formatStringIDRToCurrency(
                    text: cart.totalPrice.toString(),
                    symbol: 'Rp ',
                    isDouble: true,
                  ),
                  style: CustomTextStyle.mobileDialogText,
                ),
              ],
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.access_time,
                  color: Colors.grey.shade400,
                  size: 18,
                  weight: .5,
                ),
                const SizedBox(width: 4),
                Text(
                  formatDateToString(cart.savedCartInfo?.createdAt,
                          format: 'HH:mm') ??
                      '',
                  style: CustomTextStyle.body3.copyWith(fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  void _splitBillListener(BuildContext context) {
    ref.listen(splitBillTransactionProvider, (previous, next) {
      final value = next.status;
      if (value != null && value) {
        showToast('Berhasil split bill');
        context.pop();
      } else if (value != null && !value) {
        showToast('Gagal split bill : ${next.errorMessage}');
      }
    });
  }
}
