import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/const/colors.dart';
import '../../../../core/utils/currency_utils.dart';
import '../../../../core/utils/date_utils.dart';
import '../../../../domain/entities/printer/paper_size.dart';
import '../../../../domain/entities/printer/printer_mode_enum.dart';
import '../../../../domain/entities/report/daily_recap/daily_recap_model.dart';
import '../../../providers/main/printer/multi_printer/printer_multi_provider.dart';
import '../../../providers/main/printer/printer_service_provider.dart';
import '../../../widgets/core/buttons/primary_button.dart';
import '../../../widgets/core/container/custom_rounded_container.dart';
import '../../../widgets/core/text/custom_text.dart';
import '../../receipt/receipt_utils.dart';

class DailyRecapDetail extends StatelessWidget {
  const DailyRecapDetail({super.key, required this.dailyRecapItem});

  final DailyRecapModel dailyRecapItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText('Detail Rekapitulasi Harian'),
      ),
      bottomNavigationBar: printButton(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              DailyRecapDetailContent(dailyRecapItem: dailyRecapItem),
            ],
          ),
        ),
      ),
    );
  }

  Container printButton() {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 80,
      child: Consumer(builder: (context, ref, child) {
        final mode = ref
            .watch(printerServiceProvider.select((value) => value.printerMode));
        PaperSizeModel? paperSize;
        return PrimaryButton(
            label: 'Cetak',
            onTap: () async {
              await checkPrinterStatus(
                  printerMode: mode,
                  type: PrinterTypeEnum.dailyRecap,
                  ref: ref,
                  isIndividual: mode == PrinterModeEnum.multiple,
                  context: context,
                  onGrantedPermissionCallback: () async {
                    final capabilityProfile = await CapabilityProfile.load();

                    if(mode == PrinterModeEnum.multiple){
                      paperSize =
                      await ref.read(printerMultiProvider.notifier).getPaperSize('dailyRecap');
                    }else{
                      paperSize = ref.read(printerServiceProvider
                          .select((value) => value.paperSizeSinglePrinter));
                    }
                    ref
                        .read(printerServiceProvider.notifier)
                        .printString(null);

                    await Future.delayed(const Duration(milliseconds: 100));


                    ref.read(printerServiceProvider.notifier).printTicket(
                        receiptBytes: await generateDailyRecap(
                            paperSize: paperSize?.size ?? PaperSize.mm80,
                            capabilityProfile: capabilityProfile,
                            data: dailyRecapItem));
                  });
            });
      }),
    );
  }
}

class DailyRecapDetailContent extends StatelessWidget {
  const DailyRecapDetailContent({super.key, required this.dailyRecapItem});

  final DailyRecapModel dailyRecapItem;

  @override
  Widget build(BuildContext context) {
    return CustomRoundedContainer(
      radius: 16,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                RowItem(
                  title: 'Nama Toko',
                  content: dailyRecapItem.nameToko ?? '-',
                ),
                const SizedBox(height: 4),
                RowItem(
                  title: 'Staff',
                  content: dailyRecapItem.nameKasir ?? '-',
                ),
                const SizedBox(height: 4),
                RowItem(
                  title: 'Buka',
                  content: formatDateToString(
                        dailyRecapItem.openCashierAt,
                      ) ??
                      '-',
                ),
                const SizedBox(height: 4),
                RowItem(
                  title: 'Tutup',
                  content: formatDateToString(
                        dailyRecapItem.closeCashierAt,
                      ) ??
                      '-',
                ),
              ],
            ),
          ),
          const Divider(
            color: CustomColors.darkGray,
          ),
          DetailItem(
              title: 'Kas Awal', content: '${dailyRecapItem.initialCash ?? 0}'),
          DetailItem(
              title: 'Penjualan Tunai',
              content: '${dailyRecapItem.cashSale ?? 0}'),
          DetailItem(
              title: 'Penjualan Transfer/EDC',
              content: '${dailyRecapItem.transferSales ?? 0}'),
          DetailItem(
              title: 'Penjualan Payment Gateway',
              content: '${dailyRecapItem.paymentGatewaySales ?? 0}'),
          DetailItem(
              title: 'Penjualan Piutang',
              content: '${dailyRecapItem.piutangSales ?? 0}'),
          DetailItem(
              title: 'Pengeluaran Outlet',
              content: '${dailyRecapItem.outletOutput ?? 0}'),
          DetailItem(
              title: 'Total Kas Tunai',
              content: '${(dailyRecapItem.totalCash ?? 0)}'),
          DetailItem(
            title: 'Total Penjualan + Kas Awal',
            content:
                '${(dailyRecapItem.totalSales ?? 0) + (dailyRecapItem.initialCash ?? 0)}',
            bottomBordered: false,
          ),
        ],
      ),
    );
  }
}

class RowItem extends StatelessWidget {
  const RowItem({super.key, required this.title, required this.content});

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: Text(
            title,
            style: CustomTextStyle.productName,
          ),
        ),
        const Text(':  '),
        Text(content),
      ],
    );
  }
}

class DetailItem extends StatelessWidget {
  const DetailItem(
      {super.key,
      required this.title,
      required this.content,
      this.bottomBordered = true});

  final String title;
  final String content;
  final bool bottomBordered;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: bottomBordered
          ? const BoxDecoration(
              border: Border(bottom: BorderSide(color: CustomColors.gray)))
          : null,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: CustomTextStyle.productName.copyWith(color: Colors.black87),
          ),
          Text(
            formatStringIDRToCurrency(text: content, symbol: 'Rp '),
            style: CustomTextStyle.productName.copyWith(color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
