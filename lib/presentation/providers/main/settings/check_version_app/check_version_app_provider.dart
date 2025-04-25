import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../domain/entities/general_response.dart';
import '../../../../../domain/entities/result.dart';
import '../../../usecases/settings/check_version_app/check_version_app_uc_provider.dart';

part 'check_version_app_provider.g.dart';

@riverpod
class CheckVersionAppProvider extends _$CheckVersionAppProvider {
  @override
  Future<GeneralResponse?> build() async {
    return null;
  }

  Future<void> checkVersionApp() async {
    state = const AsyncLoading();
    final useCase = ref.read(checkVersionAppUCProvider);
    var response = await useCase(null);
    if (response is Success) {
      state = AsyncData(response.resultValue);
    } else {
      state = AsyncError(response.errorMessage!, StackTrace.current);
    }
  }
}
