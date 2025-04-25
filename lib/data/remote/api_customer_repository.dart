import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../domain/entities/customer/customer_model.dart';
import '../../domain/entities/customer/get_customer_request_model.dart';
import '../../domain/entities/general_response.dart';
import '../../domain/entities/result.dart';
import '../repositories/i_customer_repository.dart';

class ApiCustomerRepository implements ICustomerRepository {
  final Dio _dio;

  ApiCustomerRepository({required Dio dio}) : _dio = dio;
  @override
  Future<Result<GeneralResponse<CustomerModel>>> createCustomer(
      {required String name, required String phone}) async {
    try {
      if (kDebugMode) {
        print('Start : post customer');
      }
      // await Future.delayed(const Duration(seconds: 2));
      // final dummy = CustomerModel(name: 'dummy', phone: 'dummy');
      // return Result.success(GeneralResponse<CustomerModel>(
      //     status: true, message: 'Success', data: dummy));
      var response =
          await _dio.post('/customer', data: {'name': name, 'phone': phone});
      if (kDebugMode) {
        print('Customer response: $response');
      }
      if (response.statusCode == 200) {
        return Result.success(GeneralResponse<CustomerModel>.fromJsonWithData(
          response.data!,
          (model) => CustomerModel.fromJson(response.data['data']),
        ));
      } else {
        return Result.failed(response.data['message']);
      }
    } catch (e) {
      if (kDebugMode) {
        print('create customer error $e');
      }
      return Result.failed(e.toString());
    }
  }

  @override
  Future<Result<List<CustomerModel>>> getCustomers(
      GetCustomerRequestModel request) async {
    try {
      if (kDebugMode) {
        print('Start : get customers');
      }
      var response =
          await _dio.get('/customer', queryParameters: request.toJson());
      if (kDebugMode) {
        print('Customer response: $response');
      }
      if (response.statusCode == 200) {
        return Result.success(List<CustomerModel>.from(response.data['data']
                ['data']
            .map((e) => CustomerModel.fromJson(e))));
      } else {
        return Result.failed(response.data['message'] ?? 'Error');
      }
    } catch (e) {
      if (kDebugMode) {
        print('get customers error $e');
      }
      return Result.failed(e.toString());
    }
  }
}
