import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/const/colors.dart';
import '../../../../core/utils/confirmation_dialog.dart';
import '../../../../domain/entities/printer/printer_folder/printer_folder.dart';
import '../../../../domain/entities/printer/printer_model/printer_model.dart';
import '../../../providers/main/printer/multi_printer/printer_multi_provider.dart';
import '../../../providers/main/printer/printer_service_provider.dart';
import '../../../widgets/core/chips/primary_chips.dart';
import '../../../widgets/core/text/custom_text.dart';
import '../printer_utils.dart';
import '../set_paper_size_dialog.dart';

class FolderCard extends ConsumerWidget {
  final PrinterFolder folder;

  const FolderCard({super.key, required this.folder});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      color: CustomColors.productBlue2,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: CustomText(
                      folder.name,
                      style: CustomTextStyle.h6.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    onPressed: () async {
                      await showPrinterDialog(context, ref, folder);
                    },
                    icon: const Icon(
                      Icons.add_circle,
                      color: CustomColors.primaryColor,
                      size: 28,
                    ),
                    splashRadius: 20,
                  ),
                  /*IconButton(
                    onPressed: () async {
                      deleteFolder(context, ref, folder);
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: CustomColors.lightErrorMain,
                      size: 28,
                    ),
                    splashRadius: 20,
                  ),*/
                ],
              ),
            ),
            folder.printer.isEmpty
                ? const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: CustomText(
                        'Silahkan tambahkan perangkat terlebih dahulu'),
                  )
                : const Divider(
                    height: 16,
                    thickness: 1,
                    color: Colors.black12,
                  ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: folder.printer.length,
              itemBuilder: (context, index) {
                final printer = folder.printer[index];
                return ItemPrinter(printer: printer, folder: folder);
              },
            ),
          ],
        ),
      ),
    );
  }

  void deleteFolder(
      BuildContext context, WidgetRef ref, PrinterFolder folder) async {
    final result = await context.confirmationPopUp(
      context: context,
      titleMessage: 'Hapus Folder',
      content: 'Apakah anda yakin ingin menghapus folder ini?',
      type: DialogType.warning,
    );
    if (result != null && result) {
      // ref.read(printerServiceProvider.notifier).deleteFolder(folder);
    }
  }
}

class ItemPrinter extends StatelessWidget {
  const ItemPrinter({
    super.key,
    required this.printer,
    required this.folder,
  });

  final PrinterModel printer;
  final PrinterFolder folder;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Consumer(builder: (context, ref, child) {
        return ListTile(
          dense: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          leading: const Icon(
            Icons.print,
            color: Colors.blue,
          ),
          title: Text(
            printer.name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                printer.macAddress,
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
              PrimaryChips.gradientFill(
                  title: printer.paperSizeString, subTitle: '')
            ],
          ),
          isThreeLine: true,
          trailing: PopupMenuButton<String>(
            icon: const Icon(
              Icons.more_vert_rounded,
              color: Colors.black54,
            ),
            onSelected: (String value) async {
              if (value == 'check') {
                print('Check selected');
                await ref
                    .read(printerServiceProvider.notifier)
                    .testPrintIndiviualPrinterInMultiPrinter(printer, folder);
              } else if (value == 'delete') {
                print('Delete selected');
                ref
                    .read(printerMultiProvider.notifier)
                    .deletePrinterFromFolder(printer, folder);
              } else if (value == 'papersize') {
                print('Paper size selected');
                await showPaperSizeDialog(context, ref, folder, printer);
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'check',
                child: Row(
                  children: [
                    Icon(Icons.local_print_shop_sharp, color: Colors.blue),
                    SizedBox(width: 8),
                    Text('Test Print'),
                  ],
                ),
              ),
              const PopupMenuItem<String>(
                value: 'papersize',
                child: Row(
                  children: [
                    Icon(Icons.change_circle_rounded, color: Colors.blue),
                    SizedBox(width: 8),
                    Text('Ganti Ukuran Kertas'),
                  ],
                ),
              ),
              const PopupMenuItem<String>(
                value: 'delete',
                child: Row(
                  children: [
                    Icon(Icons.delete, color: Colors.red),
                    SizedBox(width: 8),
                    Text('Hapus'),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
