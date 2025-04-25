import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../domain/usecases/saved_transaction/get_saved_transactions/get_saved_transactions_uc.dart';
import '../../../repositories/saved_repository/saved_repository.dart';

part 'get_saved_transactions_uc_provider.g.dart';

@riverpod
GetSavedTransactionsUC getSavedTransactionsUC(GetSavedTransactionsUCRef ref) {
  return GetSavedTransactionsUC(
      repository: ref.watch(iSavedRepositoryProvider));
}
