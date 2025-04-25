import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../data/remote/api_auth_repository.dart';
import '../../../../data/repositories/i_auth_repository.dart';
import '../../cores/http_client/dio_provider.dart';

part 'auth_repository_provider.g.dart';

@riverpod
IAuthRepository iAuthRepository(IAuthRepositoryRef ref) =>
    ApiAuthRepository(dio: ref.watch(dioProvider));
