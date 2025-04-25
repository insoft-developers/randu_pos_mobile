import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:oktoast/oktoast.dart';

import '../../../core/const/colors.dart';
import '../../../domain/entities/printer/printer_mode_enum.dart';
import '../../providers/main/printer/multi_printer/printer_multi_provider.dart';
import '../../providers/main/printer/printer_service_provider.dart';
import '../../widgets/core/text/custom_text.dart';
import '../../widgets/shared/header/report_header_mobile.dart';

class SettingPage extends ConsumerWidget {
  const SettingPage({super.key, this.withScaffold = true});

  final bool withScaffold;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return withScaffold
        ? Scaffold(
            appBar: AppBar(
              title: const Text('Settings'),
            ),
            body: buildSafeArea(ref, context, withScaffold))
        : buildSafeArea(ref, context, withScaffold);
  }

  SafeArea buildSafeArea(
      WidgetRef ref, BuildContext context, bool withScaffold) {
    final connectedPrinter = ref.watch(
        printerServiceProvider.select((value) => value.connectedPrinter));
    final mode =
        ref.watch(printerServiceProvider.select((value) => value.printerMode));

    return SafeArea(
      child: CustomScrollView(
        slivers: [
          // SliverAppBar for the header
          if (!withScaffold)
            const SliverAppBar(
              backgroundColor: CustomColors.primaryColor,
              expandedHeight: 120,
              iconTheme: IconThemeData(color: Colors.transparent),
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 12),
                      ReportHeaderMobile(
                        useRefresh: false,
                      ),
                    ],
                  ),
                ),
              ),
              floating: false,
              pinned: false,
            )
          else
            const SliverToBoxAdapter(
              child: SizedBox.shrink(),
            ),
          // SliverList with CupertinoFormSection for printer settings
          SliverList(
            delegate: SliverChildListDelegate(
              [
                CupertinoFormSection.insetGrouped(
                  header: const Text('Printer Settings'),
                  children: [
                    CupertinoListTile(
                        leading: const Icon(
                            CupertinoIcons.arrow_left_right_square_fill,
                            size: 20),
                        title: CustomText('Choose Mode',
                            style: CustomTextStyle.body2),
                        trailing: CupertinoSegmentedControl<PrinterModeEnum>(
                          children: {
                            PrinterModeEnum.single: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                child: CustomText('Single',
                                    style: CustomTextStyle.body2)),
                            PrinterModeEnum.multiple: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              child: CustomText('Multiple',
                                  style: CustomTextStyle.body2),
                            ),
                          },
                          onValueChanged: (PrinterModeEnum value) {
                            ref
                                .read(printerServiceProvider.notifier)
                                .setModePrinter(value);
                            // if(value == PrinterModeEnum.multiple){
                            //   showToast('Multiple printer mode is not available yet');
                            // }
                          },
                          groupValue: ref.watch(printerServiceProvider
                              .select((value) => value.printerMode)),
                        ),
                        onTap: null),
                    CupertinoListTile(
                        leading: Icon(CupertinoIcons.printer,
                            size: 20,
                            color: mode == PrinterModeEnum.single
                                ? Colors.black
                                : Colors.grey),
                        title: CustomText('Single Printer',
                            style: CustomTextStyle.body2.copyWith(
                                color: mode == PrinterModeEnum.single
                                    ? Colors.black
                                    : Colors.grey)),
                        trailing: CustomText(
                          connectedPrinter?.name ?? 'Not Connected',
                          style: const TextStyle(
                              color: CustomColors.lightWarningMain),
                        ),
                        onTap: mode != PrinterModeEnum.single
                            ? null
                            : () {
                                // ref
                                //     .read(printerServiceProvider.notifier)
                                //     .setModePrinter(PrinterModeEnum.single);
                                context.push('/list_device_printer');
                              }),
                    CupertinoListTile(
                      leading: Icon(CupertinoIcons.settings,
                          size: 20,
                          color: mode == PrinterModeEnum.multiple
                              ? Colors.black
                              : Colors.grey),
                      title: CustomText('Multiple Printer',
                          style: CustomTextStyle.body2.copyWith(
                              color: mode == PrinterModeEnum.multiple
                                  ? Colors.black
                                  : Colors.grey)),
                      trailing: const CupertinoListTileChevron(),
                      onTap: mode != PrinterModeEnum.multiple
                          ? null
                          : () {
                              ref
                                  .read(printerServiceProvider.notifier)
                                  .setModePrinter(PrinterModeEnum.multiple);
                              context.push('/multi_device_printer');
                              // Navigate to printer configuration page
                            },
                    ),
                  ],
                ),
                CupertinoFormSection.insetGrouped(
                  header:
                      CustomText('Test Printer', style: CustomTextStyle.body2),
                  children: [
                    CupertinoListTile(
                      leading: Icon(
                        Icons.print_rounded,
                        size: 20,
                        color: mode == PrinterModeEnum.multiple
                            ? Colors.grey
                            : Colors.black,
                      ),
                      title: CustomText('Test Print Single Printer',
                          style: CustomTextStyle.body2.copyWith(
                            color: mode == PrinterModeEnum.multiple
                                ? Colors.grey
                                : Colors.black,
                          )),
                      trailing: const CupertinoListTileChevron(),
                      onTap: mode == PrinterModeEnum.multiple
                          ? null
                          : () {
                              final printer = ref.read(
                                  printerServiceProvider.select(
                                      (value) => value.getSelectedPrinter));
                              if (printer != null) {
                                ref
                                    .read(printerServiceProvider.notifier)
                                    .printString(PrinterTypeEnum.cashier);
                              } else {
                                showToast('Silahkan pilih printer');
                              }
                            },
                    ),
                    CupertinoListTile(
                      leading: Icon(
                        Icons.group_work,
                        size: 20,
                        color: mode == PrinterModeEnum.single
                            ? Colors.grey
                            : Colors.black,
                      ),
                      title: CustomText('Test Print Multi Printer',
                          style: CustomTextStyle.body2.copyWith(
                            color: mode == PrinterModeEnum.single
                                ? Colors.grey
                                : Colors.black,
                          )),
                      trailing: const CupertinoListTileChevron(),
                      onTap: mode == PrinterModeEnum.single
                          ? null
                          : () async{
                              await ref.read(printerMultiProvider.notifier)
                                  .getPrinterFolders();
                              final printers = ref.watch(
                                  printerMultiProvider.select((value) =>
                                      value.totalPrintersInAllFolders));
                              if (printers > 0) {
                                ref
                                    .read(printerServiceProvider.notifier)
                                    .printMultiplePrinter(isTesting: true);
                              } else {
                                showToast('Silahkan pilih printer minimal 1');
                              }
                            },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
