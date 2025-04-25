import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../domain/usecases/log/user_activity_log/user_activity_log_uc.dart';
import '../../../repositories/log/user_activity_log/log_repository_provider.dart';

part 'user_activity_log_uc_provider.g.dart';

@riverpod
UserActivityLogUC userActivityLogUC(UserActivityLogUCRef ref) {
  return UserActivityLogUC(logRepository: ref.watch(iLogRepositoryProvider));
}
