import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../domain/entities/transaction/cart/payment_method/payment_method_model.dart';
import '../../../../providers/main/cart/payment_method_selection/payment_method_selection_provider.dart';
import '../../../../widgets/core/chips/selectable_chips.dart';

class PaymentMethodItem extends ConsumerWidget {
  const PaymentMethodItem({
    super.key,
    required this.paymentMethod,
  });

  final PaymentMethodModel paymentMethod;

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
        }
      },
      active: paymentMethod ==
          ref.watch(paymentMethodSelectionProvider
              .select((value) => value.paymentMethod)),
    );
  }
}
