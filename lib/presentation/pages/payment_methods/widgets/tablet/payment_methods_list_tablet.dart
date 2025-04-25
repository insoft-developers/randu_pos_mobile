import 'package:flutter/material.dart';

import '../../../../../domain/entities/transaction/cart/payment_method/payment_method_model.dart';
import '../../../../widgets/core/container/custom_rounded_container.dart';
import 'payment_methods_item_tablet.dart';

class PaymentMethodsListTablet extends StatelessWidget {
  final List<PaymentMethodModel> paymentMethods;
  const PaymentMethodsListTablet({super.key, required this.paymentMethods});
  @override
  Widget build(BuildContext context) {
    return CustomRoundedContainer(
      color: Colors.blue,
      shadow: const [],
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ...List.generate(
            paymentMethods.length,
            (index) => Expanded(
              child: PaymentMethodsItemTablet(
                paymentMethod: paymentMethods[index],
              ),
            ),
          )
        ],
      ),
    );
  }
}
