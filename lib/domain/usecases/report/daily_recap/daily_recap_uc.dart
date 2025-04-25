import '../../../../data/repositories/i_report_repository.dart';
import '../../../entities/general_request_model.dart';
import '../../../entities/report/daily_recap/daily_recap_model.dart';
import '../../../entities/result.dart';
import '../../usecase.dart';

class DailyRecapUC
    implements
        UseCase<Result<(List<DailyRecapModel>, int?)>, GeneralRequestModel> {
  final IReportRepository _reportRepository;

  DailyRecapUC({required IReportRepository reportRepository})
      : _reportRepository = reportRepository;

  @override
  Future<Result<(List<DailyRecapModel>, int?)>> call(
      GeneralRequestModel request) async {
    return _reportRepository.getDailyRecap(request: request);
  }
}
