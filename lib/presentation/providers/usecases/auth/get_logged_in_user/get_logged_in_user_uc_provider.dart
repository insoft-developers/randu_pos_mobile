import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../domain/usecases/auth/get_logged_in_user/get_logged_in_user_uc.dart';
import '../../../repositories/user_repository/user_repository_provider.dart';

part 'get_logged_in_user_uc_provider.g.dart';

@riverpod
GetLoggedInUserUC getLoggedInUserUC(GetLoggedInUserUCRef ref) {
  return GetLoggedInUserUC(userRepository: ref.read(iUserRepositoryProvider));
}
