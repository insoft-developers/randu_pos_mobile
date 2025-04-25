import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/const/colors.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/misc/app_image.dart';
import '../../../../core/utils/confirmation_dialog.dart';
import '../../../../core/utils/currency_utils.dart';
import '../../../../domain/entities/general_response.dart';
import '../../../../domain/entities/transaction/cart/receipt_from_enum.dart';
import '../../../providers/cores/router/go_router_provider.dart';
import '../../../providers/main/cart/cart_provider.dart';
import '../../../providers/main/page_provider.dart';
import '../../../providers/main/saved/delete_saved_transaction/delete_saved_transaction_provider.dart';
import '../../../providers/main/saved/save_transaction/save_transaction_provider.dart';
import '../../../widgets/core/buttons/primary_button.dart';
import '../../../widgets/core/buttons/randu_button.dart';
import '../../../widgets/core/buttons/small_button.dart';
import '../../../widgets/core/container/custom_rounded_container.dart';
import '../../../widgets/core/extension_dialog/extension_dialog.dart';
import '../../../widgets/core/line/Line.dart';
import '../../../widgets/core/line/advanced_line.dart';
import '../../../widgets/core/text/custom_text.dart';

class DashboardActionButton extends ConsumerWidget {
  const DashboardActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);
    final totalQuantity = cart.totalQuantity;
    final subTotal = cart.subTotal;
    final totalPrice = cart.totalPrice;
    final calculatedTotal = cart.calculatedTotal;
    final roundedTotalPrice = cart.roundToNearestThousand(calculatedTotal);
    final voucher = cart.calculateDiscount;
    final orderFee = cart.orderFee ?? 0;
    final subTotalWithTax = cart.subTotalWithTax;
    // final nameAndInfo = cart.note;
    return CustomRoundedContainer(
      shadow: const [],
      color: Colors.white,
      radius: 0,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          OrderDetail(
            totalQuantity: totalQuantity,
            subTotal: subTotal,
            subTotalWithTax: subTotalWithTax,
            voucher: voucher,
            orderFee: orderFee,
            roundedTotalPrice: roundedTotalPrice,
            totalPrice: totalPrice,
            calculatedTotal: calculatedTotal,
            isRounded: cart.user?.isRounded ?? false,
          ),
          SizedBox(height: !context.isLanscapeAndSmallerThan1000 ? 16 : 0),
          context.isLanscapeAndSmallerThan1000
              ? Row(
                  children: [
                    const Expanded(child: SaveActionGroup()),
                    const SizedBox(width: 8),
                    Expanded(
                        child: NavigationButtonGroup(
                            isMobile: context.isMobile, cart: cart)),
                  ],
                )
              : Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8),
                      child: SaveActionGroup(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: NavigationButtonGroup(
                          isMobile: context.isMobile, cart: cart),
                    ),
                  ],
                )
        ],
      ),
    );
  }
}

class SaveActionGroup extends ConsumerWidget {
  const SaveActionGroup({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);
    final totalQuantity = cart.totalQuantity;

    return Row(
      children: [
        Expanded(
            child: SmallButton(
          onPressed: () {
            log('CARTLOG : $cart');

            ref.read(saveTransactionProvider.notifier).saveTransaction(cart);

            ref.invalidate(cartProvider);
            if (context.isMobile) {
              context.pop();
            }
          },
          label: context.isLanscapeAndSmallerThan1000 ? '' : 'Simpan',
          disabled: cart.cartItems.isEmpty,
          isOutlined: true,
          height: 40,
          borderWidth: 1.5,
          radius: 12,
          labelSize: 14,
          preFixWidget: getSvgImage(
            'basket-shopping',
            width: 20,
            color: totalQuantity == 0
                ? CustomColors.darkGray
                : CustomColors.strongOrange,
          ),
          iconSize: 18,
          color: CustomColors.strongOrange,
        )),
        const SizedBox(width: 4),
        Expanded(
            child: SmallButton(
          onPressed: () {
            final cartPaymentReceipt = ref.watch(cartProvider.select((value) =>
                value.toPaymentReceipt(
                    receiptFromEnum: ReceiptFromEnum.saved)));
            ref
                .read(routerProvider)
                .pushNamed('printer_page', extra: cartPaymentReceipt);
          },
          label: context.isLanscapeAndSmallerThan1000 ? '' : 'Struk',
          disabled: cart.cartItems.isEmpty,
          isOutlined: true,
          height: 40,
          borderWidth: 1.5,
          radius: 12,
          labelSize: 14,
          prefixIcon: Icons.print_outlined,
          iconSize: 18,
          color: Colors.blue.shade800,
        )),
        cart.savedCartInfo?.id == null
            ? const SizedBox.shrink()
            : const SizedBox(width: 4),
        cart.savedCartInfo?.id == null
            ? const SizedBox.shrink()
            : Expanded(
                child: SmallButton(
                onPressed: () async {
                  const titleMessage = 'Hapus Transaksi';
                  const content =
                      'Apakah kamu yakin ingin menghapus transaksi tersimpan?';
                  await context
                      .confirmationPopUp(
                          context: context,
                          titleMessage: titleMessage,
                          content: content,
                          type: DialogType.error,
                          iconType: IconType.exclamation)
                      .then(
                    (value) {
                      if (value != null && value) {
                        ref
                            .read(deleteSavedTransactionProvider.notifier)
                            .deleteSavedTransaction(
                                savedId: cart.savedCartInfo!.id!);
                        context
                            .showResultDialog(
                          baseResponse: const GeneralResponse(
                              status: true,
                              message: 'Berhasil menghapus transaksi'),
                        )
                            .then(
                          (value) {
                            ref.read(cartProvider.notifier).resetCart();
                            if (context.isMobile) {
                              context.pop();
                            }
                          },
                        ).catchError(
                          (e) {
                            context.showResultDialog(
                              baseResponse: const GeneralResponse(
                                  status: false,
                                  message: 'Gagal menghapus transaksi'),
                            );
                          },
                        );
                      }
                    },
                  );
                },
                label: context.isLanscapeAndSmallerThan1000 ? '' : 'Hapus',
                isOutlined: true,
                height: 40,
                borderWidth: 1.5,
                radius: 12,
                labelSize: 14,
                prefixIcon: Icons.delete_outline,
                iconSize: 18,
                color: Colors.red.shade800,
              )),
      ],
    );
  }
}

class NavigationButtonGroup extends ConsumerWidget {
  const NavigationButtonGroup({
    super.key,
    required this.isMobile,
    required this.cart,
  });

  final bool isMobile;
  final CartState cart;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subTotal = cart.totalPrice;
    return Row(
      children: [
        isMobile
            ? RanduButton(
                padding: const EdgeInsets.all(12),
                radius: 12,
                icon: Icons.chevron_left,
                borderWidth: 1.5,
                onPressed: () {
                  Navigator.pop(context);
                })
            : const SizedBox.shrink(),
        SizedBox(width: isMobile ? 4 : 0),
        Expanded(
          child: PrimaryButton(
            radius: 12,
            disabled: cart.cartItems.isEmpty,
            buttonPrimaryType: ButtonPrimaryType.solidOrange,
            label: context.isLanscapeAndSmallerThan1000
                ? 'Bayar'
                : 'Bayar | ${formatStringIDRToCurrency(text: subTotal.toString(), symbol: 'Rp ', isDouble: true)}',
            onTap: () async {
              ref.read(routerProvider).pushNamed('payment_methods');
            },
            postFixWidget: context.isLanscapeAndSmallerThan1000
                ? const SizedBox.shrink()
                : const Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Icon(Icons.send, color: Colors.white),
                  ),
          ),
        ),
      ],
    );
  }
}

class OrderDetail extends ConsumerWidget {
  const OrderDetail({
    super.key,
    required this.totalQuantity,
    required this.subTotal,
    required this.subTotalWithTax,
    required this.voucher,
    required this.orderFee,
    required this.roundedTotalPrice,
    required this.totalPrice,
    required this.calculatedTotal,
    required this.isRounded,
  });

  final int totalQuantity;
  final double subTotal;
  final double subTotalWithTax;
  final double voucher;
  final int orderFee;
  final double roundedTotalPrice;
  final double totalPrice;
  final double calculatedTotal;
  final bool isRounded;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isCompleteCartInfo =
        ref.watch(pageProvider.select((value) => value.isCompleteCartInfo));
    final symbol = calculatedTotal > totalPrice ? '-' : '+';
    return CustomRoundedContainer(
      shadow: const [],
      radius: 0,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          context.isLanscapeAndSmallerThan1000
              ? const SizedBox.shrink()
              : AdvancedLine(
                  direction: Axis.horizontal,
                  line: DashedLine(dashSize: 8),
                  paintDef: Paint()
                    ..color = CustomColors.darkGray
                    ..strokeWidth = 1,
                ),
          context.isLanscapeAndSmallerThan1000
              ? InkWell(
                  onTap: () {
                    ref.read(pageProvider.notifier).setCompleteCartInfo();
                  },
                  child: Icon(isCompleteCartInfo
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down),
                )
              : IconButton(
                  onPressed: () {
                    ref.read(pageProvider.notifier).setCompleteCartInfo();
                  },
                  icon: isCompleteCartInfo
                      ? const Icon(Icons.keyboard_arrow_up)
                      : const Icon(Icons.keyboard_arrow_down)),
          if (isCompleteCartInfo)
            Column(
              children: [
                const SizedBox(
                  height: 0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Kuantitas',
                      style: CustomTextStyle.productName,
                    ),
                    Text(totalQuantity.toString())
                  ],
                ),
                const SizedBox(
                  height: 0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Subtotal',
                      style: CustomTextStyle.productName,
                    ),
                    Text(formatStringIDRToCurrency(
                        text: subTotal.toString(), symbol: 'Rp '))
                  ],
                ),
                const SizedBox(
                  height: 0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Pajak',
                      style: CustomTextStyle.productName,
                    ),
                    Text(formatStringIDRToCurrency(
                        text: subTotalWithTax.toString(), symbol: 'Rp '))
                  ],
                ),
                const SizedBox(
                  height: 0,
                ),
                voucher == 0
                    ? const SizedBox.shrink()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            'Voucher',
                            style: CustomTextStyle.productName,
                          ),
                          CustomText(
                            '- ${formatStringIDRToCurrency(text: '$voucher', symbol: 'Rp ')}',
                            style: const TextStyle(
                                color: CustomColors.lightSuccessMain),
                          )
                        ],
                      ),
                orderFee == 0
                    ? const SizedBox.shrink()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            'Tambahan',
                            style: CustomTextStyle.productName,
                          ),
                          CustomText(formatStringIDRToCurrency(
                              text: '$orderFee', symbol: 'Rp '))
                        ],
                      ),
                if (isRounded)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Pembulatan',
                        style: CustomTextStyle.productName,
                      ),
                      Text(
                          '$symbol ${formatStringIDRToCurrency(text: roundedTotalPrice.toString(), symbol: 'Rp ')}')
                    ],
                  ),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: context.isLanscapeAndSmallerThan1000
                    ? CustomTextStyle.body1SemiBold
                    : CustomTextStyle.h6Bold,
              ),
              Text(
                formatStringIDRToCurrency(
                  text: totalPrice.toString(),
                  symbol: 'Rp ',
                ),
                style: context.isLanscapeAndSmallerThan1000
                    ? CustomTextStyle.body1SemiBold
                        .copyWith(color: CustomColors.strongOrange)
                    : CustomTextStyle.h6Bold
                        .copyWith(color: CustomColors.strongOrange),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
