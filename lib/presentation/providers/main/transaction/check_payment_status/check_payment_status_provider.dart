import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../domain/entities/general_response.dart';
import '../../../../../domain/entities/result.dart';
import '../../../../../domain/usecases/transactions/check_payment_status/check_payment_status_uc.dart';
import '../../../usecases/transaction/check_payment_status/check_payment_status_uc.dart';

part 'check_payment_status_provider.freezed.dart';
part 'check_payment_status_provider.g.dart';
part 'check_payment_status_state.dart';

@riverpod
class CheckPaymentStatus extends _$CheckPaymentStatus {
  @override
  Future<GeneralResponse?> build() async {
    return null;
  }

  Future<void> checkPaymentStatus(String request) async {
    state = const AsyncLoading();
    CheckPaymentStatusUC checkPaymentStatusUC =
        ref.read(checkPaymentStatusUCProvider);
    var result = await checkPaymentStatusUC(request);
    print(result);
    if (result is Success) {
      print('result success');
      state = AsyncData(result.resultValue!);
      return;
    } else {
      print('result error');
      state = AsyncError(result.errorMessage!, StackTrace.current);
      return;
      // state = AsyncData(state.valueOrNull);
    }
  }
}
