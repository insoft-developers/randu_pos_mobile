import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../domain/entities/general_request_model.dart';
import '../../domain/entities/general_response.dart';
import '../../domain/entities/report/daily_recap/daily_recap_model.dart';
import '../../domain/entities/report/outlet_expense/outlet_expense_model.dart';
import '../../domain/entities/report/qr_table/table_status_enum.dart';
import '../../domain/entities/report/transaction_management/status_payment_enum.dart';
import '../../domain/entities/report/transaction_management/status_transaction_enum.dart';
import '../../domain/entities/report/transaction_management/transaction_management_model.dart';
import '../../domain/entities/result.dart';
import '../../domain/entities/transaction/cart/table_model.dart';
import '../repositories/i_report_repository.dart';

class ApiReportRepository implements IReportRepository {
  final Dio _dio;

  ApiReportRepository({required Dio dio}) : _dio = dio;

  @override
  Future<Result<(List<TransactionManagementModel>, int?)>>
      getTransactionManagement({required GeneralRequestModel request}) async {
    try {
      var response =
          await _dio.get('/manage-pesanan', queryParameters: request.toJson());
      if (response.statusCode == 200) {
        final Map<String, dynamic> parsedJson =
            json.decode(json.encode(response.data));
        final List<dynamic> transactionJsonList = parsedJson['data']['data'];
        int? lastPage = parsedJson['data']['last_page'];
        final List<TransactionManagementModel> transactions =
            transactionJsonList
                .map((json) => TransactionManagementModel.fromJson(
                    json as Map<String, dynamic>))
                .toList();

        return Result.success((transactions, lastPage));
      } else {
        return Result.failed(response.data['message']);
      }
    } catch (e) {
      if (kDebugMode) {
        print('error get transaction management ${e.toString()}');
      }
      return Result.failed(e.toString());
    }
  }

  @override
  Future<Result<(List<DailyRecapModel>, int?)>> getDailyRecap(
      {required GeneralRequestModel request}) async {
    try {
      var response = await _dio.get('/rekapitulasi-harian',
          queryParameters: request.toJson());
      print(response);

      if (response.statusCode == 200) {
        final Map<String, dynamic> parsedJson =
            json.decode(json.encode(response.data));
        final List<dynamic> transactionJsonList = parsedJson['data']['data'];
        final int? lastPage = parsedJson['data']['last_page'];
        final List<DailyRecapModel> transactions = transactionJsonList
            .map((json) =>
                DailyRecapModel.fromJson(json as Map<String, dynamic>))
            .toList();

        return Result.success((transactions, lastPage));
      } else {
        return Result.failed(response.data['message']);
      }
    } catch (e) {
      if (kDebugMode) {
        print('error get user ${e.toString()}');
      }
      return Result.failed(e.toString());
    }
  }

  @override
  Future<Result<List<TableModel>>> getTable(
      {required GeneralRequestModel request}) async {
    try {
      var queryParams = request.toJson();

      var response =
          await _dio.get('/qr-code-meja', queryParameters: queryParams);

      if (response.statusCode == 200) {
        final parsedJson = response.data as Map<String, dynamic>;
        final List<TableModel> tables = [];

        if (parsedJson.containsKey('data')) {
          if (parsedJson['data'] is Map<String, dynamic>) {
            // Case 1: `data` is a map with pagination
            final List<dynamic> productJsonList =
                parsedJson['data']['data'] ?? [];
            tables.addAll(productJsonList
                .map(
                    (json) => TableModel.fromJson(json as Map<String, dynamic>))
                .toList());
          } else if (parsedJson['data'] is List) {
            // Case 2: `data` is a list of items directly
            tables.addAll((parsedJson['data'] as List)
                .map(
                    (json) => TableModel.fromJson(json as Map<String, dynamic>))
                .toList());
          } else {
            throw Exception(
                'Unexpected data type in response: ${parsedJson['data'].runtimeType}');
          }
        } else {
          throw Exception('`data` key not found in response: ${response.data}');
        }

        return Result.success(tables);
      } else {
        print('() error get tables ${response.data}');
        return Result.failed(
          response.data['message'] ??
              'Failed to fetch tables. Please try again.',
        );
      }
    } catch (e) {
      if (kDebugMode) {
        log('Error fetching tables: ${e.runtimeType} - ${e.toString()}');
      }
      return Result.failed('Error fetching tables: ${e.toString()}');
    }
  }

  @override
  Future<Result<GeneralResponse>> createOutletExpense(
      {required int amount, required String name}) async {
    try {
      print('create pengeluaran $name $amount');
      var response = await _dio
          .post('/pengeluaran', data: {'amount': amount, 'name': name});
      print('create pengeluaran response $response');
      if (response.statusCode == 200) {
        return Result.success(GeneralResponse.fromJson(response.data));
      } else {
        return const Result.failed('Gagal menambahkan pengeluaran');
      }
    } catch (e) {
      if (kDebugMode) {
        print('login error $e');
      }
      return const Result.failed('Gagal menambahkan pengeluaran');
    }
  }

  @override
  Future<Result<(List<OutletExpenseModel>, int?)>> getOutletExpense(
      {required GeneralRequestModel request}) async {
    try {
      var response =
          await _dio.get('/pengeluaran', queryParameters: request.toJson());
      if (response.statusCode == 200) {
        final Map<String, dynamic> parsedJson =
            json.decode(json.encode(response.data));
        final List<dynamic> expenseJsonList = parsedJson['data']['data'];
        final int? lastPage = parsedJson['data']['last_page'];

        final List<OutletExpenseModel> expenses = expenseJsonList
            .map((json) =>
                OutletExpenseModel.fromJson(json as Map<String, dynamic>))
            .toList();

        return Result.success((expenses, lastPage));
      } else {
        return Result.failed(response.data['message']);
      }
    } catch (e) {
      if (kDebugMode) {
        print('error get expenses ${e.toString()}');
      }
      return Result.failed(e.toString());
    }
  }

  @override
  Future<Result<GeneralResponse>> setTableReservation(
      {required List<int> tableIds, required TableStatusEnum status}) async {
    try {
      var response =
          await _dio.put('/update-statusqr-code-meja', queryParameters: {
        'ids': tableIds,
        'status': status.name,
      });
      if (response.statusCode == 200) {
        return Result.success(GeneralResponse.fromJson(response.data));
      } else {
        return Result.failed(response.data['message']);
      }
    } catch (e) {
      if (kDebugMode) {
        print('error set table reservation ${e.toString()}');
      }
      return Result.failed(e.toString());
    }
  }

  @override
  Future<Result<GeneralResponse>> setStatusTransaction(
      {required int transactionId,
      required StatusTransactionEnum status}) async {
    try {
      var response = await _dio.put('/update-status-pesanan/$transactionId',
          data: {'status': status.code});
      if (response.statusCode == 200) {
        return Result.success(GeneralResponse.fromJson(response.data));
      } else {
        return Result.failed(response.data['message']);
      }
    } catch (e) {
      if (kDebugMode) {
        print('error set status transaction $e');
      }
      return Result.failed(e.toString());
    }
  }

  @override
  Future<Result<GeneralResponse>> setStatusPayment(
      {required int transactionId, required StatusPaymentEnum status}) async {
    try {
      var response = await _dio.put('/update-status-pembayaran/$transactionId',
          data: {'status': status.code});
      if (response.statusCode == 200) {
        return Result.success(GeneralResponse.fromJson(response.data));
      } else {
        return Result.failed(response.data['message']);
      }
    } catch (e) {
      if (kDebugMode) {
        print('error set status payment $e');
      }
      return Result.failed(e.toString());
    }
  }
}
