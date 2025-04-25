import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

import '../../../domain/entities/general_request_model.dart';
import '../../../domain/entities/user_model.dart';
import '../../../core/const/colors.dart';
import '../../providers/main/report/transaction_management/transaction_management_provider.dart';
import '../../widgets/core/text/custom_text.dart';
import '../../widgets/shared/header/report_header_mobile.dart';
import 'widget/date_dropdown.dart';
import 'widget/date_range_selector.dart';
import 'widget/loading/transaction_management_loading_mobile.dart';
import 'widget/status_selector.dart';
import 'widget/transaction_management_item.dart';

class TransactionManagementPageMobile extends ConsumerStatefulWidget {
  const TransactionManagementPageMobile({super.key});

  @override
  ConsumerState<TransactionManagementPageMobile> createState() =>
      _TransactionManagementPageMobileState();
}

class _TransactionManagementPageMobileState
    extends ConsumerState<TransactionManagementPageMobile> {
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
    // final user =
    //     ref.read(userDataProvider.select((value) => value.value?.user));
    final user = Hive.box<UserModel>('userBox').get('userBox');
    final displayedStatus =
        ref.watch(transactionManagementProvider).value?.displayedStatus ?? [];

    return RefreshIndicator(
      onRefresh: () async {
        ref.read(transactionManagementProvider.notifier).resetFilter();
        ref
            .read(transactionManagementProvider.notifier)
            .fetchTransaction(request: const GeneralRequestModel(page: 1));
      },
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
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
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomText(
                        'Manajemen Pesanan',
                        style: CustomTextStyle.h6Bold
                            .copyWith(color: Colors.blue[900]),
                      ),
                      const SizedBox(height: 16),
                      StatusSelector(),
                      const SizedBox(height: 16),
                      DateDropdown(),
                      const SizedBox(height: 8),
                      transactionState.value?.selectedDateLabel == 'isRangeDate'
                          ? const DateRangeSelector()
                          : const SizedBox.shrink(),
                      const SizedBox(height: 8),
                      Expanded(
                        child: transactionState is AsyncLoading &&
                                (transactionState.value?.totalData == 0)
                            ? const Center(
                                child: TransactionManagementLoadingMobile(),
                              )
                            : transactionState is AsyncError
                                ? const Center(child: Text('Error'))
                                : displayedStatus.isEmpty
                                    ? const Center(
                                        child:
                                            Text('Transaksi tidak ditemukan'))
                                    : ListView.builder(
                                        controller: _scrollController,
                                        itemCount: displayedStatus.length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 8),
                                            child: TransactionManagementItem(
                                              transaction:
                                                  displayedStatus[index],
                                              user: user,
                                              index: index,
                                            ),
                                          );
                                        },
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
      ),
    );
  }
}
