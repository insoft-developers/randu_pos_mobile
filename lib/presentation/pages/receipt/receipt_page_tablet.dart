import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../core/const/colors.dart';
import '../../../core/utils/confirmation_dialog.dart';
import '../../../core/utils/permission_utils.dart';
import '../../../domain/entities/printer/printer_folder/printer_folder.dart';
import '../../../domain/entities/report/transaction_management/status_payment_enum.dart';
import '../../../domain/entities/report/transaction_management/status_transaction_enum.dart';
import '../../../domain/entities/transaction/cart/receipt_from_enum.dart';
import '../../../domain/entities/transaction/cart/request/payment/payment_request_model.dart';
import '../../../domain/usecases/report/transaction_management/set_status_payment/set_status_payment_params.dart';
import '../../providers/main/printer/printer_service_provider.dart';
import '../../providers/main/report/transaction_management/status_payment_provider.dart';
import '../../providers/main/report/transaction_management/status_transaction_provider.dart';
import '../../providers/main/user_data/user_data_provider.dart';
import '../../widgets/core/buttons/primary_button.dart';
import '../../widgets/core/buttons/secondary_button.dart';
import '../../widgets/core/chips/selectable_chips.dart';
import '../../widgets/core/container/custom_rounded_container.dart';
import '../../widgets/core/text/custom_text.dart';
import '../printer/widgets/list_printer_page.dart';
import 'core_receipt_page.dart';

class ReceiptPageTablet extends ConsumerWidget {
  const ReceiptPageTablet({super.key, required this.paymentReceipt});
  final PaymentReceiptModel paymentReceipt;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: CustomRoundedContainer(
              radius: 0,
              shadow: const [],
              border: Border.all(color: CustomColors.gray),
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: CoreReceiptPage(paymentReceipt: paymentReceipt),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // PrinterSettingTablet(paymentReceipt: paymentReceipt),
                  if (paymentReceipt.receiptFrom == ReceiptFromEnum.pos ||
                      paymentReceipt.receiptFrom == ReceiptFromEnum.report)
                    Column(
                      children: [
                        const SizedBox(height: 16),
                        const Divider(),
                        CustomText('Ganti Status Transaksi ',
                            style: CustomTextStyle.h6),
                        const SizedBox(height: 8),
                        Consumer(builder: (context, ref, child) {
                          final initialStatus = StatusTransactionEnum.fromCode(
                              paymentReceipt.status ?? 0);
                          final statusTransaction = ref
                              .watch(statusTransactionProvider(initialStatus));
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
                                foregroundColor:
                                    statusTransaction.value == status
                                        ? Colors.white
                                        : CustomColors.black,
                                icon: statusTransaction.value == status
                                    ? Icons.check_circle
                                    : null,
                                onTap: () async {
                                  final bool? result =
                                      await context.confirmationPopUp(
                                          context: context,
                                          titleMessage: 'Konfirmasi',
                                          content:
                                              'Apakah anda yakin ingin mengubah status ini?',
                                          type: DialogType.warning);
                                  if (result != null && result) {
                                    ref
                                        .read(statusTransactionProvider(
                                                initialStatus)
                                            .notifier)
                                        .setStatusTransaction(
                                            paymentReceipt.transactionId ?? 0,
                                            status);
                                  }
                                },
                              );
                            }).toList(),
                          );
                        }),
                        const SizedBox(height: 16),
                        Consumer(builder: (context, ref, child) {
                          StatusPaymentEnum status = StatusPaymentEnum.fromCode(
                              paymentReceipt.statusPayment ?? 0);
                          final statusPayment =
                              ref.watch(statusPaymentProvider(status));
                          final isRanduWallet =
                              paymentReceipt.paymentMethod == 'randu-wallet';
                          return (statusPayment.value ==
                                      StatusPaymentEnum.paid ||
                                  statusPayment.value ==
                                      StatusPaymentEnum.refunded ||
                                  statusPayment.value ==
                                      StatusPaymentEnum.voids)
                              ? const SizedBox.shrink()
                              : PrimaryButton(
                                  buttonPrimaryType: statusPayment.value ==
                                          StatusPaymentEnum.paid
                                      ? ButtonPrimaryType.solidSuccess
                                      : ButtonPrimaryType.outlinedWhitePrimary,
                                  label: isRanduWallet
                                      ? 'LINK PAYMENT'
                                      : 'SET PAID',
                                  onTap: () async {
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
                                            paymentReceipt.transactionId ?? 0,
                                      );
                                      ref
                                          .read(statusPaymentProvider(status)
                                              .notifier)
                                          .setStatusPayment(
                                            request,
                                          );
                                    }
                                  });
                        }),
                        Consumer(builder: (context, ref, child) {
                          StatusPaymentEnum status = StatusPaymentEnum.fromCode(
                              paymentReceipt.statusPayment ?? 0);
                          final statusPayment =
                              ref.watch(statusPaymentProvider(status));
                          return statusPayment.value == StatusPaymentEnum.paid
                              ? Row(
                                children: [
                                  Expanded(
                                    child: PrimaryButton(
                                        buttonPrimaryType: statusPayment.value ==
                                                StatusPaymentEnum.paid
                                            ? ButtonPrimaryType.solidSuccess
                                            : ButtonPrimaryType.outlinedWhitePrimary,
                                        label: 'SET REFUNDED',
                                        onTap: () async {
                                          final bool? result =
                                              await context.confirmationPopUp(
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
                                                  paymentReceipt.transactionId ?? 0,
                                            );
                                            ref
                                                .read(statusPaymentProvider(status)
                                                    .notifier)
                                                .setStatusPayment(
                                                  request,
                                                );
                                          }
                                        }),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: PrimaryButton(
                                        buttonPrimaryType: statusPayment.value ==
                                            StatusPaymentEnum.paid
                                            ? ButtonPrimaryType.solidError
                                            : ButtonPrimaryType.outlinedWhitePrimary,
                                        label: 'SET VOID',
                                        onTap: () async {
                                          final bool? result =
                                          await context.confirmationPopUp(
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
                                              paymentReceipt.transactionId ?? 0,
                                            );
                                            ref
                                                .read(statusPaymentProvider(status)
                                                .notifier)
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
          ),
        ],
      ),
    );
  }
}

class PrinterSettingTablet extends ConsumerWidget {
  const PrinterSettingTablet({super.key, required this.paymentReceipt});
  final PaymentReceiptModel paymentReceipt;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.read(userDataProvider).value?.user;
    final listPrinter =
        ref.watch(printerServiceProvider.select((value) => value.printerList));

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 3,
                child: CustomText(
                  'PERANGKAT TERHUBUNG',
                  style: CustomTextStyle.tabletDialogTitle.copyWith(
                    color: CustomColors.darkGray,
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    checkPermission(
                      permission: Permission.bluetoothScan,
                      onGrantedPermissionCallback: () {
                        ref
                            .read(printerServiceProvider.notifier)
                            .startScanPrinter();
                      },
                      onPermanentlyDeniedPermissionCallback: () =>
                          permissionPermanentlyDeniedPopUp(
                        context,
                        permissionType: PermissionTypeEnum.bluetooth,
                      ),
                    );
                  },
                  child: const Text('Cari Printer'),
                ),
              ),
            ],
          ),
          ref.watch(printerServiceProvider
                      .select((value) => value.connectedPrinter)) ==
                  null
              ? CustomRoundedContainer(
                  padding: const EdgeInsets.all(16),
                  radius: 8,
                  shadow: const [],
                  border: Border.all(color: CustomColors.gray),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Icon(
                        Icons.print_disabled_rounded,
                        color: CustomColors.gray,
                        size: 70,
                      ),
                      const SizedBox(height: 8),
                      CustomText(
                        'Tidak ada printer terhubung',
                        style: CustomTextStyle.body2.copyWith(
                          color: CustomColors.darkGray,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                )
              : const SizedBox.shrink(),
          const SizedBox(height: 8),
          const PrinterList(),
          const SizedBox(height: 8),
          CustomText(
            'UKURAN KERTAS',
            style: CustomTextStyle.tabletDialogTitle.copyWith(
              color: CustomColors.darkGray,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              ...listPageSize.map((e) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: SelectableChips(
                    horizontalPadding: 32,
                    label: (e.key).toString(),
                    active: e.value ==
                        ref.watch(printerServiceProvider
                            .select((value) => value.paperSizeSinglePrinter)),
                    onTap: () {
                      // ref
                      //     .read(printerServiceProvider.notifier)
                      //     .setPaperSize(e.value);
                    },
                  ),
                );
              }),
            ],
          ),
          const SizedBox(height: 24),
          CustomText(
            'CUSTOM FOOTER',
            style: CustomTextStyle.tabletDialogTitle.copyWith(
              color: CustomColors.darkGray,
            ),
          ),
          const SizedBox(height: 8),
          DottedBorder(
            dashPattern: const [8, 4],
            strokeWidth: 2,
            child: CustomRoundedContainer(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    user?.footerReceipt ?? '',
                    style: CustomTextStyle.tabletDialogTitle
                        .copyWith(color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
