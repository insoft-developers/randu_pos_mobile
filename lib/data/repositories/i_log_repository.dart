import '../../domain/entities/general_response.dart';
import '../../domain/entities/result.dart';

abstract class ILogRepository {
  // LOG EVERY PAGE
  Future<Result<GeneralResponse>> logPageVisited(String page);
}
