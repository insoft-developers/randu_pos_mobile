import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../data/remote/api_log_repository.dart';
import '../../../../../data/repositories/i_log_repository.dart';
import '../../../cores/http_client/dio_provider.dart';

part 'log_repository_provider.g.dart';

@riverpod
ILogRepository iLogRepository(ILogRepositoryRef ref) {
  return ApiLogRepository(dio: ref.read(dioProvider));
}
