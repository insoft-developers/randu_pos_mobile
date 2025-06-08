import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../domain/entities/general_response.dart';
import '../../../../../domain/entities/result.dart';
import '../../../../../domain/entities/transaction/cart/payment/payment_response_data.dart';
import '../../../../../domain/entities/transaction/cart/request/payment/payment_request_model.dart';
import '../../../../../domain/usecases/transactions/send_payment/send_payment_uc.dart';
import '../../../usecases/transaction/send_payment/send_payment_uc_provider.dart';

part 'send_payment_provider.freezed.dart';
part 'send_payment_provider.g.dart';
part 'send_payment_state.dart';

@riverpod
class SendPayment extends _$SendPayment {
  @override
  Future<GeneralResponse<PaymentResponseData>?> build() async {
    return null;
  }

  Future<void> sendPayment(PaymentRequestModel request) async {
    // debugPrint('request baru ${request.toJson()} ', wrapWidth: 1024);
    // return;
    print('send payment');
    state = const AsyncLoading();
    SendPaymentUC sendPaymentUC = ref.read(sendPaymentUCProvider);
    print('send payment uc');

    var result = await sendPaymentUC(request);
    print('send payment result');
    print(result.resultValue);
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
