import '../../domain/entities/general_response.dart';
import '../../domain/entities/result.dart';
import '../../domain/entities/transaction/cart/payment/payment_response_data.dart';
import '../../domain/entities/transaction/cart/request/payment/payment_request_model.dart';

abstract interface class ITransactionRepository {
  // OPEN TRANSACTION / SHOP
  Future<Result<GeneralResponse>> openCashier(
      {required String initialCashAmount});
  Future<Result<GeneralResponse>> closeCashier();
  Future<Result<GeneralResponse>> checkStatusCashier();
  Future<Result<GeneralResponse<PaymentResponseData>>> sendPayment(
      PaymentRequestModel request);
  Future<Result<GeneralResponse<PaymentResponseData>>> checkPaymentStatus(
      String request);
}
