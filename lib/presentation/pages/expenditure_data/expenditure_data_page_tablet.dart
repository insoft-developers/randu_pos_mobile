import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/general_request_model.dart';
import '../../../domain/entities/report/outlet_expense/outlet_expense_model.dart';
import '../../../core/const/colors.dart';
import '../../../core/utils/currency_utils.dart';
import '../../../core/utils/date_utils.dart';
import '../../providers/main/report/outlet_expense/get_outlet_expense/get_outlet_expense_provider.dart';
import '../../widgets/core/container/custom_rounded_container.dart';
import '../../widgets/core/text/custom_text.dart';
import '../../widgets/shared/header/report_header_mobile.dart';
import 'widget/loading/expenditure_data_loading_tablet.dart';

class ExpenditureDataPageTablet extends ConsumerStatefulWidget {
  const ExpenditureDataPageTablet({super.key});

  @override
  ConsumerState<ExpenditureDataPageTablet> createState() =>
      _ExpenditureDataPageTabletState();
}

class _ExpenditureDataPageTabletState
    extends ConsumerState<ExpenditureDataPageTablet> {
  final ScrollController _scrollController = ScrollController();

  List<Map<String, String>> months = [
    {'value': '01', 'content': 'Januari'},
    {'value': '02', 'content': 'Februari'},
    {'value': '03', 'content': 'Maret'},
    {'value': '04', 'content': 'April'},
    {'value': '05', 'content': 'Mei'},
    {'value': '06', 'content': 'Juni'},
    {'value': '07', 'content': 'Juli'},
    {'value': '08', 'content': 'Agustus'},
    {'value': '09', 'content': 'September'},
    {'value': '10', 'content': 'Oktober'},
    {'value': '11', 'content': 'November'},
    {'value': '12', 'content': 'Desember'},
  ];

  List<String> years = [];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);

    var date = DateTime.now();
    int startingYear = 2014;

    var listYear = <String>[];
    for (int year = date.year; year >= startingYear; year--) {
      listYear.add(year.toString());
    }

    setState(() {
      years = listYear;
    });
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
      final expense = ref.read(getOutletExpenseProvider);

      ref.read(getOutletExpenseProvider.notifier).fetchNextPage();
      if (expense.value?.isLastPageReached ?? false) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Semua data telah ditampilkan'),
            duration: Durations.long1,
          ),
        );
      } else {
        ref.read(getOutletExpenseProvider.notifier).fetchNextPage();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final expenseProvider = ref.watch(getOutletExpenseProvider);
    List<OutletExpenseModel> expenseList = expenseProvider.value?.value ?? [];

    return Stack(
      children: [
        Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              color: CustomColors.primaryColor,
              child: const Column(
                children: [
                  SizedBox(
                    height: 12,
                  ),
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CustomText(
                            'Data Pengeluaran Outlet',
                            style: CustomTextStyle.h6Bold
                                .copyWith(color: Colors.blue[900]),
                          ),
                          const Spacer(),
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  child: CustomRoundedContainer(
                                    shadow: const [],
                                    radius: 0,
                                    border: Border.all(
                                        color: CustomColors.darkGray),
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 4, 8, 8),
                                    child: DropdownButton(
                                      isExpanded: true,
                                      isDense: true,
                                      hint: const Text('Pilih Bulan'),
                                      borderRadius: BorderRadius.circular(4),
                                      alignment: Alignment.centerLeft,
                                      focusColor: CustomColors.primaryColor,
                                      padding:
                                          const EdgeInsets.fromLTRB(8, 8, 8, 0),
                                      icon: const Padding(
                                        padding: EdgeInsets.only(left: 8),
                                        child: Icon(Icons.calendar_month),
                                      ),
                                      iconSize: 20,
                                      value:
                                          expenseProvider.value?.selectedMonth,
                                      items: months.map((e) {
                                        return DropdownMenuItem(
                                          value: e['value'],
                                          child: Text(e['content'] ?? '',
                                              style:
                                                  CustomTextStyle.productName),
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        if (expenseProvider
                                                    .value?.selectedYear !=
                                                null &&
                                            value != null) {
                                          ref
                                              .read(getOutletExpenseProvider
                                                  .notifier)
                                              .fetchExpenses(
                                                request: GeneralRequestModel(
                                                  page: 1,
                                                  bulan: value,
                                                  tahun: expenseProvider
                                                      .value?.selectedYear,
                                                ),
                                              );
                                        }
                                        ref
                                            .read(getOutletExpenseProvider
                                                .notifier)
                                            .setSelectedMonth(value);
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: CustomRoundedContainer(
                                    shadow: const [],
                                    radius: 0,
                                    border: Border.all(
                                        color: CustomColors.darkGray),
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 4, 8, 8),
                                    child: DropdownButton(
                                      isExpanded: true,
                                      isDense: true,
                                      hint: const Text('Pilih Tahun'),
                                      borderRadius: BorderRadius.circular(4),
                                      alignment: Alignment.centerLeft,
                                      focusColor: CustomColors.primaryColor,
                                      padding:
                                          const EdgeInsets.fromLTRB(8, 8, 8, 0),
                                      icon: const Padding(
                                        padding: EdgeInsets.only(left: 8),
                                        child: Icon(Icons.calendar_month),
                                      ),
                                      iconSize: 20,
                                      value:
                                          expenseProvider.value?.selectedYear,
                                      items: years.map((e) {
                                        return DropdownMenuItem(
                                          value: e,
                                          child: Text(e,
                                              style:
                                                  CustomTextStyle.productName),
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        if (expenseProvider
                                                    .value?.selectedMonth !=
                                                null &&
                                            value != null) {
                                          ref
                                              .read(getOutletExpenseProvider
                                                  .notifier)
                                              .fetchExpenses(
                                                request: GeneralRequestModel(
                                                  page: 1,
                                                  bulan: expenseProvider
                                                      .value?.selectedMonth,
                                                  tahun: value,
                                                ),
                                              );
                                        }
                                        ref
                                            .read(getOutletExpenseProvider
                                                .notifier)
                                            .setSelectedYear(value);
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    expenseProvider is AsyncLoading &&
                            expenseProvider.value?.totalData == 0
                        ? const Expanded(child: ExpenditureDataLoadingTablet())
                        : expenseProvider is AsyncError
                            ? const Center(child: Text('Error'))
                            : Expanded(
                                child: expenseList.isEmpty
                                    ? const Center(
                                        child: Text(
                                            'Data pengeluaran tidak tersedia'),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 0),
                                        child: GridView.builder(
                                          controller: _scrollController,
                                          itemCount: expenseList.length,
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            childAspectRatio: 4,
                                            mainAxisSpacing: 16,
                                            crossAxisSpacing: 16,
                                          ),
                                          itemBuilder: (context, index) {
                                            var expense = expenseList[index];
                                            return ExpenseItem(
                                                expense: expense);
                                          },
                                        ),
                                      ),
                              )
                  ],
                ),
              ),
            ),
            if (expenseProvider is AsyncLoading &&
                (expenseProvider.value?.totalData ?? 0) > 0)
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

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expense});
  final OutletExpenseModel expense;

  @override
  Widget build(BuildContext context) {
    return CustomRoundedContainer(
      border: Border.all(color: CustomColors.gray),
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 24,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                formatDateToString(expense.createdAt,
                        format: 'dd MMMM yyyy hh:mm') ??
                    '',
                style: CustomTextStyle.lightComponentsBadgeLabelBold,
              ),
              const SizedBox(height: 4),
              CustomText(
                expense.name ?? '',
                style: CustomTextStyle.body2AndHalf.copyWith(
                  fontSize: 15,
                ),
              )
            ],
          ),
          CustomText(
            formatStringIDRToCurrency(
                text: '${expense.amount ?? 0}', symbol: 'Rp '),
            style: CustomTextStyle.productName.copyWith(
              color: Colors.red[800],
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
