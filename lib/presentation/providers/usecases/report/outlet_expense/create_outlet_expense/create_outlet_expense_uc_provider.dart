import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../domain/usecases/report/outlet_expense/create_outlet_expense/create_outlet_expense_uc.dart';
import '../../../../repositories/report_repository/report_repository.dart';

part 'create_outlet_expense_uc_provider.g.dart';

@riverpod
CreateOutletExpenseUC createOutletExpenseUC(CreateOutletExpenseUCRef ref) {
  return CreateOutletExpenseUC(
      reportRepository: ref.watch(iReportRepositoryProvider));
}
