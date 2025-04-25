import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oktoast/oktoast.dart';
import 'core_receipt_page.dart';

import '../../../core/const/colors.dart';
import '../../../core/utils/confirmation_dialog.dart';
import '../../../core/utils/url_launcher.dart';
import '../../../domain/entities/report/transaction_management/status_payment_enum.dart';
import '../../../domain/entities/report/transaction_management/status_transaction_enum.dart';
import '../../../domain/entities/transaction/cart/receipt_from_enum.dart';
import '../../../domain/entities/transaction/cart/request/payment/payment_request_model.dart';
import '../../../domain/usecases/report/transaction_management/set_status_payment/set_status_payment_params.dart';
import '../../providers/main/report/transaction_management/status_payment_provider.dart';
import '../../providers/main/report/transaction_management/status_transaction_provider.dart';
import '../../widgets/core/buttons/primary_button.dart';
import '../../widgets/core/buttons/secondary_button.dart';
import '../../widgets/core/container/custom_rounded_container.dart';
import '../../widgets/core/text/custom_text.dart';

class ReceiptPageMobile extends StatelessWidget {
  const ReceiptPageMobile({
    super.key,
    required this.cartPaymentReceipt,
  });

  final PaymentReceiptModel cartPaymentReceipt;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomRoundedContainer(
              radius: 0,
              border: Border.all(color: CustomColors.gray),
              shadow: const [],
              child: CoreReceiptPage(paymentReceipt: cartPaymentReceipt),
            ),
            if (cartPaymentReceipt.receiptFrom == ReceiptFromEnum.pos ||
                cartPaymentReceipt.receiptFrom == ReceiptFromEnum.report)
              Column(
                children: [
                  const SizedBox(height: 16),
                  const Divider(),
                  CustomText('Ganti Status Transaksi',
                      style: CustomTextStyle.h6),
                  const SizedBox(height: 8),
                  Consumer(builder: (context, ref, child) {
                    final initialStatus = StatusTransactionEnum.fromCode(
                        cartPaymentReceipt.status ?? 0);
                    final statusTransaction =
                        ref.watch(statusTransactionProvider(initialStatus));
                    return Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: StatusTransactionEnum.values
                          .where((value) => value.activeTransaction)
                          .map((status) {
                        return SecondaryButton(
                          buttonLabel: status.name,
                          bgColor: statusTransaction.value == status
                              ? CustomColors.primaryColor
                              : CustomColors.secondaryColor,
                          foregroundColor: statusTransaction.value == status
                              ? Colors.white
                              : CustomColors.black,
                          icon: statusTransaction.value == status
                              ? Icons.check_circle
                              : null,
                          onTap: () async {
                            final bool? result = await context.confirmationPopUp(
                                context: context,
                                titleMessage: 'Konfirmasi',
                                content:
                                    'Apakah anda yakin ingin mengubah status ini?',
                                type: DialogType.warning);
                            if (result != null && result) {
                              ref
                                  .read(statusTransactionProvider(initialStatus)
                                      .notifier)
                                  .setStatusTransaction(
                                      cartPaymentReceipt.transactionId ?? 0,
                                      status);
                            }
                          },
                        );
                        // return UnconstrainedBox(
                        //     child: SelectableChips(label: status.name));
                      }).toList(),
                    );
                  }),
                  const SizedBox(height: 16),
                  Consumer(builder: (context, ref, child) {
                    StatusPaymentEnum status = StatusPaymentEnum.fromCode(
                        cartPaymentReceipt.statusPayment ?? 0);
                    final statusPayment =
                        ref.watch(statusPaymentProvider(status));
                    final isRanduWallet =
                        cartPaymentReceipt.paymentMethod == 'randu-wallet';
                    return (statusPayment.value == StatusPaymentEnum.paid ||
                            statusPayment.value == StatusPaymentEnum.refunded ||
                            statusPayment.value == StatusPaymentEnum.voids)
                        ? const SizedBox.shrink()
                        : PrimaryButton(
                            buttonPrimaryType:
                                statusPayment.value == StatusPaymentEnum.paid
                                    ? ButtonPrimaryType.solidSuccess
                                    : ButtonPrimaryType.outlinedWhitePrimary,
                            label: isRanduWallet ? 'LINK PAYMENT' : 'SET PAID',
                            onTap: () async {
                              if (isRanduWallet) {
                                if (cartPaymentReceipt.paymentReturnUrl ==
                                    null) {
                                  showToast('URL tidak ditemukan');
                                  return;
                                }
                                launchUrlImpl(
                                    cartPaymentReceipt.paymentReturnUrl ?? '');
                              } else {
                                final bool? result =
                                    await context.confirmationPopUp(
                                        context: context,
                                        titleMessage: 'Konfirmasi',
                                        content:
                                            'Apakah anda yakin ingin mengubah transaksi ini ke PAID?',
                                        type: DialogType.warning);
                                if (result != null && result) {
                                  final SetStatusPaymentParams request =
                                      SetStatusPaymentParams(
                                    status: StatusPaymentEnum.paid,
                                    transactionId:
                                        cartPaymentReceipt.transactionId ?? 0,
                                  );
                                  ref
                                      .read(statusPaymentProvider(status)
                                          .notifier)
                                      .setStatusPayment(
                                        request,
                                      );
                                }
                              }
                            });
                  }),
                  const SizedBox(height: 16),
                  Consumer(builder: (context, ref, child) {
                    StatusPaymentEnum status = StatusPaymentEnum.fromCode(
                        cartPaymentReceipt.statusPayment ?? 0);
                    final statusPayment =
                        ref.watch(statusPaymentProvider(status));
                    return statusPayment.value == StatusPaymentEnum.paid
                        ? Row(
                          children: [
                            Expanded(
                              child: PrimaryButton(
                                  buttonPrimaryType:
                                      statusPayment.value == StatusPaymentEnum.paid
                                          ? ButtonPrimaryType.solidSuccess
                                          : ButtonPrimaryType.outlinedWhitePrimary,
                                  label: 'SET REFUNDED',
                                  onTap: () async {
                                    final bool? result = await context.confirmationPopUp(
                                        context: context,
                                        titleMessage: 'Konfirmasi',
                                        content:
                                            'Apakah anda yakin ingin mengubah transaksi ini ke REFUNDED?',
                                        type: DialogType.warning);
                                    if (result != null && result) {
                                      final SetStatusPaymentParams request =
                                          SetStatusPaymentParams(
                                        status: StatusPaymentEnum.refunded,
                                        transactionId:
                                            cartPaymentReceipt.transactionId ?? 0,
                                      );
                                      ref
                                          .read(
                                              statusPaymentProvider(status).notifier)
                                          .setStatusPayment(
                                            request,
                                          );
                                    }
                                  }),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: PrimaryButton(
                                  buttonPrimaryType:
                                  statusPayment.value == StatusPaymentEnum.paid
                                      ? ButtonPrimaryType.solidError
                                      : ButtonPrimaryType.outlinedWhitePrimary,
                                  label: 'SET VOID',
                                  onTap: () async {
                                    final bool? result = await context.confirmationPopUp(
                                        context: context,
                                        titleMessage: 'Konfirmasi',
                                        content:
                                        'Apakah anda yakin ingin mengubah transaksi ini ke VOID?',
                                        type: DialogType.warning);
                                    if (result != null && result) {
                                      final SetStatusPaymentParams request =
                                      SetStatusPaymentParams(
                                        status: StatusPaymentEnum.voids,
                                        transactionId:
                                        cartPaymentReceipt.transactionId ?? 0,
                                      );
                                      ref
                                          .read(
                                          statusPaymentProvider(status).notifier)
                                          .setStatusPayment(
                                        request,
                                      );
                                    }
                                  }),
                            ),
                          ],
                        )
                        : const SizedBox.shrink();
                  }),
                ],
              )
          ],
        ),
      ),
    );
  }
}
