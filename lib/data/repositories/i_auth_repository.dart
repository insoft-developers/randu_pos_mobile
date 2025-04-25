import '../../domain/entities/auth/login_response_model.dart';
import '../../domain/entities/result.dart';

abstract interface class IAuthRepository {
  // WE DONT NEED THIS NOW
  Future<Result<String>> register({
    required String email,
    required String name,
    required String password,
  });

  Future<Result<LoginResponseModel>> login({
    required String email,
    required String password,
    required String tokenFcm,
  });

  Future<Result<void>> logout();

  Future<Result<bool>> checkPin({
    required String pin,
  });
}
