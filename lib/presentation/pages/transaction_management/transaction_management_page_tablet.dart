import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce/hive.dart';

import '../../../core/const/colors.dart';
import '../../../domain/entities/user_model.dart';
import '../../providers/main/report/transaction_management/transaction_management_provider.dart';
import '../../widgets/core/text/custom_text.dart';
import '../../widgets/shared/header/report_header_tablet.dart';
import 'widget/date_dropdown.dart';
import 'widget/date_range_selector.dart';
import 'widget/loading/transaction_management_loading_tablet.dart';
import 'widget/status_selector.dart';
import 'widget/transaction_management_item.dart';

enum SelectedRange {
  isToday,
  isYesterday,
  isThisWeek,
  isLastWeek,
  isThisMonth,
  isLastMonth,
  isThisYear,
  isLastYear,
  isRangeDate,
}

class TransactionManagementPageTablet extends ConsumerStatefulWidget {
  const TransactionManagementPageTablet({super.key});

  @override
  ConsumerState<TransactionManagementPageTablet> createState() =>
      _TransactionManagementPageTabletState();
}

class _TransactionManagementPageTabletState
    extends ConsumerState<TransactionManagementPageTablet> {
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
      final isLastPageReached =
          ref.read(transactionManagementProvider).value?.isLastPageReached ??
              false;
      if (isLastPageReached) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Semua data telah ditampilkan')));
      }
      ref
          .read(transactionManagementProvider.notifier)
          .fetchNextPage(fromScroll: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final transactionState = ref.watch(transactionManagementProvider);
    final user = Hive.box<UserModel>('userBox').get('userBox');

    final displayedStatus =
        ref.watch(transactionManagementProvider).value?.displayedStatus ?? [];
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomText(
                      'Manajemen Pesanan',
                      style: CustomTextStyle.h6Bold
                          .copyWith(color: Colors.blue[900]),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        StatusSelector(),
                        const SizedBox(width: 32),
                        const Spacer(),
                        transactionState.value?.selectedDateLabel ==
                                'isRangeDate'
                            ? const SizedBox(
                                width: 320, child: DateRangeSelector())
                            : const SizedBox.shrink(),
                        const SizedBox(width: 16),
                        SizedBox(width: 250, child: DateDropdown()),
                      ],
                    ),
                    const SizedBox(height: 16),
                    transactionState is AsyncLoading &&
                            (transactionState.value?.totalData == 0)
                        ? const Expanded(
                            child: TransactionManagementLoadingTablet())
                        : transactionState is AsyncError
                            ? const Center(child: Text('Error'))
                            : Expanded(
                                child: displayedStatus.isEmpty
                                    ? const Center(
                                        child:
                                            Text('Transaksi tidak ditemukan'),
                                      )
                                    : GridView.builder(
                                        controller: _scrollController,
                                        shrinkWrap: true,
                                        itemCount: displayedStatus.length,
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 3,
                                                crossAxisSpacing: 16,
                                                mainAxisSpacing: 16,
                                                childAspectRatio: 3.1),
                                        itemBuilder: (context, index) =>
                                            TransactionManagementItem(
                                                transaction:
                                                    displayedStatus[index],
                                                user: user),
                                      ),
                              ),
                  ],
                ),
              ),
            ),
            if (transactionState is AsyncLoading &&
                (transactionState.value?.totalData ?? 0) > 0)
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
