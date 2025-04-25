import '../../../../data/repositories/i_saved_repository.dart';
import '../../../../presentation/providers/main/cart/cart_provider.dart';
import '../../../entities/result.dart';
import '../../usecase.dart';

class SaveTransactionUC implements UseCase<Result<String>, CartState> {
  final ISavedRepository _repository;

  SaveTransactionUC({required ISavedRepository repository})
      : _repository = repository;

  @override
  Future<Result<String>> call(CartState request) async {
    var result = await _repository.saveTransaction(request);
    return result;
  }
}
