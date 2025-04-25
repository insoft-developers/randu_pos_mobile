import 'dart:developer';

import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

import '../../../../core/const/colors.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/misc/app_image.dart';
import '../../../../domain/entities/printer/paper_size.dart';
import '../../../../domain/entities/printer/printer_mode_enum.dart';
import '../../../../domain/entities/transaction/cart/payment/payment_response_data.dart';
import '../../../../domain/entities/user_model.dart';
import '../../../providers/cores/router/go_router_provider.dart';
import '../../../providers/main/cart/cart_provider.dart';
import '../../../providers/main/cart/get_tables/get_tables_provider.dart';
import '../../../providers/main/cart/payment_method_selection/payment_method_selection_provider.dart';
import '../../../providers/main/printer/multi_printer/printer_multi_provider.dart';
import '../../../providers/main/printer/printer_service_provider.dart';
import '../../../providers/main/saved/delete_saved_transaction/delete_saved_transaction_provider.dart';
import '../../../providers/main/transaction/check_payment_status/check_payment_status_provider.dart';
import '../../../widgets/core/buttons/primary_button.dart';
import '../../../widgets/core/buttons/randu_button.dart';
import '../../../widgets/core/text/custom_text.dart';
import '../../receipt/receipt_utils.dart';

class TransactionSuccessMobile extends ConsumerWidget {
  const TransactionSuccessMobile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var paymentMethod = ref.watch(paymentMethodSelectionProvider).paymentMethod;
    var paymentStatus = ref.watch(checkPaymentStatusProvider);
    final paymentResponse =
        ref.read(cartProvider.select((value) => value.paymentResponse));
    log(paymentStatus.toString());
    return ((paymentMethod?.id == 2 && paymentStatus.value == null) ||
            (paymentMethod?.id == 2 &&
                paymentStatus.value != null &&
                (paymentStatus.value!.data as PaymentResponseData)
                        .paymentStatus! ==
                    0) ||
            (paymentMethod?.id == 5 && paymentStatus.value == null) ||
            (paymentMethod?.id == 5 &&
                paymentStatus.value != null &&
                (paymentStatus.value!.data as PaymentResponseData)
                        .paymentStatus! ==
                    0))
        ? const WaitingThirdParty()
        : Center(
            child: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 24,
                    left: 24,
                    right: 24,
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      getLottieImage('success', width: 250, height: 250),
                      const SizedBox(height: 16),
                      Text(
                        'Pembayaran Berhasil',
                        style: CustomTextStyle.h5,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'No. Nota ${paymentResponse?.reference ?? ""}',
                        style: CustomTextStyle.body2AndHalf
                            .copyWith(color: CustomColors.darkGray),
                      ),
                      // const SizedBox(height: 40),
                      // Text(
                      //   'Uang Kembalian',
                      //   style: CustomTextStyle.body2AndHalf,
                      // ),
                      // const SizedBox(height: 16),
                      // Text(
                      //   formatStringIDRToCurrency(text: '0', symbol: 'Rp '),
                      //   style: CustomTextStyle.h4,
                      // ),
                      const SizedBox(height: 0),
                      /*CustomTextField(
                        hintText: 'Kirim struk melalui email',
                        suffixIcon: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: const BoxDecoration(
                              border: Border(
                                  left: BorderSide(color: Colors.black54))),
                          child: const Icon(
                            Icons.send,
                            color: Colors.blue,
                          ),
                        ),
                      ),*/
                      const SizedBox(height: 32),
                      Row(
                        children: [
                          RanduButton(
                            icon: Icons.print,
                            padding: const EdgeInsets.all(11),
                            borderWidth: 1.5,
                            onPressed: () {
                              final cartPaymentReceipt = ref.watch(cartProvider
                                  .select((value) => value.toPaymentReceipt()));
                              final savedCartInfo = ref.watch(cartProvider
                                  .select((value) => value.savedCartInfo));
                              if (savedCartInfo?.id != null) {
                                ref
                                    .watch(
                                        deleteSavedTransactionProvider.notifier)
                                    .deleteSavedTransaction(
                                        savedId: savedCartInfo!.id!);
                              }

                              ref.read(routerProvider).pushNamed('printer_page',
                                  extra: cartPaymentReceipt);
                            },
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: PrimaryButton(
                              buttonPrimaryType: ButtonPrimaryType.solidOrange,
                              radius: 8,
                              label: 'Kembali Ke POS',
                              postFixWidget: const Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Icon(Icons.chevron_right, color: Colors.white),
                              ),
                              onTap: () {
                                final savedCartInfo = ref.watch(cartProvider
                                    .select((value) => value.savedCartInfo));
                                if (savedCartInfo?.id != null) {
                                  ref
                                      .watch(deleteSavedTransactionProvider
                                          .notifier)
                                      .deleteSavedTransaction(
                                          savedId: savedCartInfo!.id!);
                                }
                                ref.read(cartProvider.notifier).resetCart();
                                ref.read(getTablesProvider.notifier).reset();
                                ref
                                    .read(routerProvider)
                                    .pushReplacementNamed('dashboard');
                                // ref.invalidate(cartProvider);
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 60),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}

final endTime = DateTime.now().add(
  const Duration(
    minutes: 10,
  ),
);

class WaitingThirdParty extends ConsumerWidget {
  const WaitingThirdParty({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final printer = ref.watch(
        printerServiceProvider.select((value) => value.connectedPrinter));
    print('waiting third party');
    final paymentResponse =
        ref.read(cartProvider.select((value) => value.paymentResponse));
    var paymentMethod = ref.read(paymentMethodSelectionProvider).paymentMethod;
    final user = Hive.box<UserModel>('userBox').get('userBox');
    final isQris = paymentMethod?.id == 5 &&
        paymentResponse != null &&
        paymentResponse.qrString != null;
    return Center(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isQris)
            Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      ref.read(routerProvider).push('/settings', extra: true);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Icon(Icons.settings,
                          color: printer == null ? Colors.black : Colors.green),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                CustomText('Scan QR Code', style: CustomTextStyle.h6),
                const SizedBox(height: 32),
                SizedBox(
                  width: context.isMobile
                      ? MediaQuery.of(context).size.width / 1.5
                      : MediaQuery.of(context).size.width / 4,
                  height: context.isMobile
                      ? MediaQuery.of(context).size.width / 1.5
                      : MediaQuery.of(context).size.width / 4,
                  child: PrettyQrView.data(
                    data: paymentResponse.qrString ?? '',
                    decoration: const PrettyQrDecoration(),
                  ),
                ),
                const SizedBox(height: 16),
                TimerCountdown(
                  format: CountDownTimerFormat.minutesSeconds,
                  enableDescriptions: false,
                  onTick: (value) {
                    if (value.inSeconds % 10 == 0) {
                      ref
                          .read(checkPaymentStatusProvider.notifier)
                          .checkPaymentStatus(paymentResponse.reference ?? '');
                    }
                  },
                  endTime: endTime,
                  onEnd: () {
                    print('Timer finished');
                  },
                ),
                const SizedBox(height: 16),
                const CustomText(
                  '''Silahkan scan barcode ini di device Anda.
              menggunakan QRIS untuk melakukan pembayaran''',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                CustomText('No. Nota ${paymentResponse.reference}'),
                const SizedBox(height: 8),
                SizedBox(
                    height: 45,
                    width: 300,
                    child: Consumer(builder: (context, ref, child) {
                      return PrimaryButton(
                          preFixWidget: const Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: Icon(
                              Icons.print,
                              color: CustomColors.white,
                            ),
                          ),
                          radius: 8,
                          buttonPrimaryType: ButtonPrimaryType.solidOrange,
                          label: 'Cetak QR Code',
                          onTap: () async {
                            final mode = ref.watch(printerServiceProvider
                                .select((value) => value.printerMode));
                            PaperSizeModel? paperSize;
                            if(mode == PrinterModeEnum.multiple){
                              paperSize =
                              await ref.read(printerMultiProvider.notifier).getPaperSize('dailyRecap');
                            }else{
                              paperSize = ref.read(printerServiceProvider
                                  .select((value) => value.paperSizeSinglePrinter));
                            }
                            print('mode : $mode');
                            print('paperSize : $paperSize');
                            await checkPrinterStatus(
                                ref: ref,
                                context: context,
                                printerMode: mode,
                                type: PrinterTypeEnum.dailyRecap,
                                isIndividual: mode == PrinterModeEnum.multiple,
                                onGrantedPermissionCallback: () async {
                                  final profile =
                                      await CapabilityProfile.load();
                                  ref
                                      .read(printerServiceProvider.notifier)
                                      .printString(null);

                                  await Future.delayed(const Duration(milliseconds: 100));
                                  ref
                                      .read(printerServiceProvider.notifier)
                                      .printTicket(
                                          receiptBytes: await generateQRCode(
                                              paperSize: paperSize?.size ??
                                                  PaperSize.mm80,
                                              capabilityProfile: profile,
                                              businessName:
                                                  user?.bussinessName ?? '-',
                                              businessAddress:
                                                  user?.bussinessAddress ?? '',
                                              footer: user?.footerReceipt ?? '',
                                              qrCode:
                                                  paymentResponse.qrString ??
                                                      ''));
                                });
                          });
                    })),
              ],
            ),
          if (!isQris)
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                getLottieImage(
                  'paper-plane',
                  width: 350,
                  height: 350,
                  repeate: true,
                ),
                CustomText(
                  'Menunggu Pembayaran.',
                  style: CustomTextStyle.h6,
                ),
              ],
            ),
          const SizedBox(height: 32),
          CustomText(
            'Silakan cek status pembayaran',
            style: CustomTextStyle.mobileDialogText.copyWith(
              color: CustomColors.darkGray,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 45,
            width: 300,
            child: PrimaryButton(
              isLoading: ref.watch(checkPaymentStatusProvider).isLoading,
              buttonPrimaryType: ButtonPrimaryType.outlinedWhitePrimary,
              preFixWidget: const Padding(
                padding: EdgeInsets.only(right: 8),
                child: Icon(
                  Icons.sync_outlined,
                  color: CustomColors.primaryColor,
                ),
              ),
              radius: 8,
              label: 'Cek Status Pembayaran',
              onTap: () {
                ref
                    .read(checkPaymentStatusProvider.notifier)
                    .checkPaymentStatus(paymentResponse?.reference ?? '');
              },
            ),
          )
        ],
      ),
    ));
  }
}
