import '../../../../data/repositories/i_settings_repository.dart';
import '../../../entities/general_response.dart';
import '../../../entities/result.dart';
import '../../usecase.dart';

class CheckVersionAppUC implements UseCase<Result<GeneralResponse>, void> {
  final ISettingsRepository _settingsRepository;
  CheckVersionAppUC({required ISettingsRepository settingsRepository})
      : _settingsRepository = settingsRepository;

  @override
  Future<Result<GeneralResponse>> call(void _) async {
    return _settingsRepository.checkVersionApp();
  }
}
