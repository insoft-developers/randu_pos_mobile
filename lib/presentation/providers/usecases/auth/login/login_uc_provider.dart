import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../domain/usecases/auth/login/login_uc.dart';
import '../../../repositories/auth_repository/auth_repository_provider.dart';
import '../../../repositories/user_repository/user_repository_provider.dart';

part 'login_uc_provider.g.dart';

@riverpod
LoginUC loginUC(LoginUCRef ref) {
  return LoginUC(
      authRepository: ref.watch(iAuthRepositoryProvider),
      userRepository: ref.watch(iUserRepositoryProvider));
}
