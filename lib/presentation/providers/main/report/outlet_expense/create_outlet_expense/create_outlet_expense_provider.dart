import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../domain/entities/general_response.dart';
import '../../../../../../domain/entities/result.dart';
import '../../../../../../domain/usecases/report/outlet_expense/create_outlet_expense/create_outlet_expense_uc.dart';
import '../../../../usecases/report/outlet_expense/create_outlet_expense/create_outlet_expense_uc_provider.dart';

part 'create_outlet_expense_provider.g.dart';

@riverpod
class CreateOutletExpense extends _$CreateOutletExpense {
  @override
  FutureOr<GeneralResponse?> build() {
    return null;
  }

  Future<void> createOutletExpense(CreateOutletExpenseParams params) async {
    state = const AsyncLoading();
    CreateOutletExpenseUC createOutletExpenseUC =
        ref.read(createOutletExpenseUCProvider);
    final result = await createOutletExpenseUC(params);
    switch (result) {
      case Success():
        state = AsyncData(result.resultValue);
      // break;
      case Failed(message: String message):
        state = AsyncError(message, StackTrace.current);
      // break;
    }
  }
}
