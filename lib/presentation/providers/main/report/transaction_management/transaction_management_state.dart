part of 'transaction_management_provider.dart';

@freezed
class TransactionManagementState with _$TransactionManagementState {
  const TransactionManagementState._();
  const factory TransactionManagementState({
    List<TransactionManagementModel>? value,
    @Default(1) int lastPage,
    @Default(1) int page,
    // @Default(0) int totalData,
    @Default(0) int totalShowed,
    int? transactionStatus,
    String? selectedDateLabel,
    String? selectedRange,
    String? startDate,
    String? endDate,
    @Default(GeneralRequestModel()) GeneralRequestModel request,
  }) = _TransactionManagementState;

  List<TransactionManagementModel> get displayedStatus {
    List<TransactionManagementModel> filteredList = value ?? [];
    if (transactionStatus != null) {
      filteredList = filteredList
          .where((element) => element.status == transactionStatus)
          .toList();
    }
    return filteredList;
  }

  int get totalData {
    return value?.length ?? 0;
  }

  bool get isLastPageReached {
    return page > lastPage;
  }
}
