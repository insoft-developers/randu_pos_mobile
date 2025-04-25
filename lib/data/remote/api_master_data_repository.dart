import 'package:dio/dio.dart';

import '../../domain/entities/general_response.dart';
import '../../domain/entities/master_data/request/create_category_product/create_category_product_request_model.dart';
import '../../domain/entities/master_data/request/create_product/create_product_request_model.dart';
import '../../domain/entities/result.dart';
import '../repositories/i_master_data_repository.dart';

class ApiMasterDataRepository implements IMasterDataRepository {
  final Dio _dio;

  ApiMasterDataRepository({required Dio dio}) : _dio = dio;

  @override
  Future<Result<GeneralResponse>> saveCategories(
      CreateCategoryProductRequestModel request) async {
    try {
      var response =
          await _dio.post('/product-categories', data: request.toJson());
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
  Future<Result<GeneralResponse>> saveProduct(
      CreateProductRequestModel request) async {
    try {
      var response = await _dio.post('/product', data: request.toJson());
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
  Future<Result<GeneralResponse>> editProduct(
      int idProduct, CreateProductRequestModel request) async {
    try {
      var response = await _dio.put('/product/$idProduct',
          queryParameters: request.toJson());
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
  Future<Result<GeneralResponse>> editCategory(
      int idCategory, CreateCategoryProductRequestModel request) async {
    try {
      var response = await _dio.put('/product-categories/$idCategory',
          queryParameters: request.toJson());
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
}
