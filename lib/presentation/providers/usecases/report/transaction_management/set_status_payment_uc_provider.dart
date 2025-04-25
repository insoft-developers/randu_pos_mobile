import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../domain/usecases/report/transaction_management/set_status_payment/set_status_payment_uc.dart';
import '../../../repositories/report_repository/report_repository.dart';

part 'set_status_payment_uc_provider.g.dart';

@riverpod
SetStatusPaymentUC setStatusPaymentUC(SetStatusPaymentUCRef ref) {
  return SetStatusPaymentUC(
      reportRepository: ref.watch(iReportRepositoryProvider));
}
