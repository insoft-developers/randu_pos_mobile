import 'package:hive_ce_flutter/hive_flutter.dart';

import '../../../../data/repositories/i_auth_repository.dart';
import '../../../../data/repositories/i_user_repository.dart';
import '../../../entities/result.dart';
import '../../../entities/user_model.dart';
import '../../usecase.dart';

part 'login_params.dart';

class LoginUC implements UseCase<Result<UserModel>, LoginParams> {
  final IAuthRepository authRepository;
  final IUserRepository userRepository;

  LoginUC({required this.authRepository, required this.userRepository});
  @override
  Future<Result<UserModel>> call(LoginParams params) async {
    print('login use case');
    var loginResponse = await authRepository.login(
        email: params.email,
        password: params.password,
        tokenFcm: params.tokenFcm ?? '');
    if (loginResponse is Success) {
      print('login user');
      final token = Hive.box<String>('token');
      token.put('token', loginResponse.resultValue!.token!);
      return switch (loginResponse) {
        Success(value: final loginResponse) =>
          Result.success(loginResponse.userModel!),
        Failed(:final message) => Result.failed(message),
      };
    } else {
      return Result.failed(loginResponse.errorMessage ?? 'Error');
    }
  }
}
