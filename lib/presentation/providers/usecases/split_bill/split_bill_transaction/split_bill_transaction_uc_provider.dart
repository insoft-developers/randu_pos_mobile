import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../domain/usecases/split_bill/split_bill_transaction/split_bill_transaction_uc.dart';
import '../../../repositories/saved_repository/saved_repository.dart';

part 'split_bill_transaction_uc_provider.g.dart';

@riverpod
SplitBillTransactionUC splitBillTransactionUc(Ref ref) {
  return SplitBillTransactionUC(
    repository: ref.read(iSavedRepositoryProvider),
  );
}
