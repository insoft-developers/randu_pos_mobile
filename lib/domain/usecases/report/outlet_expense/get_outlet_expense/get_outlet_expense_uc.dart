import '../../../../../data/repositories/i_report_repository.dart';
import '../../../../entities/general_request_model.dart';
import '../../../../entities/report/outlet_expense/outlet_expense_model.dart';
import '../../../../entities/result.dart';
import '../../../usecase.dart';

class GetOutletExpenseUC
    implements
        UseCase<Result<(List<OutletExpenseModel>, int?)>, GeneralRequestModel> {
  final IReportRepository _reportRepository;

  GetOutletExpenseUC({required IReportRepository reportRepository})
      : _reportRepository = reportRepository;

  @override
  Future<Result<(List<OutletExpenseModel>, int?)>> call(
      GeneralRequestModel request) async {
    return _reportRepository.getOutletExpense(request: request);
  }
}
