import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../domain/usecases/auth/logout/logout_uc.dart';
import '../../../repositories/auth_repository/auth_repository_provider.dart';

part 'logout_uc_provider.g.dart';

@riverpod
LogoutUC logoutUC(LogoutUCRef ref) {
  return LogoutUC(authentication: ref.watch(iAuthRepositoryProvider));
}
