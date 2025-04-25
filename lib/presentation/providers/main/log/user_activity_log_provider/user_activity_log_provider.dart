import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../domain/entities/general_response.dart';
import '../../../usecases/log/user_activity_log/user_activity_log_uc_provider.dart';

part 'user_activity_log_provider.g.dart';

@Riverpod(keepAlive: true)
class UserActivityLog extends _$UserActivityLog {
  @override
  FutureOr<GeneralResponse?> build() {
    return null;
  }

  Future<void> userActivityLog(String page) async {
    if (!kDebugMode) {
      print('user activity log');
      final userActivityLogUC = ref.read(userActivityLogUCProvider);
      await userActivityLogUC(page);
    }
  }
}
