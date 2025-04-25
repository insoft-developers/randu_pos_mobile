import 'package:flutter/material.dart';
import 'payment_method_item.dart';

import '../../../../../domain/entities/transaction/cart/payment_method/payment_method_model.dart';

class PaymentMethodsListMobile extends StatelessWidget {
  final List<PaymentMethodModel> paymentMethods;
  const PaymentMethodsListMobile({super.key, required this.paymentMethods});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection:
            Axis.horizontal, // Set the scroll direction to horizontal
        itemBuilder: (context, index) {
          return PaymentMethodItem(paymentMethod: paymentMethods[index]);
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: 8);
        },
        itemCount: paymentMethods.length,
      ),
    );
  }
}
