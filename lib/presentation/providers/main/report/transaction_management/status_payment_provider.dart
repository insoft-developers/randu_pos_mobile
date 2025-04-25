import 'package:oktoast/oktoast.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../domain/entities/general_request_model.dart';
import '../../../../../domain/entities/report/transaction_management/status_payment_enum.dart';
import '../../../../../domain/entities/result.dart';
import '../../../../../domain/usecases/report/transaction_management/set_status_payment/set_status_payment_params.dart';
import '../../../../../domain/usecases/report/transaction_management/set_status_payment/set_status_payment_uc.dart';
import '../../../usecases/report/transaction_management/set_status_payment_uc_provider.dart';
import 'transaction_management_provider.dart';

part 'status_payment_provider.g.dart';

@riverpod
class StatusPayment extends _$StatusPayment {
  @override
  FutureOr<StatusPaymentEnum> build(StatusPaymentEnum initialStatus) async {
    return initialStatus;
  }

  Future<void> setStatusPayment(SetStatusPaymentParams request) async {
    state = const AsyncLoading();
    SetStatusPaymentUC setStatusPaymentUC =
        ref.read(setStatusPaymentUCProvider);
    final result = await setStatusPaymentUC(request);
    switch (result) {
      case Success():
        final message = result.value.status
            ? 'Berhasil mengubah status transaksi'
            : result.value.message ?? 'Gagal mengubah status transaksi';
        ref.read(transactionManagementProvider.notifier).resetFilter();
        ref
            .read(transactionManagementProvider.notifier)
            .fetchTransaction(request: const GeneralRequestModel(page: 1));
        showToast(message);
        state = AsyncValue.data(request.status);
        break;
      case Failed(message: String message):
        showToast(message);
        state = AsyncValue.error(message, StackTrace.current);
        break;
    }
    state = AsyncValue.data(request.status);
  }
}
