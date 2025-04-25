import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../data/remote/api_user_repository.dart';
import '../../../../data/repositories/i_user_repository.dart';
import '../../cores/http_client/dio_provider.dart';

part 'user_repository_provider.g.dart';

@riverpod
IUserRepository iUserRepository(IUserRepositoryRef ref) =>
    ApiUserRepository(dio: ref.watch(dioProvider));
