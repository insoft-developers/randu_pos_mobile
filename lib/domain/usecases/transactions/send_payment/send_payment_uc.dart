import 'package:flutter/foundation.dart';

import '../../../../data/repositories/i_transaction_repository.dart';
import '../../../entities/general_response.dart';
import '../../../entities/result.dart';
import '../../../entities/transaction/cart/payment/payment_response_data.dart';
import '../../../entities/transaction/cart/request/payment/payment_request_model.dart';
import '../../usecase.dart';

class SendPaymentUC
    implements
        UseCase<Result<GeneralResponse<PaymentResponseData>>,
            PaymentRequestModel> {
  final ITransactionRepository _repository;

  SendPaymentUC({required ITransactionRepository repository})
      : _repository = repository;

  @override
  Future<Result<GeneralResponse<PaymentResponseData>>> call(
      PaymentRequestModel request) async {
    var result = await _repository.sendPayment(request);
    debugPrint('request baru ${request.toJson()} ', wrapWidth: 1024);
    return result;
  }
}
