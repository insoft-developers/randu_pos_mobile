import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../data/remote/api_cart_repository.dart';
import '../../../../data/repositories/i_cart_repository.dart';
import '../../cores/http_client/dio_provider.dart';

part 'cart_repository.g.dart';

@riverpod
ICartRepository iCartRepository(ICartRepositoryRef ref) {
  return ApiCartRepository(dio: ref.watch(dioProvider));
}
