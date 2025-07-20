import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import '../../../../../domain/entities/transaction/cart/payment_method/payment_method_model.dart';
import '../../../../../core/const/colors.dart';
import '../../../../../insoft/controller/payment_method_controller.dart';
import '../../../../providers/main/cart/payment_method_selection/payment_method_selection_provider.dart';

import '../../../../widgets/core/container/custom_rounded_container.dart';
import '../../../../widgets/core/text/custom_text.dart';

class PaymentMethodsItemTablet extends ConsumerWidget {
  PaymentMethodsItemTablet({
    super.key,
    required this.paymentMethod,
  });

  final PaymentMethodModel paymentMethod;
  final PaymentMethodController _payment = Get.put(PaymentMethodController());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isActive = paymentMethod ==
        ref.watch(paymentMethodSelectionProvider
            .select((value) => value.paymentMethod));
    return GestureDetector(
      onTap: () {
        print(paymentMethod.id);
        _payment.resetFlag();
        ref
            .read(paymentMethodSelectionProvider.notifier)
            .setPaymentMethod(paymentMethod);

        if (paymentMethod.id == 1) {
          ref
              .read(paymentMethodSelectionProvider.notifier)
              .setSelectedSubPaymentMethod(
                  const BankModel(method: 'Uang Pas', code: '1'));
          return;
        }

        if (paymentMethod.id == 5) {
          ref
              .read(paymentMethodSelectionProvider.notifier)
              .setSelectedSubPaymentMethod(BankModel(
                  method: 'Instant QRIS',
                  code: 'randu-wallet',
                  id: paymentMethod.id));
          return;
        }

        var paymentMethodItem = paymentMethod.bankModel?.first;
        if (paymentMethodItem != null) {
          ref
              .read(paymentMethodSelectionProvider.notifier)
              .setSelectedSubPaymentMethod(paymentMethodItem);
          if (paymentMethod.id == 3 || paymentMethod.id == 4) {
            _payment.getFlagData(paymentMethodItem.code);
          }
        }
      },
      child: CustomRoundedContainer(
        margin: const EdgeInsets.only(top: 4, bottom: 4),
        height: 100,
        shadow: const [],
        color: isActive
            ? CustomColors.primaryColor.withValues(alpha: .7)
            : CustomColors.white.withValues(alpha: .2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              paymentMethod.method ?? '-',
              style: CustomTextStyle.h5.copyWith(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              paymentMethod.description ?? '-',
              style: CustomTextStyle.tabletDialogText.copyWith(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
