import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/const/constant.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/utils/custom_alert_dialog.dart';
import '../../../core/utils/rounded_bottom_sheet.dart';
import '../../../domain/entities/printer/printer_folder/printer_folder.dart';
import '../../../domain/entities/printer/printer_model/printer_model.dart';
import '../../providers/main/printer/multi_printer/printer_multi_provider.dart';
import '../../providers/main/printer/printer_service_provider.dart';
import '../../widgets/core/text/custom_text.dart';
import 'widgets/button_print_receipt_content.dart';
import 'widgets/folder_add_dialog_content.dart';

Future<void> showPrinterDialog(
    BuildContext context, WidgetRef ref, PrinterFolder folder) async {
  final printerList =
      ref.watch(printerServiceProvider.select((value) => value.printerList));
  if (printerList.isEmpty) {
    ref
        .read(printerServiceProvider.notifier)
        .startScanPrinter(isDummy: fakePrinters);
  }
  if (context.isMobile) {
    await showRoundedBottomSheet(
      context: context,
      isDismissible: true,
      onClose: (value) {
        print(value);
      },
      builder: (context) => ListPrinterDialogMobile(
        folder: folder,
        printerList: printerList,
      ),
      enableDrag: false,
    );
  } else {
    await showCustomAlertDialog(
      context: context,
      onClose: (value) {
        print(value);
        // ref.watch(openCashierProvider(initialCashAmount: value));
      },
      builder: (context) => SizedBox(
          width: 500,
          child: ListPrinterDialogTablet(
            folder: folder,
            printerList: printerList,
          )),
    );
  }
}

class ListPrinterDialogMobile extends StatelessWidget {
  const ListPrinterDialogMobile(
      {super.key, required this.folder, required this.printerList});
  final PrinterFolder folder;
  final List<PrinterModel> printerList;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            top: 16,
            left: 16,
            right: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const CustomText('Pilih Printer'),
              const SizedBox(
                height: 8,
              ),
              ...printerList.map((e) {
                return MultiplePrinterItem(folder: folder, printer: e);
              }),
            ],
          ),
        ));
  }
}

class MultiplePrinterItem extends ConsumerWidget {
  const MultiplePrinterItem({
    super.key,
    required this.folder,
    required this.printer,
  });
  final PrinterFolder folder;
  final PrinterModel printer;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      dense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: const Icon(Icons.print),
      title: Text(
        printer.name,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        printer.macAddress,
        style: TextStyle(
          color: Colors.grey[600],
        ),
      ),
      onTap: () {
        PrinterFolder newPrinterFolder = folder;
        List<PrinterModel> newPrinterList = [...newPrinterFolder.printer];
        if (newPrinterList.contains(printer)) {
          context.pop();
          return;
        } else {
          newPrinterList.add(printer);
        }
        newPrinterFolder = newPrinterFolder.copyWith(printer: newPrinterList);
        ref
            .read(printerMultiProvider.notifier)
            .savePrinterFolder(newPrinterFolder);
        context.pop();
      },
    );
  }
}

class ListPrinterDialogTablet extends StatelessWidget {
  const ListPrinterDialogTablet(
      {super.key, required this.folder, required this.printerList});
  final PrinterFolder folder;
  final List<PrinterModel> printerList;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      backgroundColor: Colors.white,
      content: SingleChildScrollView(
        child: SizedBox(
          width: 500,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const CustomText('Pilih Printer'),
              const SizedBox(
                height: 8,
              ),
              ...printerList.map((e) {
                return MultiplePrinterItem(folder: folder, printer: e);
              }),
            ],
          ),
        ),
      ),
    );
  }
}

/// not used yet, add folder
Future<void> showAddFolderDialog(BuildContext context, WidgetRef ref) async {
  if (context.isMobile) {
    await showRoundedBottomSheet(
      context: context,
      isDismissible: true,
      onClose: (value) {
        print(value);
      },
      builder: (context) => const FolderAddDialogMobile(),
      enableDrag: false,
    );
  } else {
    await showCustomAlertDialog(
      context: context,
      onClose: (value) {
        print(value);
        // ref.watch(openCashierProvider(initialCashAmount: value));
      },
      builder: (context) =>
          const SizedBox(width: 500, child: FolderAddDialogMobile()),
    );
  }
}

/// not used yet, add printer

Future<void> showButtonPrintReceipt(
    BuildContext context, WidgetRef ref, PrinterFolder folder) async {
  if (context.isMobile) {
    await showRoundedBottomSheet(
      context: context,
      isDismissible: true,
      onClose: (value) {
        print(value);
      },
      builder: (context) => const ButtonPrintReceiptContent(),
      enableDrag: false,
    );
  } else {
    await showCustomAlertDialog(
      context: context,
      onClose: (value) {
        print(value);
        // ref.watch(openCashierProvider(initialCashAmount: value));
      },
      builder: (context) =>
          const SizedBox(width: 500, child: ButtonPrintReceiptContent()),
    );
  }
}
