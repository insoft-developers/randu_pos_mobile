import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/const/colors.dart';
import '../../../../domain/entities/printer/printer_mode_enum.dart';
import '../../../../domain/entities/printer/printer_model/printer_model.dart';
import '../../../providers/main/printer/printer_service_provider.dart';
import '../../../widgets/core/text/custom_text_style.dart';

class PrinterItem extends ConsumerWidget {
  const PrinterItem({
    super.key,
    required this.printer,
    required this.printerMode,
  });

  final PrinterModel printer;
  final PrinterModeEnum printerMode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelected = printer.isSelected;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? CustomColors.primaryColor : CustomColors.gray,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        dense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Radio<PrinterModel>(
          value: printer,
          groupValue: isSelected ? printer : null,
          onChanged: (PrinterModel? selectedPrinter) {
            if (selectedPrinter != null) {
              ref.read(printerServiceProvider.notifier).setPrinter(printer);
            }
          },
          fillColor: WidgetStateProperty.resolveWith<Color>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.selected)) {
                return CustomColors.blue; // Color when selected
              }
              return Colors.grey; // Color when not selected
            },
          ),
        ),
        title: Text(
          printer.name,
          style: CustomTextStyle.productName.copyWith(
            color: isSelected ? CustomColors.primaryColor : Colors.black,
          ),
        ),
        subtitle: Text(
          printer.macAddress,
          style: TextStyle(
            color: isSelected ? CustomColors.primaryColor : Colors.grey[600],
          ),
        ),
        onTap: () {
          if (printerMode == PrinterModeEnum.single) {
            ref
                .read(printerServiceProvider.notifier)
                .chooseSinglePrinter(printer);
          } else {
            ref.read(printerServiceProvider.notifier).setPrinter(printer);
          }
        },
      ),
    );
  }
}
