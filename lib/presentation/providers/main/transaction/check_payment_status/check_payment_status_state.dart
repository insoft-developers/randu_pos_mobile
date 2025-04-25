part of 'check_payment_status_provider.dart';

@freezed
class CheckPaymentStatusState with _$CheckPaymentStatusState {
  const factory CheckPaymentStatusState({
    GeneralResponse? response,
    @Default(false) bool isExpired,
  }) = _CheckPaymentStatusState;
}
