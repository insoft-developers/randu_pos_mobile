import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/const/colors.dart';
import '../../../core/utils/date_utils.dart';
import '../../../domain/entities/report/daily_recap/daily_recap_model.dart';
import '../../providers/main/report/daily_recap/daily_recap_provider.dart';
import '../../widgets/core/container/custom_rounded_container.dart';
import '../../widgets/core/text/custom_text.dart';
import '../../widgets/shared/header/report_header_mobile.dart';
import 'widget/daily_recap_detail.dart';
import 'widget/loading/daily_recap_loading_mobile.dart';

class DailyRecapPageMobile extends ConsumerStatefulWidget {
  const DailyRecapPageMobile({super.key});

  @override
  ConsumerState<DailyRecapPageMobile> createState() =>
      _DailyRecapPageMobileState();
}

class _DailyRecapPageMobileState extends ConsumerState<DailyRecapPageMobile> {
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
                        'Rekapitulasi Harian',
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
                      const SizedBox(height: 16),
                      dailyRecap is AsyncLoading &&
                              dailyRecap.value?.totalData == 0
                          ? const Expanded(child: DailyRecapLoadingMobile())
                          : dailyRecap is AsyncError
                              ? const Center(child: Text('Error'))
                              : Expanded(
                                  child: listDailyRecap.isEmpty
                                      ? const Center(
                                          child: Text(
                                              'Data rekapitulasi harian tidak tersedia'),
                                        )
                                      : ListView.separated(
                                          controller: _scrollController,
                                          itemCount: listDailyRecap.length,
                                          itemBuilder: (context, index) {
                                            DailyRecapModel dailyRecapItem =
                                                listDailyRecap[index];
                                            return DailyrecapItem(
                                                dailyRecapItem: dailyRecapItem);
                                          },
                                          separatorBuilder: (context, index) =>
                                              const SizedBox(
                                            height: 8,
                                          ),
                                        ),
                                ),
                    ],
                  ),
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
      ),
    );
  }
}

class DailyrecapItem extends StatelessWidget {
  const DailyrecapItem({
    super.key,
    required this.dailyRecapItem,
  });

  final DailyRecapModel dailyRecapItem;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        var route = MaterialPageRoute(
          builder: (context) => DailyRecapDetail(
            dailyRecapItem: dailyRecapItem,
          ),
        );

        Navigator.of(context).push(route);
      },
      child: CustomRoundedContainer(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 20,
        ),
        shadow: const [],
        border: Border.all(color: CustomColors.gray),
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
