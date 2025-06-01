import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/const/colors.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/utils/currency_utils.dart';
import '../../../core/utils/date_utils.dart';
import '../../../domain/entities/report/daily_recap/daily_recap_model.dart';
import '../../presentation/widgets/core/container/custom_rounded_container.dart';
import '../../presentation/widgets/core/text/custom_text.dart';
import '../../presentation/widgets/shared/header/report_header_tablet.dart';
import '../controller/rekap_harian_controller.dart';
import 'rekap_detail.dart';

class RekapTablet extends StatelessWidget {
  RekapTablet({
    super.key,
  });

  final RekapHarianController _rhc = Get.put(RekapHarianController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              color: CustomColors.primaryColor,
              child: const Column(
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  ReportHeaderTablet(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomText(
                    'Rekapitulasi Harian',
                    style: CustomTextStyle.h6Bold
                        .copyWith(color: Colors.blue[900]),
                  ),
                  const Spacer(),
                  CustomRoundedContainer(
                    shadow: const [],
                    width: 300,
                    radius: 0,
                    padding: const EdgeInsets.only(left: 16, right: 4),
                    border: Border.all(color: CustomColors.darkGray),
                    child: Row(
                      children: [
                        Expanded(
                          child: Obx(() => Text(_rhc.selectedDate.value)),
                        ),
                        Obx(
                          () => _rhc.selectedDate.value == _rhc.todayDate.value
                              ? const SizedBox.shrink()
                              : GestureDetector(
                                  onTap: () {
                                    _rhc.changeSelectedDate(
                                        _rhc.todayDate.value);
                                  },
                                  child: const Icon(
                                    Icons.cancel_outlined,
                                    color: CustomColors.lightErrorMain,
                                  ),
                                ),
                        ),
                        '1' != '1'
                            ? GestureDetector(
                                onTap: () {},
                                child: const Icon(
                                  Icons.cancel_outlined,
                                  color: CustomColors.lightErrorMain,
                                ),
                              )
                            : const SizedBox.shrink(),
                        IconButton(
                          onPressed: () async {
                            await openDatePicker(
                              context: context,
                              lastDate: DateTime.now(),
                              onDateSelected: (date) {
                                String tanggal =
                                    DateFormat('yyyy-MM-dd').format(date);
                                _rhc.changeSelectedDate(tanggal);
                              },
                            );
                          },
                          icon: const Icon(Icons.calendar_month),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: LayoutBuilder(builder: (context, constraint) {
                  final isTabletSmall = context.isLanscapeAndSmallerThan1000;
                  return Obx(
                    () => _rhc.loading.value
                        ? const Center(child: Text('Loading'))
                        : _rhc.rekapHarianData.isEmpty
                            ? const Center(child: Text('Data tidak ada'))
                            : GridView.builder(
                                itemCount: _rhc.rekapHarianData.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: isTabletSmall ? 2 : 4,
                                  childAspectRatio: 2,
                                  mainAxisSpacing: 16,
                                  crossAxisSpacing: 16,
                                ),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => RekapDetail(
                                            dataList:
                                                _rhc.rekapHarianData[index],
                                          ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      margin:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: CustomRoundedContainer(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 16,
                                          horizontal: 20,
                                        ),
                                        shadow: const [],
                                        border: Border.all(
                                            color: CustomColors.gray),
                                        child: Column(
                                          children: [
                                            RowItem(
                                              title: 'Nama Toko',
                                              content:
                                                  _rhc.rekapHarianData[index]
                                                          ['nama_toko'] ??
                                                      '-',
                                            ),
                                            const SizedBox(height: 4),
                                            RowItem(
                                              title: 'Staff',
                                              content:
                                                  _rhc.rekapHarianData[index]
                                                              ['user']
                                                          ['fullname'] ??
                                                      '-',
                                            ),
                                            const SizedBox(height: 4),
                                            RowItem(
                                              title: 'Buka',
                                              content:
                                                  _rhc.rekapHarianData[index]
                                                              ['kas_kecil']
                                                          ['open_cashier_at'] ??
                                                      '-',
                                            ),
                                            const SizedBox(height: 4),
                                            RowItem(
                                              title: 'Tutup',
                                              content: _rhc.rekapHarianData[
                                                          index]['kas_kecil']
                                                      ['close_cashier_at'] ??
                                                  '-',
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                  );
                }),
              ),
            )
          ],
        ),
      ],
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
