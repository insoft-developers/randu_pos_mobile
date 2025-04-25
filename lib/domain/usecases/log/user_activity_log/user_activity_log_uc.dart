import '../../../../data/repositories/i_log_repository.dart';
import '../../../entities/general_response.dart';
import '../../../entities/result.dart';
import '../../usecase.dart';

class UserActivityLogUC implements UseCase<Result<GeneralResponse>, String> {
  final ILogRepository _logRepository;

  UserActivityLogUC({required ILogRepository logRepository})
      : _logRepository = logRepository;

  @override
  Future<Result<GeneralResponse>> call(String page) async {
    final response = _logRepository.logPageVisited(page);
    return response;
  }
}
