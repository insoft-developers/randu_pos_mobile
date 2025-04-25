import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../data/remote/api_transaction_repository.dart';
import '../../../../data/repositories/i_transaction_repository.dart';
import '../../cores/http_client/dio_provider.dart';

part 'transaction_repository.g.dart';

@riverpod
ITransactionRepository iTransactionRepository(ITransactionRepositoryRef ref) {
  return ApiTransactionRepository(dio: ref.watch(dioProvider));
}
