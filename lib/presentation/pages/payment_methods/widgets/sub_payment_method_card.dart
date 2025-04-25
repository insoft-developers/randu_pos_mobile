import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import '../../../../core/extensions/context_extension.dart';
import '../../../../domain/entities/transaction/cart/payment_method/payment_method_model.dart';
import '../../../../core/const/colors.dart';
import '../../../../insoft/controller/payment_method_controller.dart'
    show PaymentMethodController;
import '../../../providers/main/cart/payment_method_selection/payment_method_selection_provider.dart';
import '../../../widgets/core/container/custom_rounded_container.dart';
import '../../../widgets/core/text/custom_text.dart';

class SubPaymentMethodCard extends ConsumerWidget {
  SubPaymentMethodCard(
      {super.key, required this.subMethod, this.isSubSub = false});

  final BankModel subMethod;
  final bool isSubSub;

  final PaymentMethodController _paymentMethodController =
      Get.put(PaymentMethodController());

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
          print(subMethod);
          _paymentMethodController.getFlagData(subMethod.code);

          // _paymentMethodController.checkUser();
        }
      },
      child: CustomRoundedContainer(
        shadow: const [],
        radius: context.isMobile ? 4 : 16,
        height: context.isMobile ? 50 : 100,
        border: Border.all(
            color: isActive ? Colors.lightBlue[300]! : CustomColors.gray),
        color: isActive ? Colors.lightBlue[100] : CustomColors.white,
        child: Center(
          child: Text(
            subMethod.method ?? '',
            style: CustomTextStyle.tabletDialogText.copyWith(
                color: isActive
                    ? CustomColors.primaryColor
                    : Colors.black.withValues(alpha: .75),
                fontSize: context.isMobile ? 14 : 16),
          ),
        ),
      ),
    );
  }
}
