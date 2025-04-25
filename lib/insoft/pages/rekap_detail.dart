import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/const/colors.dart';
import '../../core/utils/currency_utils.dart';
import '../../core/utils/date_utils.dart';
import '../../domain/entities/printer/paper_size.dart';
import '../../domain/entities/printer/printer_mode_enum.dart';
import '../../domain/entities/report/daily_recap/daily_recap_model.dart';
import '../../presentation/pages/receipt/receipt_utils.dart';
import '../../presentation/providers/main/printer/multi_printer/printer_multi_provider.dart';
import '../../presentation/providers/main/printer/printer_service_provider.dart';
import '../../presentation/widgets/core/buttons/primary_button.dart';
import '../../presentation/widgets/core/container/custom_rounded_container.dart';
import '../../presentation/widgets/core/text/custom_text.dart';

// ignore: must_be_immutable
class RekapDetail extends StatelessWidget {
  Map<String, dynamic> dataList;
  RekapDetail({super.key, required this.dataList});

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
              RekapContent(
                listData: dataList,
              ),
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

                    if (mode == PrinterModeEnum.multiple) {
                      paperSize = await ref
                          .read(printerMultiProvider.notifier)
                          .getPaperSize('dailyRecap');
                    } else {
                      paperSize = ref.read(printerServiceProvider
                          .select((value) => value.paperSizeSinglePrinter));
                    }
                    ref.read(printerServiceProvider.notifier).printString(null);

                    await Future.delayed(const Duration(milliseconds: 100));

                    // ref.read(printerServiceProvider.notifier).printTicket(
                    //     receiptBytes: await generateDailyRecap(
                    //         paperSize: paperSize?.size ?? PaperSize.mm80,
                    //         capabilityProfile: capabilityProfile,
                    //         data: dailyRecapItem));
                  });
            });
      }),
    );
  }
}

class RekapContent extends StatelessWidget {
  Map<String, dynamic> listData;
  RekapContent({super.key, required this.listData});

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
                  content: listData['nama_toko'] ?? '-',
                ),
                const SizedBox(height: 4),
                RowItem(
                  title: 'Staff',
                  content: listData['user']['fullname'] ?? '-',
                ),
                const SizedBox(height: 4),
                RowItem(
                  title: 'Buka',
                  content: listData['kas_kecil']['open_cashier_at'] ?? '-',
                ),
                const SizedBox(height: 4),
                RowItem(
                  title: 'Tutup',
                  content: listData['kas_kecil']['close_cashier_at'] ?? '-',
                ),
              ],
            ),
          ),
          const Divider(
            color: CustomColors.darkGray,
          ),
          DetailItem(
              title: 'Kas Awal',
              content: '${listData['kas_kecil']['initial_cash_amount'] ?? 0}'),
          DetailItem(
              title: 'Penjualan Kas \n/ Bayar Tunai di Kasir',
              content: '${listData['tunai'] ?? 0}'),
          DetailItem(
              title: 'Penjualan Payment Gateway \n/ QRIS Randu Wallet',
              content: '${listData['pg'] ?? 0}'),
          DetailItem(
              title:
                  'Penjualan Transfer Rekening \n/EDC/QRIS Toko \n(Cek Manual)',
              content: '${listData['transfer'] ?? 0}'),
          const SizedBox(
            height: 12,
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: listData['banks'].length,
              physics: const ScrollPhysics(),
              itemBuilder: (context, index) {
                return DetailItem2(
                  title: '    - ${listData['banks'][index]['bank']}',
                  content: '${listData['banks'][index]['perbank'] ?? 0}',
                  items: listData['banks'][index]['flags'],
                );
              }),
          DetailItem(
              title: 'Penjualan Piutang / Kasbon',
              content: '${listData['piutang'] ?? 0}'),
          const SizedBox(
            height: 12,
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: listData['kasbon'].length,
              physics: const ScrollPhysics(),
              itemBuilder: (context, index) {
                return DetailItem2(
                  title: '    - ${listData['kasbon'][index]['method']}',
                  content: '${listData['kasbon'][index]['perkasbon'] ?? 0}',
                  items: listData['kasbon'][index]['flags'],
                );
              }),
          DetailItem(
              title: 'Total Penjualan Tunai',
              content: '${listData['tunai'] ?? 0}'),
          DetailItem(
              title: 'Total Penjualan Non Tunai',
              content: '${listData['omset'] - listData['tunai'] ?? 0}'),
          DetailItem(
              title: 'Total Penjualan \nTunai + Kas Awal',
              content:
                  '${listData['kas_kecil']['initial_cash_amount'] + listData['tunai'] ?? 0}'),
          DetailItem(
              title: 'Pengeluaran Outlet',
              content: '${listData['outlet_output'] ?? 0}'),
          DetailItem(
              title: 'Saldo Akhir Kas Awal',
              content:
                  '${listData['kas_kecil']['initial_cash_amount'] + listData['tunai'] - listData['outlet_output'] ?? 0}'),
          DetailItem(
            title: 'Omset Penjualan',
            content: '${listData['omset'] ?? 0}',
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

class DetailItem2 extends StatelessWidget {
  DetailItem2(
      {super.key,
      required this.title,
      required this.content,
      this.bottomBordered = true,
      required this.items});

  final String title;
  final String content;
  final bool bottomBordered;
  List<dynamic> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: bottomBordered
          ? const BoxDecoration(
              border: Border(bottom: BorderSide(color: CustomColors.gray)))
          : null,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style:
                    CustomTextStyle.productName.copyWith(color: Colors.black87),
              ),
              Text(
                formatStringIDRToCurrency(text: content, symbol: 'Rp '),
                style:
                    CustomTextStyle.productName.copyWith(color: Colors.black87),
              ),
            ],
          ),
          ListView.builder(
              itemCount: items.length,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemBuilder: (context, index) {
                return DetailItem(
                    title: '    - ${items[index]['flag']}',
                    content: '${items[index]['perflag'] ?? 0}');
              })
        ],
      ),
    );
  }
}
