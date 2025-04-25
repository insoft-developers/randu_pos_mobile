import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../domain/usecases/saved_transaction/delete_saved_transaction/delete_saved_transaction_uc.dart';
import '../../../repositories/saved_repository/saved_repository.dart';

part 'delete_saved_transaction_uc_provider.g.dart';

@riverpod
DeleteSavedTransactionUC deleteSavedTransactionUC(
        DeleteSavedTransactionUCRef ref) =>
    DeleteSavedTransactionUC(repository: ref.watch(iSavedRepositoryProvider));
