import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/const/colors.dart';
import '../../../../../core/utils/currency_utils.dart';
import '../../../../providers/main/cart/cart_provider.dart';
import '../../../../providers/main/cart/payment_method_selection/payment_method_selection_provider.dart';
import '../../../../widgets/core/container/custom_rounded_container.dart';
import '../../../../widgets/core/text/custom_text.dart';
import '../../../../widgets/core/text_fields/custom_text_field.dart';
import '../sub_payment_method_card.dart';

class DetailCashPaymentMobile extends ConsumerWidget {
  const DetailCashPaymentMobile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var totalPrice =
        ref.watch(cartProvider.select((value) => value.totalPrice));
    var paymentMethodSelection = ref.watch(paymentMethodSelectionProvider);
    final subPaymentMethod = paymentMethodSelection.subPaymentMethod;
    final subSubPaymentMethod = paymentMethodSelection.subSubPaymentMethod;
    final isManualInput = paymentMethodSelection.isManualInput;
    final selectedSubPaymentMethod =
        paymentMethodSelection.selectedSubPaymentMethod;
    final isOtherAmmount =
        paymentMethodSelection.selectedSubPaymentMethod?.method ==
            'Jumlah Lain';
    double contentWidth = MediaQuery.of(context).size.width - 32;
    double itemWidth = contentWidth / 2 - 4;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Pembayaran Tunai',
              style: CustomTextStyle.mobileDialogText
                  .copyWith(color: CustomColors.black),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                selectedSubPaymentMethod != null &&
                        selectedSubPaymentMethod.method != null
                    ? CustomRoundedContainer(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 24,
                        ),
                        radius: 8,
                        shadow: const [],
                        color: Colors.lightBlue.withValues(alpha: .2),
                        child: Text(
                          selectedSubPaymentMethod.method!,
                          style: CustomTextStyle.productName.copyWith(
                            color: CustomColors.primaryColor,
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
                const SizedBox(width: 8),
                paymentMethodSelection.totalPaid > 0
                    ? CustomRoundedContainer(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 24,
                        ),
                        radius: 8,
                        shadow: const [],
                        color: Colors.yellow.withValues(alpha: .5),
                        child: Text(
                          formatStringIDRToCurrency(
                              text: '${paymentMethodSelection.totalPaid}',
                              symbol: 'Rp ',
                              isDouble: true),
                          style: CustomTextStyle.productName.copyWith(
                            color: CustomColors.primaryColor,
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Jenis Pembayaran Tunai',
              style: CustomTextStyle.mobileDialogText
                  .copyWith(color: CustomColors.black),
            ),
            const SizedBox(
              height: 16,
            ),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              alignment: WrapAlignment.spaceBetween,
              children: [
                ...subPaymentMethod.map(
                  (e) => SizedBox(
                    width: itemWidth,
                    child: SubPaymentMethodCard(subMethod: e),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            isOtherAmmount
                ? Text(
                    'Nominal Pembayaran',
                    style: CustomTextStyle.mobileDialogText
                        .copyWith(color: CustomColors.black),
                  )
                : const SizedBox.shrink(),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 10,
              alignment: WrapAlignment.spaceBetween,
              children: [
                ...subSubPaymentMethod.map(
                  (e) => SizedBox(
                    width: itemWidth,
                    child: SubPaymentMethodCard(
                      subMethod: e,
                      isSubSub: true,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                isManualInput
                    ? Expanded(
                        child: Column(
                          children: [
                            CustomTextField(
                              unfocusTapOutside: true,
                              hintText: 'Masukan Jumlah Bayar',
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  ref
                                      .read(paymentMethodSelectionProvider
                                          .notifier)
                                      .setTotalPaid(double.parse(value));
                                } else {
                                  ref
                                      .read(paymentMethodSelectionProvider
                                          .notifier)
                                      .setTotalPaid(totalPrice);
                                }
                              },
                            ),
                            const SizedBox(height: 8),
                          ],
                        ),
                      )
                    : const SizedBox(height: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
