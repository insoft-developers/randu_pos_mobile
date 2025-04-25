import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../domain/entities/general_response.dart';
import '../../domain/entities/result.dart';
import '../../domain/entities/transaction/cart/category_model.dart';
import '../../domain/entities/transaction/cart/discount_model.dart';
import '../../domain/entities/transaction/cart/payment_method/payment_method_model.dart';
import '../../domain/entities/transaction/cart/product_model.dart';
import '../../domain/entities/transaction/cart/request/producs/products_request_model.dart';
import '../../domain/entities/transaction/cart/table_model.dart';
import '../repositories/i_cart_repository.dart';

class ApiCartRepository implements ICartRepository {
  final Dio _dio;

  ApiCartRepository({required Dio dio}) : _dio = dio;

  @override
  Future<Result<(List<ProductModel>, int?)>> getProducts(
      {required ProductsRequestModel request}) async {
    List<ProductModel> dummyProducts = [
      const ProductModel(
        id: 1,
        categoryId: 101,
        code: 'P001',
        sku: 'SKU001',
        name: 'Product 1',
        price: 50000,
        cost: 30000,
        unit: 'pcs',
        quantity: 7,
        stockAlert: 5,
        sell: 100,
        created: '2024-01-01',
        userId: 1,
        isVariant: 1,
        isManufactured: 0,
        bufferedStock: 1,
        categoryName: 'Category 1',
        variantGroups: ['Color', 'Size'],
        variant: [
          VariantModel(
            id: 1,
            productId: 1,
            varianGroup: 'Color',
            varianName: 'Red',
            sku: 'SKU-RED',
            varianPrice: 10000,
            singlePick: 1,
            maxQuantity: 5,
            quantity: 10,
            note: 'Bright Red',
          ),
        ],
      ),
      const ProductModel(
        id: 2,
        categoryId: 102,
        code: 'P002',
        sku: 'SKU002',
        name: 'Product 2',
        price: 30000,
        cost: 20000,
        unit: 'pcs',
        quantity: 5,
        stockAlert: 2,
        sell: 50,
        created: '2024-02-01',
        userId: 2,
        isVariant: 1,
        isManufactured: 0,
        bufferedStock: 1,
        categoryName: 'Category 2',
        variantGroups: ['Material'],
        variant: [
          VariantModel(
            id: 2,
            productId: 2,
            varianGroup: 'Material',
            varianName: 'Cotton',
            sku: 'SKU-COTTON',
            varianPrice: 5000,
            singlePick: 0,
            maxQuantity: 3,
            quantity: 15,
            note: 'Soft Cotton',
          ),
        ],
      ),
      const ProductModel(
        id: 3,
        categoryId: 103,
        code: 'P003',
        sku: 'SKU003',
        name: 'Product 3',
        price: 20000,
        cost: 10000,
        unit: 'pcs',
        quantity: 5,
        stockAlert: 2,
        sell: 30,
        created: '2024-03-01',
        userId: 3,
        isVariant: 2,
        isManufactured: 0,
        bufferedStock: 0,
        categoryName: 'Category 3',
        variantGroups: ['Size'],
        variant: [
          VariantModel(
            id: 3,
            productId: 3,
            varianGroup: 'Size',
            varianName: 'Large',
            sku: 'SKU-LARGE',
            varianPrice: 2000,
            singlePick: 1,
            maxQuantity: 2,
            quantity: 7,
            note: 'Large size',
          ),
        ],
      ),
      // Add more products as needed
    ];

    try {
      var response =
          await _dio.get('/product', queryParameters: request.toJson());
      if (response.statusCode == 200) {
        final Map<String, dynamic> parsedJson =
            json.decode(json.encode(response.data));
        final List<dynamic> productJsonList = parsedJson['data']['data'];
        final int? lastPage = parsedJson['data']['last_page'];
        print('last page $lastPage');

        final List<ProductModel> products = productJsonList
            .map((json) => ProductModel.fromJson(json as Map<String, dynamic>))
            .toList();
        return Result.success((products, lastPage));
        // return Result.success(dummyProducts);
      } else {
        return Result.failed(response.data['message']);
      }
    } catch (e) {
      print('error get product by category ${e.toString()}');
      return Result.failed(e.toString());
    }
  }

  // final List<CategoryModel> dummyCategoryProducts = [
  //   CategoryModel(
  //     id: 1,
  //     code: "C001",
  //     name: "Makanan Ringan",
  //     created: DateTime.parse("2024-01-01 00:00:00"),
  //     userId: 1,
  //     image: "https://example.com/image1.png",
  //     description: "Description for category 1",
  //   ),
  //   CategoryModel(
  //     id: 2,
  //     code: "C002",
  //     name: "Category 2",
  //     created: DateTime.parse("2024-02-01 00:00:00"),
  //     userId: 2,
  //     image: "https://example.com/image2.png",
  //     description: "Description for category 2",
  //   ),
  //   CategoryModel(
  //     id: 3,
  //     code: "C003",
  //     name: "Category 3",
  //     created: null,
  //     userId: 3,
  //     image: "https://example.com/image3.png",
  //     description: "Description for category 3",
  //   ),
  //   CategoryModel(
  //     id: 4,
  //     code: "C004",
  //     name: "Category 4",
  //     created: DateTime.parse("2024-04-01 00:00:00"),
  //     userId: 4,
  //     image: "https://example.com/image4.png",
  //     description: "Description for category 4",
  //   ),
  //   CategoryModel(
  //     id: 5,
  //     code: "C005",
  //     name: "Category 5",
  //     created: DateTime.parse("2024-05-01 00:00:00"),
  //     userId: 5,
  //     image: "https://example.com/image5.png",
  //     description: "Description for category 5",
  //   ),
  // ];
  @override
  Future<Result<List<CategoryModel>>> getCategory() async {
    try {
      var response = await _dio.get('/product-categories');
      if (response.statusCode == 200) {
        final generalResponse =
            GeneralResponse<List<CategoryModel>>.fromJsonWithData(
          response.data!,
          (data) => (data as List)
              .map((category) => CategoryModel.fromJson(category))
              .toList(),
        );
        return Result.success(generalResponse.data ?? []);
      } else {
        return Result.failed(response.data['message']);
      }
    } catch (e) {
      if (kDebugMode) {
        print('error get category ${e.toString()}');
      }
      return Result.failed(e.toString());
    }
  }

  @override
  Future<Result<List<TableModel>>> getTables(String? query) async {
    try {
      final queryParams = {
        if (query != null) 'search': query,
        'all': true,
      };

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
  Future<Result<List<DiscountModel>>> getDiscounts() async {
    try {
      var response = await _dio.get('/discount');
      if (response.statusCode == 200) {
        final Map<String, dynamic> parsedJson =
            json.decode(json.encode(response.data));
        final List<dynamic> discountJsonList = parsedJson['data']['data'];
        final List<DiscountModel> discounts = discountJsonList
            .map((json) => DiscountModel.fromJson(json as Map<String, dynamic>))
            .toList();
        return Result.success(discounts);
      } else {
        return Result.failed(response.data['message']);
      }
    } catch (e) {
      return Result.failed(e.toString());
    }
  }

  @override
  Future<Result<List<PaymentMethodModel>>> getPaymentMethod() async {
    try {
      var response = await _dio.get('/type-payment');
      if (response.statusCode == 200) {
        final generalResponse =
            GeneralResponse<List<PaymentMethodModel>>.fromJsonWithData(
          response.data!,
          (data) => (data as List)
              .map((paymentMethod) => paymentMethod['selected'] == true
                  ? PaymentMethodModel.fromJson(paymentMethod)
                  : null)
              .where((value) => value != null)
              .map((value) => value as PaymentMethodModel)
              .toList(),
        );

        List<PaymentMethodModel> data = generalResponse.data ?? [];
        return Result.success(data);
      } else {
        return Result.failed(response.data['message']);
      }
    } catch (e) {
      if (kDebugMode) {
        print('error get payment method ${e.toString()}');
      }
      return Result.failed(e.toString());
    }
  }
}
