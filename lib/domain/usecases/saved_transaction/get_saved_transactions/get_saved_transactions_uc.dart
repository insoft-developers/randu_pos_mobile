import '../../../../data/repositories/i_saved_repository.dart';
import '../../../../presentation/providers/main/cart/cart_provider.dart';
import '../../../entities/result.dart';
import '../../usecase.dart';

class GetSavedTransactionsUC implements UseCase<Result<List<CartState>>, void> {
  final ISavedRepository _repository;

  GetSavedTransactionsUC({required ISavedRepository repository})
      : _repository = repository;

  @override
  Future<Result<List<CartState>>> call(void _) async {
    var result = await _repository.getSavedTransactions();
    return result;
  }
}
