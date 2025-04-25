import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/enum/response_state.dart';
import '../../../../domain/entities/printer/printer_model/printer_model.dart';
import '../../../providers/main/printer/printer_service_provider.dart';
import '../../../widgets/core/loading/skeleton.dart';
import '../../../../domain/entities/printer/printer_mode_enum.dart';
import 'printer_item.dart';

class PrinterList extends ConsumerWidget {
  const PrinterList({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scanPrinterState = ref.watch(printerServiceProvider.select((value) => value.scanPrinterState));
    final listPrinter = ref.watch(printerServiceProvider.select((value) => value.printerList));
    final mode = ref.watch(printerServiceProvider.select((value) => value.printerMode));
    switch (scanPrinterState) {
      case ResponseState.loading:
        return _loading();
      case ResponseState.ok:
        return _listPrinterSuccess(listPrinter, mode);
      case ResponseState.error:
        return const Center(
          child: Text('Error scan printer'),
        );
      default:
        return const SizedBox.shrink();
    }
  }

  ListView _listPrinterSuccess(List<PrinterModel> listPrinter, PrinterModeEnum mode) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: listPrinter.length,
        itemBuilder: (context, index) {
          return PrinterItem(
              printer: listPrinter[index], printerMode: mode);
        },
        separatorBuilder: (BuildContext context, int index) =>
            const SizedBox(height: 8),
      );
  }

  Padding _loading() {
    return Padding(
        padding: const EdgeInsets.only(top: 8),
        child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) => const ListTile(
            dense: true,
            horizontalTitleGap: 20,
            leading: Skeleton(
              width: 25,
              height: 25,
              circle: true,
            ),
            title: Padding(
              padding: EdgeInsets.only(right: 50),
              child: Skeleton(
                width: 50,
                height: 16,
                radius: 20,
              ),
            ),
            subtitle: Skeleton(
              width: 75,
              height: 16,
              radius: 20,
            ),
          ),
          separatorBuilder: (context, index) => const SizedBox(
            height: 8,
          ),
        ),
      );
  }
}
