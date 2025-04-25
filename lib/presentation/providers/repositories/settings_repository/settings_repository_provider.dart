import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../data/remote/api_settings_repository.dart';
import '../../../../data/repositories/i_settings_repository.dart';
import '../../cores/http_client/dio_provider.dart';

part 'settings_repository_provider.g.dart';

@riverpod
ISettingsRepository iSettingsRepository(Ref ref) {
  return ApiSettingsRepository(dio: ref.read(dioProvider));
}
