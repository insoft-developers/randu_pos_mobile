import '../../../../data/repositories/i_user_repository.dart';
import '../../../entities/result.dart';
import '../../../entities/user_model.dart';
import '../../usecase.dart';

class GetLoggedInUserUC implements UseCase<Result<UserModel>, void> {
  final IUserRepository _userRepository;

  GetLoggedInUserUC({required IUserRepository userRepository})
      : _userRepository = userRepository;

  @override
  Future<Result<UserModel>> call(void _) async {
    final userResponse = await _userRepository.getUser();
    return userResponse;
  }
}
