part of 'get_outlet_expense_provider.dart';

@freezed
class GetOutletExpenseState with _$GetOutletExpenseState {
  const GetOutletExpenseState._();
  const factory GetOutletExpenseState({
    GeneralRequestModel? request,
    List<OutletExpenseModel>? value,
    int? lastPage,
    @Default(1) int page,
    String? selectedMonth,
    String? selectedYear,
  }) = _GetOutletExpenseState;

  int get totalData => value?.length ?? 0;
  bool get isLastPageReached => page == lastPage;
}
