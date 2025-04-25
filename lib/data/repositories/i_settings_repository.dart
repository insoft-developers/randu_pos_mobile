import '../../domain/entities/general_response.dart';
import '../../domain/entities/result.dart';

abstract class ISettingsRepository {
  // CHECK VERSION APPS
  Future<Result<GeneralResponse>> checkVersionApp();
}
