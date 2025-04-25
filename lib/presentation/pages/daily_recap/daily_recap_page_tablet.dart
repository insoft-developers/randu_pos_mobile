import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/const/colors.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/utils/currency_utils.dart';
import '../../../core/utils/date_utils.dart';
import '../../../domain/entities/report/daily_recap/daily_recap_model.dart';
import '../../providers/main/report/daily_recap/daily_recap_provider.dart';
import '../../widgets/core/container/custom_rounded_container.dart';
import '../../widgets/core/text/custom_text.dart';
import '../../widgets/shared/header/report_header_tablet.dart';
import 'daily_recap_page_mobile.dart';
import 'widget/loading/daily_recap_loading_tablet.dart';

class DailyRecapPageTablet extends ConsumerStatefulWidget {
  const DailyRecapPageTablet({
    super.key,
  });

  @override
  ConsumerState<DailyRecapPageTablet> createState() =>
      _DailyRecapPageTabletState();
}

class _DailyRecapPageTabletState extends ConsumerState<DailyRecapPageTablet> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      final dailyRecap = ref.read(dailyRecapProvider);
      if (dailyRecap.value?.isLastPageReached ?? false) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Semua data telah ditampilkan'),
            duration: Durations.long1,
          ),
        );
      } else {
        ref.read(dailyRecapProvider.notifier).fetchNextPage();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final dailyRecap = ref.watch(dailyRecapProvider);
    List<DailyRecapModel> listDailyRecap = dailyRecap.value?.value ?? [];

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
                          child: Text(formatDateToString(
                                  dailyRecap.value?.selectedDate,
                                  format: 'dd MMMM yyy') ??
                              'Pilih Tanggal'),
                        ),
                        formatDateToString(dailyRecap.value?.selectedDate,
                                    format: 'yyyy-MM-dd') !=
                                formatDateToString(DateTime.now(),
                                    format: 'yyyy-MM-dd')
                            ? GestureDetector(
                                onTap: () {
                                  ref
                                      .read(dailyRecapProvider.notifier)
                                      .setSelectedDate(DateTime.now());

                                  // ref
                                  //     .read(dailyRecapProvider.notifier)
                                  //     .fetchDailyRecap(
                                  //       request: const GeneralRequestModel(
                                  //         page: 1,
                                  //       ),
                                  //     );
                                },
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
                                ref
                                    .read(dailyRecapProvider.notifier)
                                    .setSelectedDate(date);
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
            dailyRecap is AsyncLoading && dailyRecap.value?.totalData == 0
                ? const Expanded(child: DailyRecapLoadingTablet())
                : dailyRecap is AsyncError
                    ? const Center(child: Text('Error'))
                    : Expanded(
                        child: listDailyRecap.isEmpty
                            ? const Center(
                                child: Text(
                                    'Data rekapitulasi harian tidak tersedia'),
                              )
                            : Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 32),
                                child: LayoutBuilder(
                                    builder: (context, constraint) {
                                  final isTabletSmall =
                                      context.isLanscapeAndSmallerThan1000;
                                  return GridView.builder(
                                    controller: _scrollController,
                                    itemCount: listDailyRecap.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: isTabletSmall ? 2 : 4,
                                      childAspectRatio: 2,
                                      mainAxisSpacing: 16,
                                      crossAxisSpacing: 16,
                                    ),
                                    itemBuilder: (context, index) {
                                      var dailyItem = listDailyRecap[index];
                                      // if (!isTabletSmall) {
                                      //   return DailyRecapDetailContent(
                                      //     dailyRecapItem: dailyItem,
                                      //   );
                                      // }
                                      return DailyrecapItem(
                                        dailyRecapItem: dailyItem,
                                      );
                                    },
                                  );
                                }),
                              ),
                      ),
            if (dailyRecap is AsyncLoading &&
                (dailyRecap.value?.totalData ?? 0) > 0)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Center(child: CircularProgressIndicator()),
              ),
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
