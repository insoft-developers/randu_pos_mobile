import '../../../../entities/report/transaction_management/status_payment_enum.dart';

class SetStatusPaymentParams {
  final int transactionId;
  final StatusPaymentEnum status;

  SetStatusPaymentParams({
    required this.transactionId,
    required this.status,
  });
}
