import '../../domain/entities/result.dart';
import '../../presentation/providers/main/cart/cart_provider.dart';

abstract class ISavedRepository {
  Future<Result<String>> saveTransaction(CartState model);
  Future<Result<String>> deleteSavedTransaction({required String savedId});
  Future<Result<List<CartState>>> getSavedTransactions();
  Future<Result<String>> editTransaction(
      {required String transactionId, required CartState newModel});
}
