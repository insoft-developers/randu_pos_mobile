import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

import '../../../../domain/entities/printer/paper_size.dart';
import '../../../../domain/entities/printer/printer_mode_enum.dart';
import '../../../../domain/entities/transaction/cart/receipt_from_enum.dart';
import '../../../../domain/entities/transaction/cart/request/payment/payment_request_model.dart';
import '../../../../domain/entities/user_model.dart';
import '../../../providers/cores/router/go_router_provider.dart';
import '../../../providers/main/cart/cart_provider.dart';
import '../../../providers/main/cart/get_tables/get_tables_provider.dart';
import '../../../providers/main/printer/multi_printer/printer_multi_provider.dart';
import '../../../providers/main/printer/printer_service_provider.dart';
import '../../../widgets/core/buttons/primary_button.dart';
import '../../../widgets/core/text/custom_text.dart';
import '../receipt_utils.dart';

class ButtonPrintReceipt extends ConsumerWidget {
  const ButtonPrintReceipt({
    super.key,
    required this.cartPaymentReceipt,
    required this.mode,
  });

  final PaymentReceiptModel cartPaymentReceipt;
  final PrinterModeEnum mode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = Hive.box<UserModel>('userBox').get('userBox');
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: mode == PrinterModeEnum.single
          ? _buildSinglePrinterMode(context, ref, user, cartPaymentReceipt)
          : _buildMultiplePrinterMode(ref, context, user, cartPaymentReceipt),
    );
  }

  Widget _buildSinglePrinterMode(BuildContext context, WidgetRef ref,
      UserModel? user, PaymentReceiptModel cartPaymentReceipt) {
    print('DEBUG cartPaymentReceipt: $cartPaymentReceipt');

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _checkboxChecker(ref),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: PrimaryButton(
                buttonPrimaryType: ButtonPrimaryType.outlinedWhitePrimary,
                label: 'Kembali',
                useAutoSizedLabel: true,
                onTap: () => _onBackPressed(ref),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    child: _PrintButton(
                      type: PrinterTypeEnum.checker,
                      onPressed: () => _printReceipt(
                          context, ref, user, true, false, 'checker'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _PrintButton(
                      type: PrinterTypeEnum.cashier,
                      onPressed: () => _printReceipt(
                          context, ref, user, false, false, 'cashier'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMultiplePrinterMode(WidgetRef ref, BuildContext context,
      UserModel? user, PaymentReceiptModel cartPaymentReceipt) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Add checkbox above the buttons
        if (cartPaymentReceipt.receiptFrom == ReceiptFromEnum.saved)
          _checkboxChecker(ref),
        Row(
          children: [
            Expanded(
              child: _PrintButton(
                type: PrinterTypeEnum.checker,
                onPressed: () async {
                  _printReceipt(context, ref, user, true, true, 'checker');
                },
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _PrintButton(
                type: PrinterTypeEnum.cashier,
                onPressed: () =>
                    _printReceipt(context, ref, user, false, true, 'cashier'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: PrimaryButton(
                buttonPrimaryType: ButtonPrimaryType.outlinedWhitePrimary,
                label: 'Kembali',
                useAutoSizedLabel: true,
                onTap: () => _onBackPressed(ref),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _PrintButton(
                type: PrinterTypeEnum.allReceipt,
                onPressed: () => _printMultipleReceipts(ref, context),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Padding _checkboxChecker(WidgetRef ref) {
    final isToggleAllProductCheckerActive = ref.watch(printerServiceProvider
        .select((value) => value.isPrintAllProductChecker));
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: CheckboxListTile(
        title: const CustomText('Print Semua Produk (checker)'),
        value: isToggleAllProductCheckerActive,
        dense: true,
        contentPadding: EdgeInsets.zero,
        onChanged: (value) {
          ref
              .read(printerServiceProvider.notifier)
              .togglePrintAllProductChecker();
        },
      ),
    );
  }

  void _onBackPressed(WidgetRef ref) {
    if (cartPaymentReceipt.receiptFrom == ReceiptFromEnum.pos) {
      ref.read(cartProvider.notifier).resetCart();
      ref.read(getTablesProvider.notifier).reset();
    }
    ref.read(routerProvider).pushReplacementNamed('dashboard');
  }

  Future<void> _printReceipt(
    BuildContext context,
    WidgetRef ref,
    UserModel? user,
    bool isCashier,
    bool isIndividual,
    String? folderId, // for multiple printer mode but individual
  ) async {
    final mode =
        ref.watch(printerServiceProvider.select((value) => value.printerMode));
    await checkPrinterStatus(
      ref: ref,
      printerMode: mode,
      type: isCashier ? PrinterTypeEnum.cashier : PrinterTypeEnum.checker,
      context: context,
      isIndividual: isIndividual,
      onGrantedPermissionCallback: () async {
        final profile = await CapabilityProfile.load();
        PaperSizeModel? paperSize;
        // final paperSize = ref.watch(
        //   printerServiceProvider
        //       .select((value) => value.paperSizeSinglePrinter),
        // );
        if (mode == PrinterModeEnum.multiple) {
          if (folderId == null) return;
          paperSize = await ref
              .read(printerMultiProvider.notifier)
              .getPaperSize(folderId);
        } else {
          paperSize = ref.read(printerServiceProvider
              .select((value) => value.paperSizeSinglePrinter));
        }
        final user = Hive.box<UserModel>('userBox').get('userBox');
        final isPrintAllProductChecker = ref.watch(printerServiceProvider
            .select((value) => value.isPrintAllProductChecker));
        ref.read(printerServiceProvider.notifier).printTicket(
              receiptBytes: await cartPaymentReceipt.generateReceipt(
                user: user!,
                paperSize: paperSize?.size ?? PaperSize.mm80,
                capabilityProfile: profile,
                businessName: user.bussinessName ?? '-',
                businessAddress: user.bussinessAddress ?? '',
                footer: user.footerReceipt,
                isCashier: isCashier,
                isPrintAllProductChecker: isPrintAllProductChecker,
              ),
            );
      },
    );

    if (cartPaymentReceipt.receiptFrom == ReceiptFromEnum.pos && !isCashier) {
      ref.read(printerServiceProvider.notifier).printTicket(
            receiptBytes: await openCashDrawer(),
          );
    }
    if (isCashier) {
      await Future.delayed(const Duration(seconds: 1));
      // SET ALREADY PRINTED
      ref.read(cartProvider.notifier).updatePrintedProduct(true);
    }
  }

  Future<void> _printMultipleReceipts(
    WidgetRef ref,
    BuildContext context,
  ) async {
    print('print multiple receipt');
    final mode =
        ref.watch(printerServiceProvider.select((value) => value.printerMode));
    await checkPrinterStatus(
      ref: ref,
      context: context,
      printerMode: mode,
      type: PrinterTypeEnum.allReceipt,
      onGrantedPermissionCallback: () async {
        ref.read(printerServiceProvider.notifier).printMultiplePrinter(
              isTesting: false,
              receipt: cartPaymentReceipt,
            );
        await Future.delayed(const Duration(seconds: 1));
        ref.read(cartProvider.notifier).updatePrintedProduct(true);
      },
    );
  }
}

class _PrintButton extends StatelessWidget {
  const _PrintButton({
    required this.type,
    required this.onPressed,
  });

  final VoidCallback onPressed;
  final PrinterTypeEnum type;

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      buttonPrimaryType: type.buttonPrimaryType,
      label: type.name,
      useAutoSizedLabel: true,
      onTap: onPressed,
    );
  }
}
