import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../domain/usecases/report/transaction_management/tansaction_management_uc.dart';
import '../../../repositories/report_repository/report_repository.dart';

part 'transaction_management_uc_provider.g.dart';

@riverpod
TransactionManagementUC transactionManagementUC(
    TransactionManagementUCRef ref) {
  return TransactionManagementUC(
      reportRepository: ref.watch(iReportRepositoryProvider));
}
