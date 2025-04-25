import 'dart:developer';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../domain/entities/general_request_model.dart';
import '../../../../../domain/entities/report/transaction_management/transaction_management_model.dart';
import '../../../../../domain/entities/result.dart';
import '../../../../../domain/usecases/report/transaction_management/tansaction_management_uc.dart';
import '../../../usecases/report/transaction_management/transaction_management_uc_provider.dart';

part 'transaction_management_provider.freezed.dart';
part 'transaction_management_provider.g.dart';
part 'transaction_management_state.dart';

@riverpod
class TransactionManagement extends _$TransactionManagement {
  final String _isRangeDate = 'isRangeDate';
  @override
  FutureOr<TransactionManagementState> build() =>
      const TransactionManagementState();

  Future<void> fetchTransaction({GeneralRequestModel? request}) async {
    final page = request?.page ?? 1;
    log('status and page ${request?.transactionStatus ?? 'kosong'} $page');
    state = const AsyncLoading();
    TransactionManagementUC transactionManagementUC =
        ref.read(transactionManagementUCProvider);
    var result = await transactionManagementUC(
        request ?? state.value?.request ?? const GeneralRequestModel());
    var prev = page == 1 ? [] : state.value?.value ?? [];
    print('preeev $prev');
    switch (result) {
      case Success(value: final response):
        final (data, lastPage) = response;
        state = AsyncData(state.value!.copyWith(
          value: [...prev, ...data],
          lastPage: lastPage ?? 1,
        ));
      case Failed(message: _):
        state = const AsyncData(TransactionManagementState());
    }
  }

  void incrementPage() {
    state = AsyncData(state.value!.copyWith(page: state.value!.page + 1));
  }

  void resetPage() {
    state = AsyncData(state.value!.copyWith(page: 1));
  }

  void setDateLabel(String label) {
    state = AsyncData(state.value!.copyWith(selectedDateLabel: label));
  }

  void setRange(String range) {
    state = AsyncData(state.value!.copyWith(selectedRange: range));
  }

  void setTransactionStatus(int? status) {
    state = AsyncData(state.value!.copyWith(transactionStatus: status));
  }

  void setStartDate(String date) {
    state = AsyncData(state.value!.copyWith(startDate: date));
  }

  void setEndDate(String date) {
    state = AsyncData(state.value!.copyWith(endDate: date));
  }

  void resetFilter() {
    state = AsyncData(state.value!.copyWith(
      value: [],
      transactionStatus: null,
      selectedDateLabel: '',
      selectedRange: '',
      startDate: null,
      endDate: null,
      page: 1,
      lastPage: 1,
    ));
  }

  void fetchNextPage({bool fromScroll = false}) {
    if (state case AsyncLoading()) return;
    // state = const AsyncLoading();

    print('fetch next page');

    if (fromScroll) {
      incrementPage();
    }

    final selectedRange = state.value?.selectedRange;
    final transactionStatus = state.value?.transactionStatus;

    String? range =
        selectedRange == null || selectedRange.isEmpty ? null : selectedRange;

    var baseRequest = GeneralRequestModel(page: state.value?.page ?? 1);

    var request = range == null
        ? baseRequest
        : range == _isRangeDate
            ? baseRequest.copyWith(
                selectedRange: range,
                startDate: state.value?.startDate,
                endDate: state.value?.endDate,
              )
            : baseRequest.copyWith(selectedRange: range);

    if (transactionStatus != null) {
      request = request.copyWith(transactionStatus: transactionStatus);
    }

    fetchTransaction(request: request);
  }

  void onStatusChanged(int? status) async {
    print('onStatusChanged $status');
    state = const AsyncLoading();

    setTransactionStatus(status);
    resetPage();
    fetchNextPage();
  }

  void resetValue() {
    state = AsyncData(state.value!.copyWith(value: [], page: 1, lastPage: 1));
  }

  void onDateSelected(
      {required DateTime date, bool isStartDate = false}) async {
    var newDate =
        '${date.year}-${date.month < 10 ? "0${date.month}" : date.month}-${date.day < 10 ? "0${date.day}" : date.day}';

    isStartDate ? setStartDate(newDate) : setEndDate(newDate);
    if (state.value?.endDate != null) {
      state = AsyncData(state.value!.copyWith(value: []));
      state = const AsyncLoading();
      await fetchTransaction(
        request: GeneralRequestModel(
          page: 1,
          selectedRange: _isRangeDate,
          startDate: state.value?.startDate,
          endDate: state.value?.endDate,
        ),
      );
    }
  }

  void onDateChange(String? value) {
    state = AsyncData(state.value!.copyWith(value: []));
    ref.read(transactionManagementProvider.notifier).setDateLabel(value ?? '');
    ref.read(transactionManagementProvider.notifier).setRange(value!);
    ref.read(transactionManagementProvider.notifier).resetPage();
    if (value != _isRangeDate) {
      ref.read(transactionManagementProvider.notifier).fetchTransaction(
            request: GeneralRequestModel(
              page: 1,
              selectedRange: value,
              transactionStatus: state.value?.transactionStatus,
            ),
          );
    } else {
      ref.read(transactionManagementProvider.notifier).fetchTransaction(
            request: GeneralRequestModel(
              page: 1,
              selectedRange: state.value?.selectedRange,
            ),
          );
    }
  }
}
