import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/extensions/context_extension.dart';
import '../../../domain/entities/general_response.dart';
import '../../../domain/entities/printer/printer_mode_enum.dart';
import '../../../domain/entities/printer/printer_model/printer_model.dart';
import '../../../domain/entities/report/transaction_management/status_transaction_enum.dart';
import '../../../domain/entities/transaction/cart/request/payment/payment_request_model.dart';
import '../../providers/cores/router/go_router_provider.dart';
import '../../providers/main/printer/printer_service_provider.dart';
import '../../providers/main/report/transaction_management/status_transaction_provider.dart';
import '../../providers/main/report/transaction_management/transaction_management_provider.dart';
import '../../widgets/core/extension_dialog/extension_dialog.dart';
import '../../widgets/core/responsive/responsive_layout.dart';
import '../../widgets/core/text/custom_text.dart';
import 'receipt_page_mobile.dart';
import 'receipt_page_tablet.dart';
import 'widgets/button_print_receipt.dart';

enum SourceReceipt { pos, saved, report }

class ReceiptPage extends ConsumerWidget {
  const ReceiptPage({super.key, required this.cartPaymentReceipt});

  final PaymentReceiptModel cartPaymentReceipt;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode =
        ref.watch(printerServiceProvider.select((value) => value.printerMode));
    final printer = ref.watch(
        printerServiceProvider.select((value) => value.connectedPrinter));

    ref.listen(
        statusTransactionProvider(
            StatusTransactionEnum.fromCode(cartPaymentReceipt.status ?? 0)),
        (previous, next) async {
      if (next is AsyncData) {
        final value = next.value;
        if (value != null) {
          ref.read(transactionManagementProvider.notifier).fetchTransaction();
          context.pop();
          await Future.delayed(const Duration(milliseconds: 100));
          if (context.mounted) {
            context.showResultDialog(
                baseResponse: const GeneralResponse(
                    status: true, message: 'Berhasil ubah status transaksi'));
          }
        }
      } else if (next is AsyncError) {
        context.pop();
        await Future.delayed(const Duration(milliseconds: 100));
        if (context.mounted) {
          context.showResultDialog(
              baseResponse: GeneralResponse(
                  status: false, message: next.error.toString()));
        }
      } else if (next is AsyncLoading) {
        context.showLoadingDialog();
      }
    });

    // ref.listen(
    //     statusPaymentProvider(
    //         StatusPaymentEnum.fromCode(cartPaymentReceipt.statusPayment ?? 0)),
    //     (previous, next) async {
    //   if (next is AsyncData) {
    //     final value = next.value;
    //     if (value != null) {
    //       ref.read(transactionManagementProvider.notifier).fetchTransaction();
    //       context.pop();
    //       await Future.delayed(const Duration(milliseconds: 100));
    //       if (context.mounted) {
    //         context.showResultDialog(
    //             baseResponse: const GeneralResponse(
    //                 status: true, message: 'Berhasil ubah status transaksi'));
    //       }
    //     }
    //   } else if (next is AsyncError) {
    //     context.pop();
    //     await Future.delayed(const Duration(milliseconds: 100));
    //     if (context.mounted) {
    //       context.showResultDialog(
    //           baseResponse: GeneralResponse(
    //               status: false, message: next.error.toString()));
    //     }
    //   } else if (next is AsyncLoading) {
    //     context.showLoadingDialog();
    //   }
    // });

    return Scaffold(
      appBar: buildAppBar(context, ref, printer, mode),
      bottomNavigationBar: ButtonPrintReceipt(
          cartPaymentReceipt: cartPaymentReceipt, mode: mode),
      backgroundColor: Colors.white,
      body: ResponsiveLayout(
        mobileBody: ReceiptPageMobile(cartPaymentReceipt: cartPaymentReceipt),
        tabletBody: ReceiptPageTablet(paymentReceipt: cartPaymentReceipt),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context, WidgetRef ref, PrinterModel? printer,
      PrinterModeEnum mode) {
    return AppBar(
      title: GestureDetector(
        onTap: () {
          print('is from cart : ${cartPaymentReceipt.isFromCart}');
          print('is from cart : ${cartPaymentReceipt.receiptFrom}');

        },
        child: CustomText(
          'Cetak Struk',
          style: CustomTextStyle.h6.copyWith(
            color: Colors.white,
          ),
        ),
      ),
      actions: context.isMobile
          ? [
              IconButton(
                onPressed: () {
                  ref.read(routerProvider).push('/settings', extra: true);
                },
                icon: Icon(Icons.settings,
                    color: mode == PrinterModeEnum.multiple?Colors.white:printer == null ? Colors.red : Colors.green),
              ),
              // IconButton(
              //     onPressed: () {
              //       ref.read(printerServiceProvider.notifier).printTicket();
              //     },
              //     icon: const Icon(
              //       Icons.print_rounded,
              //     )),
            ]
          : [],
    );
  }
}
