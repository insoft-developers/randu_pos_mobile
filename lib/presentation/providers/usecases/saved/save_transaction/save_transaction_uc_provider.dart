import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../domain/usecases/saved_transaction/save_transaction/save_transaction_uc.dart';
import '../../../repositories/saved_repository/saved_repository.dart';

part 'save_transaction_uc_provider.g.dart';

@riverpod
SaveTransactionUC saveTransactionUc(SaveTransactionUcRef ref) {
  return SaveTransactionUC(repository: ref.watch(iSavedRepositoryProvider));
}
