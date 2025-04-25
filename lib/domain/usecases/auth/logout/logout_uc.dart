import '../../../../core/misc/init.dart';
import '../../../../data/repositories/i_auth_repository.dart';
import '../../../entities/result.dart';
import '../../usecase.dart';

class LogoutUC implements UseCase<Result<void>, void> {
  final IAuthRepository _auth;

  LogoutUC({required IAuthRepository authentication}) : _auth = authentication;

  @override
  Future<Result<void>> call(void _) async {
    print('usecase logout');
    var logout = await _auth.logout();
    if (logout is Success) {
      hiveClear();
      return const Result.success(null);
    } else {
      return Result.failed(logout.errorMessage!);
    }
  }
}
