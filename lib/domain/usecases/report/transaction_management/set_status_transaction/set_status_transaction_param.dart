import '../../../../entities/report/transaction_management/status_transaction_enum.dart';

class SetStatusTransactionParam {
  final int transactionId;
  final StatusTransactionEnum status;

  SetStatusTransactionParam(
      {required this.transactionId, required this.status});
}
