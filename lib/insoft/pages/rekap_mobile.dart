import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../core/const/colors.dart';
import '../../core/utils/date_utils.dart';
import '../../presentation/widgets/core/container/custom_rounded_container.dart';
import '../../presentation/widgets/core/text/custom_text_style.dart';
import '../../presentation/widgets/shared/header/report_header_mobile.dart';
import '../controller/rekap_harian_controller.dart';
import 'rekap_detail.dart';

class RekapMobile extends StatelessWidget {
  RekapMobile({super.key});
  final RekapHarianController _rhc = Get.put(RekapHarianController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                color: CustomColors.primaryColor,
                child: const Column(
                  children: [
                    SizedBox(height: 12),
                    ReportHeaderMobile(),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Rekapitulasi Harian Advance',
                        style: CustomTextStyle.h6Bold
                            .copyWith(color: Colors.blue[900]),
                      ),
                      const SizedBox(height: 16),
                      CustomRoundedContainer(
                        shadow: const [],
                        radius: 0,
                        padding: const EdgeInsets.only(left: 16, right: 4),
                        border: Border.all(color: CustomColors.darkGray),
                        child: Row(
                          children: [
                            Expanded(
                              child: Obx(() => Text(_rhc.selectedDate.value)),
                            ),
                            Obx(
                              () => _rhc.selectedDate.value ==
                                      _rhc.todayDate.value
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
                      const SizedBox(height: 16),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 3 / 5,
                        child: Obx(
                          () => _rhc.loading.value
                              ? const Center(child: Text('Loading'))
                              : _rhc.rekapHarianData.isEmpty
                                  ? const Center(child: Text('Data tidak ada'))
                                  : ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: _rhc.rekapHarianData.length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    RekapDetail(
                                                  dataList: _rhc
                                                      .rekapHarianData[index],
                                                ),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 0, 0, 12),
                                            child: CustomRoundedContainer(
                                              padding:
                                                  const EdgeInsets.symmetric(
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
                                                        _rhc.rekapHarianData[
                                                                    index]
                                                                ['nama_toko'] ??
                                                            '-',
                                                  ),
                                                  const SizedBox(height: 4),
                                                  RowItem(
                                                    title: 'Staff',
                                                    content:
                                                        _rhc.rekapHarianData[
                                                                        index]
                                                                    ['user']
                                                                ['fullname'] ??
                                                            '-',
                                                  ),
                                                  const SizedBox(height: 4),
                                                  RowItem(
                                                    title: 'Buka',
                                                    content: _rhc.rekapHarianData[
                                                                    index]
                                                                ['kas_kecil'][
                                                            'open_cashier_at'] ??
                                                        '-',
                                                  ),
                                                  const SizedBox(height: 4),
                                                  RowItem(
                                                    title: 'Tutup',
                                                    content: _rhc.rekapHarianData[
                                                                    index]
                                                                ['kas_kecil'][
                                                            'close_cashier_at'] ??
                                                        '-',
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
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
