import 'package:hive_ce_flutter/hive_flutter.dart';

import '../../../../data/repositories/i_auth_repository.dart';
import '../../../entities/result.dart';
import '../../usecase.dart';

class CheckPinUC implements UseCase<Result<bool>, String> {
  final IAuthRepository _authRepository;

  CheckPinUC({required IAuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<Result<bool>> call(String params) async {
    print('usecase check pin');
    var result = await _authRepository.checkPin(pin: params);
    if (result is Success) {
      Hive.box<bool>('is_locked').put('is_locked', false);
    }
    return switch (result) {
      Success() => Result.success(result.resultValue!),
      Failed(:final message) => Result.failed(message),
    };
  }
}
