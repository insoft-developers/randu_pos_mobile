import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../domain/usecases/report/transaction_management/set_status_transaction/set_transaction_status_uc.dart';
import '../../../repositories/report_repository/report_repository.dart';

part 'set_transaction_status_uc_provider.g.dart';

@riverpod
SetTransactionStatusUC setStatusTransactionUC(SetStatusTransactionUCRef ref) {
  return SetTransactionStatusUC(
      reportRepository: ref.watch(iReportRepositoryProvider));
}
