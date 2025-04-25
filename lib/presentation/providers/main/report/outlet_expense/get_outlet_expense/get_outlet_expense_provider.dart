import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../domain/entities/general_request_model.dart';
import '../../../../../../domain/entities/report/outlet_expense/outlet_expense_model.dart';
import '../../../../../../domain/entities/result.dart';
import '../../../../../../domain/usecases/report/outlet_expense/get_outlet_expense/get_outlet_expense_uc.dart';
import '../../../../usecases/report/outlet_expense/get_outlet_expense/get_outlet_expense_uc_provider.dart';

part 'get_outlet_expense_provider.freezed.dart';
part 'get_outlet_expense_provider.g.dart';
part 'get_outlet_expense_state.dart';

@riverpod
class GetOutletExpense extends _$GetOutletExpense {
  @override
  FutureOr<GetOutletExpenseState> build() => const GetOutletExpenseState();

  Future<void> fetchExpenses({GeneralRequestModel? request}) async {
    final page = request?.page ?? 1;

    state = const AsyncLoading();
    GetOutletExpenseUC getOutletExpenseUC =
        ref.read(getOutletExpenseUCProvider);
    var result = await getOutletExpenseUC(
        request ?? state.value?.request ?? const GeneralRequestModel());
    print(result);
    var prev = page == 1 ? [] : state.value?.value ?? [];
    switch (result) {
      case Success(value: final response):
        final (data, lastPage) = response;
        state = AsyncData(state.value!
            .copyWith(value: [...prev, ...data], lastPage: lastPage));
      case Failed(message: _):
        state = const AsyncData(GetOutletExpenseState());
    }
  }

  void incrementPage() {
    state = AsyncData(state.value!.copyWith(page: state.value!.page + 1));
  }

  void setSelectedMonth(String? month) {
    state = AsyncData(state.value!.copyWith(selectedMonth: month));
  }

  void setSelectedYear(String? year) {
    state = AsyncData(state.value!.copyWith(selectedYear: year));
  }

  void fetchNextPage() {
    if (state is AsyncLoading) return;

    incrementPage();
    fetchExpenses(request: GeneralRequestModel(page: state.value?.page ?? 1));
  }

  void resetState() {
    state = const AsyncData(GetOutletExpenseState());
  }
}
