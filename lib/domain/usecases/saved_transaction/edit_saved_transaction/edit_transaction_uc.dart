import '../../../../data/repositories/i_saved_repository.dart';
import '../../../../presentation/providers/main/cart/cart_provider.dart';
import '../../../entities/result.dart';
import '../../usecase.dart';

class EditTransactionUC implements UseCase<Result<String>, CartState> {
  final ISavedRepository _repository;

  EditTransactionUC({required ISavedRepository repository})
      : _repository = repository;

  @override
  Future<Result<String>> call(CartState params) async {
    if(params.savedCartInfo == null){
      return const Result.failed('Gagal edit transaksi');
    }
    var result = await _repository.editTransaction(
        transactionId: params.savedCartInfo!.id!, newModel: params);
    return result;
  }
}