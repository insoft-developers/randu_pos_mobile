import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../domain/usecases/auth/check_pin/check_pin_uc.dart';
import '../../../repositories/auth_repository/auth_repository_provider.dart';

part 'check_pin_uc_provider.g.dart';

@riverpod
CheckPinUC checkPinUC(CheckPinUCRef ref) => CheckPinUC(
      authRepository: ref.watch(iAuthRepositoryProvider),
    );
