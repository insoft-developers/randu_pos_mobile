import '../../../../data/repositories/i_report_repository.dart';
import '../../../entities/general_request_model.dart';
import '../../../entities/result.dart';
import '../../../entities/transaction/cart/table_model.dart';
import '../../usecase.dart';

class QrTableUC
    implements UseCase<Result<List<TableModel>>, GeneralRequestModel> {
  final IReportRepository _reportRepository;

  QrTableUC({required IReportRepository reportRepository})
      : _reportRepository = reportRepository;

  @override
  Future<Result<List<TableModel>>> call(GeneralRequestModel request) async {
    return _reportRepository.getTable(request: request);
  }
}
