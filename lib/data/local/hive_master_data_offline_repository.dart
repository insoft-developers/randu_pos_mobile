import 'package:flutter/foundation.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

import '../../core/const/constant.dart';
import '../../domain/entities/result.dart';
import '../../domain/entities/transaction/cart/category_model.dart';
import '../../domain/entities/transaction/cart/payment_method/payment_method_model.dart';
import '../../domain/entities/transaction/cart/product_model.dart';
import '../repositories/i_master_data_offline_repository.dart';

class HiveMasterDataOfflineRepository implements IMasterDataOfflineRepository {
  @override
  Future<Result<List<CategoryModel>>> getCategories() async {
    try {
      final box = Hive.box<CategoryModel>(categoriesData);
      final values = box.values.toList();
      if (values.isNotEmpty) {
        return Result.success(values);
      } else {
        return const Result.success([]);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return Result.failed(e.toString());
    }
  }

  @override
  Future<Result<List<ProductModel>>> getProducts() async {
    try {
      final box = Hive.box<ProductModel>(productsBox);
      final values = box.values.toList();
      if (values.isNotEmpty) {
        return Result.success(values);
      } else {
        return const Result.success([]);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return Result.failed(e.toString());
    }
  }

  @override
  Future<Result<String>> saveCategories(List<CategoryModel> categories) async {
    try {
      var box = await Hive.openBox<CategoryModel>(categoriesData);
      // Use a map to save multiple products at once
      Map<String, CategoryModel> productMap = {
        for (var category in categories) category.id.toString(): category,
      };
      await box.clear();
      await box.putAll(productMap);
      return const Result.success('Berhasil menyimpan kategori produk');
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return Result.failed(e.toString());
    }
  }

  @override
  Future<Result<String>> saveProducts(List<ProductModel> products) async {
    try {
      var box = await Hive.openBox<ProductModel>(productsBox);
      // Use a map to save multiple products at once
      Map<String, ProductModel> productMap = {
        for (var product in products) product.id.toString(): product,
      };
      await box.clear();
      await box.putAll(productMap);
      return const Result.success('Berhasil menyimpan produk');
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return Result.failed(e.toString());
    }
  }

  @override
  Future<Result<List<PaymentMethodModel>>> getPaymentMethods() async {
    try {
      final box = Hive.box<PaymentMethodModel>(paymentMethodsData);
      final values = box.values.toList();
      if (values.isNotEmpty) {
        return Result.success(values);
      } else {
        return const Result.success([]);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return Result.failed(e.toString());
    }
  }

  @override
  Future<Result<String>> savePaymentMethods(
      List<PaymentMethodModel> paymentMethods) async {
    try {
      var box = await Hive.openBox<PaymentMethodModel>(paymentMethodsData);
      // Use a map to save multiple products at once
      Map<String, PaymentMethodModel> productMap = {
        for (var paymentMethod in paymentMethods)
          paymentMethod.id.toString(): paymentMethod,
      };
      await box.clear();
      await box.putAll(productMap);
      return const Result.success('Berhasil menyimpan metode pembayaran');
    } catch (e) {
      if (kDebugMode) {
        print('error menyimpan metode pembayaran: $e');
      }
      return Result.failed(e.toString());
    }
  }
}
