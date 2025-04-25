import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/extensions/context_extension.dart';
import '../../../core/utils/custom_alert_dialog.dart';
import '../../../core/utils/rounded_bottom_sheet.dart';
import '../../../domain/entities/printer/printer_folder/printer_folder.dart';
import '../../../domain/entities/printer/printer_model/printer_model.dart';
import '../../providers/main/printer/multi_printer/printer_multi_provider.dart';
import '../../widgets/core/text/custom_text.dart';

// Constants for repeated values
const _dialogPadding = EdgeInsets.symmetric(horizontal: 16, vertical: 8);
const _textStyle = TextStyle(fontSize: 14, fontWeight: FontWeight.w500);

Future<void> showPaperSizeDialog(BuildContext context, WidgetRef ref,
    PrinterFolder folder, PrinterModel printer) async {
  final isMobile = context.isMobile;

  final dialogContent = PaperSizeDialogContent(
    isMobile: isMobile,
    folder: folder,
    printer: printer,
  );

  if (isMobile) {
    await showRoundedBottomSheet(
      context: context,
      isDismissible: true,
      onClose: (value) {
        print(value);
      },
      builder: (context) => dialogContent,
      enableDrag: false,
    );
  } else {
    await showCustomAlertDialog(
      context: context,
      onClose: (value) {
        print(value);
        // ref.watch(openCashDrawerProvider(initialCashAmount: value));
      },
      builder: (context) => dialogContent,
    );
  }
}

class PaperSizeDialogContent extends ConsumerWidget {
  final bool isMobile;
  final PrinterFolder folder;
  final PrinterModel printer;
  const PaperSizeDialogContent(
      {super.key,
      required this.isMobile,
      required this.folder,
      required this.printer});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return isMobile
        ? _buildMobileDialog(context, ref, folder, printer)
        : _buildTabletDialog(context, ref, folder, printer);
  }

  Widget _buildMobileDialog(BuildContext context, WidgetRef ref,
      PrinterFolder folder, PrinterModel printer) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        top: 16,
        left: 16,
        right: 16,
      ),
      child: SingleChildScrollView(
        child: _buildDialogContent(context, ref, folder, printer),
      ),
    );
  }

  Widget _buildTabletDialog(BuildContext context, WidgetRef ref,
      PrinterFolder folder, PrinterModel printer) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      backgroundColor: Colors.white,
      content: SingleChildScrollView(
        child: SizedBox(
          width: 500,
          child: _buildDialogContent(context, ref, folder, printer),
        ),
      ),
    );
  }

  Widget _buildDialogContent(BuildContext context, WidgetRef ref,
      PrinterFolder folder, PrinterModel printer) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomText('Pilih Paper Size : ${printer.name}',
            style: CustomTextStyle.body1SemiBold),
        // const SizedBox(height: 8),
        ..._buildPaperSizeList(context, ref, folder, printer),
      ],
    );
  }

  List<Widget> _buildPaperSizeList(BuildContext context, WidgetRef ref,
      PrinterFolder folder, PrinterModel printer) {
    return listPageSize.map((e) {
      return ListTile(
        dense: true,
        contentPadding: _dialogPadding,
        leading: const Icon(Icons.print, size: 20),
        title: Text(
          e.key,
          style: _textStyle,
        ),
        onTap: () {
          ref
              .read(printerMultiProvider.notifier)
              .setPaperSizePrinter(printer, folder, e.value);
          context.pop();
        },
      );
    }).toList();
  }
}
