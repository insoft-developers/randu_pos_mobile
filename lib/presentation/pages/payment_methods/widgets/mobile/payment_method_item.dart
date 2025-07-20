import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import '../../../../../domain/entities/transaction/cart/payment_method/payment_method_model.dart';
import '../../../../../insoft/controller/payment_method_controller.dart';
import '../../../../providers/main/cart/payment_method_selection/payment_method_selection_provider.dart';
import '../../../../widgets/core/chips/selectable_chips.dart';

class PaymentMethodItem extends ConsumerWidget {
  PaymentMethodItem({
    super.key,
    required this.paymentMethod,
  });

  final PaymentMethodModel paymentMethod;

  final PaymentMethodController _payment = Get.put(PaymentMethodController());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SelectableChips(
      label: paymentMethod.method ?? '-',
      onTap: () {
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
      active: paymentMethod ==
          ref.watch(paymentMethodSelectionProvider
              .select((value) => value.paymentMethod)),
    );
  }
}
