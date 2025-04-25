import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../domain/usecases/settings/check_version_app/check_version_app_uc.dart';
import '../../../repositories/settings_repository/settings_repository_provider.dart';

part 'check_version_app_uc_provider.g.dart';

@riverpod
CheckVersionAppUC checkVersionAppUC(Ref ref) {
  return CheckVersionAppUC(
      settingsRepository: ref.read(iSettingsRepositoryProvider));
}
