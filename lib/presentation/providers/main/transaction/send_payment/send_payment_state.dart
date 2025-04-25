part of 'send_payment_provider.dart';

@freezed
class SendPaymentState with _$SendPaymentState {
  const factory SendPaymentState({
    GeneralResponse<PaymentResponseData>? response,
  }) = _SendPaymentState;
}
