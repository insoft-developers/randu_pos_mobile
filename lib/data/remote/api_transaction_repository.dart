import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../domain/entities/general_response.dart';
import '../../domain/entities/result.dart';
import '../../domain/entities/transaction/cart/payment/payment_response_data.dart';
import '../../domain/entities/transaction/cart/request/payment/payment_request_model.dart';
import '../../domain/entities/transaction/cashier/status_cashier_model.dart';
import '../repositories/i_transaction_repository.dart';

class ApiTransactionRepository implements ITransactionRepository {
  final Dio _dio;

  ApiTransactionRepository({required Dio dio}) : _dio = dio;

  @override
  Future<Result<GeneralResponse>> openCashier(
      {required String initialCashAmount}) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      var response = await _dio.post('/open-cashier',
          data: {'initial_cash_amount': initialCashAmount});
      if (response.statusCode == 200) {
        return Result.success(GeneralResponse.fromJson(
          response.data!,
        ));
      } else {
        return Result.failed(response.data['message']);
      }
      // await Future.delayed(const Duration(seconds: 1));
      // return const Result.success(GeneralResponse(status: true, message: 'Success'));
    } catch (e) {
      return Result.failed(e.toString());
    }
  }

  @override
  Future<Result<GeneralResponse>> closeCashier() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      var response = await _dio.post('/close-cashier');
      if (response.statusCode == 200) {
        return Result.success(GeneralResponse.fromJson(
          response.data!,
        ));
      } else {
        return Result.failed(response.data['message']);
      }
      // await Future.delayed(const Duration(seconds: 2));
      // return const Result.success(GeneralResponse(status: true, message: 'Success'));
    } catch (e) {
      return Result.failed(e.toString());
    }
  }

  @override
  Future<Result<GeneralResponse<StatusCashierModel>>>
      checkStatusCashier() async {
    try {
      var response = await _dio.get('/check-status-cashier');
      if (response.statusCode == 200) {
        return Result.success(
            GeneralResponse<StatusCashierModel>.fromJsonWithData(
          response.data!,
          (model) => StatusCashierModel.fromJson(response.data['data']),
        ));
      } else {
        return Result.failed(response.data['message']);
      }
    } catch (e) {
      return Result.failed(e.toString());
    }
  }

  @override
  Future<Result<GeneralResponse<PaymentResponseData>>> sendPayment(
      PaymentRequestModel request) async {
    try {
      print('send payment on repository');
      print(request.toJson());
      var response = await _dio.post('/payment', data: request.toJson());
      if (response.statusCode == 200) {
        return Result.success(
            GeneralResponse<PaymentResponseData>.fromJsonWithData(
          response.data!,
          (model) => PaymentResponseData.fromJson(response.data['data']),
        ));
      } else {
        return Result.failed(response.data['detail']);
      }
      // await Future.delayed(const Duration(seconds: 3));
      // final examplePaymentResponse = PaymentResponseData(
      //   reference: "AK20240728203715-880074",
      //   customerId: null,
      //   paid: 47185,
      //   custName: null,
      //   status: "Process",
      //   paymentMethod: "kas",
      //   userId: 13411,
      //   diskon: 10000,
      //   shipping: 20000,
      //   orderTotal: 37000,
      //   tax: 185,
      //   updatedAt: DateTime.parse("2024-07-28T13:37:15.000000Z"),
      //   createdAt: DateTime.parse("2024-07-28T13:37:15.000000Z"),
      //   id: 11543,
      //   detail:
      //       "-Mie Anti Stres @1 Rp. 15,000<br>-Mie Goyang Variant @1 Rp. 12,000<br>",
      // );
      // return Result.success(GeneralResponse(
      //     data: examplePaymentResponse, status: true, message: "success"));
    } catch (e) {
      if (kDebugMode) {
        print('error send payment ${e.toString()}');
      }
      return Result.failed(e.toString());
    }
  }

  @override
  Future<Result<GeneralResponse<PaymentResponseData>>> checkPaymentStatus(
      String request) async {
    try {
      print('check payment status');
      var response = await _dio
          .get('/penjualan-detail', queryParameters: {'refid': request});
      print('response');
      print(response);
      if (response.statusCode == 200) {
        return Result.success(
            GeneralResponse<PaymentResponseData>.fromJsonWithData(
          response.data!,
          (model) => PaymentResponseData.fromJson(response.data['data']),
        ));
      } else {
        return Result.failed(response.data['message']);
      }
    } catch (e) {
      return Result.failed(e.toString());
    }
  }
}
