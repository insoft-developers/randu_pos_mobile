import '../../../../data/repositories/i_report_repository.dart';
import '../../../entities/general_request_model.dart';
import '../../../entities/report/transaction_management/transaction_management_model.dart';
import '../../../entities/result.dart';
import '../../usecase.dart';

class TransactionManagementUC
    implements
        UseCase<Result<(List<TransactionManagementModel>, int?)>,
            GeneralRequestModel> {
  final IReportRepository _reportRepository;

  TransactionManagementUC({required IReportRepository reportRepository})
      : _reportRepository = reportRepository;

  @override
  Future<Result<(List<TransactionManagementModel>, int?)>> call(
      GeneralRequestModel request) async {
    var tansactions =
        await _reportRepository.getTransactionManagement(request: request);
    return tansactions;
  }
}
