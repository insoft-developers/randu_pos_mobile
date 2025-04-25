import 'package:flutter/foundation.dart';
import 'package:hive_ce/hive.dart';

import '../../core/const/constant.dart';
import '../../domain/entities/result.dart';
import '../../presentation/providers/main/cart/cart_provider.dart';
import '../repositories/i_saved_repository.dart';

class HiveSavedRepository implements ISavedRepository {
  @override
  Future<Result<List<CartState>>> getSavedTransactions() async {
    try {
      final box = Hive.box<CartState>(savedTransactionBox);
      final values = box.values.toList();
      if (values.isNotEmpty) {
        return Result.success(values);
      } else {
        return const Result.success([]);
      }
    } catch (e) {
      return Result.failed(e.toString());
    }
  }

  @override
  Future<Result<String>> saveTransaction(CartState model) async {
    DateTime now = DateTime.now();
    late String key;
    if (model.savedCartInfo != null && model.savedCartInfo!.id != null) {
      key = model.savedCartInfo!.id!;
    } else {
      key = 'ST-${now.microsecondsSinceEpoch}';
    }
    SavedCartInfo info = SavedCartInfo(id: key, createdAt: now);
    final List<CartItem> listProduct = [
      ...model.cartItems.where((element) => element.quantity > 0)
    ];
    try {
      final box = Hive.box<CartState>(savedTransactionBox);
      box.put(key, model.copyWith(savedCartInfo: info, cartItems: listProduct));
      return const Result.success('Berhasil Menyimpan transaksi');
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return const Result.failed('Gagal menyimpan transaksi');
    }
  }

  @override
  Future<Result<String>> deleteSavedTransaction(
      {required String savedId}) async {
    try {
      final box = Hive.box<CartState>(savedTransactionBox);
      box.delete(savedId);
      return const Result.success('Berhasil Menghapus transaksi');
    } catch (e) {
      return Result.failed(e.toString());
    }
  }

  @override
  Future<Result<String>> editTransaction(
      {required String transactionId, required CartState newModel}) async {
    try {
      final box = Hive.box<CartState>(savedTransactionBox);

      // Verify transaction exists
      if (!box.containsKey(transactionId)) {
        return const Result.failed('Transaksi tidak ditemukan');
      }

      // Update the transaction while preserving original creation time
      final existingTransaction = box.get(transactionId);
      final List<CartItem> listProduct = [
        ...newModel.cartItems.where((element) => element.quantity > 0)
      ];

      final updatedModel = newModel.copyWith(
        cartItems: listProduct,
        savedCartInfo: SavedCartInfo(
          id: transactionId,
          createdAt:
              existingTransaction?.savedCartInfo?.createdAt ?? DateTime.now(),
        ),
      );

      await box.put(transactionId, updatedModel);
      return const Result.success('Berhasil mengubah transaksi');
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return const Result.failed('Gagal mengubah transaksi');
    }
  }
}
