import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/const/colors.dart';
import '../../../../core/utils/currency_utils.dart';
import '../../../../core/utils/date_utils.dart';
import '../../../../domain/entities/report/transaction_management/status_payment_enum.dart';
import '../../../../domain/entities/report/transaction_management/transaction_management_model.dart';
import '../../../../domain/entities/transaction/cart/receipt_from_enum.dart';
import '../../../../domain/entities/user_model.dart';
import '../../../widgets/core/container/custom_rounded_container.dart';
import '../../../widgets/core/text/custom_text.dart';

class TransactionManagementItem extends StatelessWidget {
  const TransactionManagementItem(
      {super.key, required this.transaction, this.user, this.index});

  final TransactionManagementModel transaction;
  final UserModel? user;
  final int? index;

  @override
  Widget build(BuildContext context) {
    final isVoid = transaction.paymentStatusEnum == StatusPaymentEnum.voids;
    return GestureDetector(
      onTap: () {
        print('transaction.status: ${transaction.tax}');
        final cartPaymentReceipt = transaction.toPaymentReceipt(
          businessName: user?.bussinessName ?? '',
          bussinessAddress: user?.bussinessAddress ?? '',
          branchName: user?.branchName ?? '',
          footer: user?.footerReceipt ?? '',
          receiptFrom: ReceiptFromEnum.report,
        );
        context.pushNamed('printer_page', extra: cartPaymentReceipt);
      },
      child: CustomRoundedContainer(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ),
        radius: 4,
        border: Border.all(color: CustomColors.gray),
        shadow: const [],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.reference ?? '-',
                  style: CustomTextStyle.body2SemiBold,
                ),
                Text(
                  formatDateToString(
                        // transaction.paymentAt,
                        transaction.created,
                      ) ??
                      '',
                  style: CustomTextStyle.lightComponentsBadgeLabel.copyWith(
                    color: CustomColors.darkGray,
                  ),
                ),
                const SizedBox(height: 8),
                CustomText(
                  transaction.custName ?? '-',
                  style: CustomTextStyle.body2SemiBold,
                ),
                const SizedBox(height: 8),
                CustomText(
                  transaction.custPhone ?? '-',
                  style: CustomTextStyle.body2,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomRoundedContainer(
                  shadow: const [],
                  color: isVoid? Colors.red[200]: Colors.lightBlue[200],
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  margin: const EdgeInsets.all(0),
                  child: Text(
                    transaction.statusEnum.name,
                    style:
                        CustomTextStyle.lightComponentsBadgeLabelBold.copyWith(
                      color: isVoid?Colors.white:CustomColors.primaryColor,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  formatStringIDRToCurrency(
                      text: '${transaction.paid}', symbol: 'Rp '),
                  style: CustomTextStyle.body1SemiBold,
                ),
                Text(transaction.paymentStatusEnum.name,
                    style: CustomTextStyle.body2SemiBold.copyWith(
                        color: transaction.paymentStatus == 1
                            ? CustomColors.lightSuccessMain
                            : transaction.paymentStatus == -1
                                ? CustomColors.lightWarningMain
                                : CustomColors.lightErrorMain)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
