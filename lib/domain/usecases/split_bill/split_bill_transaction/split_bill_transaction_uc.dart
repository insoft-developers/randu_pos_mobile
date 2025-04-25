import '../../../../data/repositories/i_saved_repository.dart';
import '../../../../presentation/providers/main/cart/cart_provider.dart';
import '../../../entities/result.dart';
import '../../usecase.dart';

class SplitBillTransactionUC
    implements UseCase<Result<String>, List<CartState>> {
  final ISavedRepository _repository;

  SplitBillTransactionUC({required ISavedRepository repository})
      : _repository = repository;

  @override
  Future<Result<String>> call(List<CartState> params) async {
    if (params.length != 2) {
      return const Result.failed('Parameter tidak lengkap');
    }
    var resultEdit = await _repository.editTransaction(
        transactionId: params[0].savedCartInfo!.id!, newModel: params[0]);
    var resultAdd = await _repository.saveTransaction(params[1]);
    if (resultEdit.isFailed || resultAdd.isFailed) {
      return const Result.failed('Gagal split bill');
    }
    return const Result.success('Berhasil split bill');
  }
}
