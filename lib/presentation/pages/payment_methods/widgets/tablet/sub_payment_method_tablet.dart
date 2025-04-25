import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../domain/entities/transaction/cart/payment_method/payment_method_model.dart';
import '../../../../../core/const/colors.dart';
import '../../../../providers/main/cart/payment_method_selection/payment_method_selection_provider.dart';
import '../../../../widgets/core/container/custom_rounded_container.dart';
import '../../../../widgets/core/text/custom_text.dart';

class SubPaymentMethodTablet extends ConsumerWidget {
  const SubPaymentMethodTablet(
      {super.key, required this.subMethod, this.isSubSub = false});

  final BankModel subMethod;
  final bool isSubSub;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var paymentMethodSelection = ref.watch(paymentMethodSelectionProvider);
    bool isActive = isSubSub
        ? subMethod == paymentMethodSelection.selectedSubSubPaymentMethod
        : subMethod.code ==
            paymentMethodSelection.selectedSubPaymentMethod?.code;
    return GestureDetector(
      onTap: () {
        if (isSubSub) {
          ref
              .read(paymentMethodSelectionProvider.notifier)
              .setSelectedSubSubPaymentMethod(subMethod);
        } else {
          ref
              .read(paymentMethodSelectionProvider.notifier)
              .setSelectedSubSubPaymentMethod(const BankModel());
          ref
              .read(paymentMethodSelectionProvider.notifier)
              .setSelectedSubPaymentMethod(subMethod);
        }
      },
      child: CustomRoundedContainer(
        shadow: const [BoxShadow(color: CustomColors.gray, blurRadius: 4)],
        height: 100,
        color: isActive ? Colors.lightBlue[100] : CustomColors.white,
        child: Center(
            child: Text(
          subMethod.method ?? '',
          style: CustomTextStyle.tabletDialogText.copyWith(
            color: isActive
                ? CustomColors.primaryColor
                : Colors.black.withValues(alpha: .75),
          ),
        )),
      ),
    );
  }
}
