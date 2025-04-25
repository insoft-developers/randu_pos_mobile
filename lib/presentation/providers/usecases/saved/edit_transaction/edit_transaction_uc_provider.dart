import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../domain/usecases/saved_transaction/edit_saved_transaction/edit_transaction_uc.dart';
import '../../../repositories/saved_repository/saved_repository.dart';

part 'edit_transaction_uc_provider.g.dart';

@riverpod
EditTransactionUC editTransactionUc(Ref ref) {
  return EditTransactionUC(repository: ref.read(iSavedRepositoryProvider));
}