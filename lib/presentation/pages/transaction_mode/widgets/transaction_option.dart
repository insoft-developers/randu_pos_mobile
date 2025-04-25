import 'package:flutter/material.dart';

import '../../../../core/const/colors.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../widgets/core/text/custom_text.dart';
import '../../../../domain/entities/transaction/cart/table_model.dart';

class TransactionOption extends StatelessWidget {
  const TransactionOption(
      {super.key,
      required this.value,
      required this.chosenTable,
      this.selectedInCart = false});
  final TableModel value;
  final TableModel? chosenTable;
  final bool selectedInCart;

  @override
  Widget build(BuildContext context) {
    double height = context.isMobile ? 50 : 60;
    double width = context.isMobile ? 72 : 100;
    return Container(
      height: height,
      width: width,
      // padding: const EdgeInsets.symmetric(horizontal: 40),
      decoration: BoxDecoration(
        border: Border.all(
            color: selectedInCart
                ? Colors.green
                : value.getAvailability() == TableAvailability.reserved
                    ? CustomColors.lightTextDisabled
                    : CustomColors.primaryColor),
        borderRadius: BorderRadius.circular(8),
        color: selectedInCart
            ? Colors.green
            : value.getAvailability() == TableAvailability.reserved
                ? CustomColors.lightTextDisabled
                : value == chosenTable
                    ? CustomColors.primaryColor
                    : null,
      ),
      child: Center(
        child: CustomText(
          '${value.noMeja}',
          style: CustomTextStyle.mobileDialogTitle.copyWith(
              color: value.getAvailability() == TableAvailability.reserved ||
                      selectedInCart
                  ? CustomColors.white
                  : value == chosenTable
                      ? Colors.white
                      : CustomColors.primaryColor),
        ),
      ),
    );
  }
}
