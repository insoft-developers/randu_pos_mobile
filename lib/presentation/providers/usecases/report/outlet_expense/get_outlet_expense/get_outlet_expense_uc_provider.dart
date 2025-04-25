import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../domain/usecases/report/outlet_expense/get_outlet_expense/get_outlet_expense_uc.dart';
import '../../../../repositories/report_repository/report_repository.dart';

part 'get_outlet_expense_uc_provider.g.dart';

@riverpod
GetOutletExpenseUC getOutletExpenseUC(GetOutletExpenseUCRef ref) {
  return GetOutletExpenseUC(
      reportRepository: ref.watch(iReportRepositoryProvider));
}
