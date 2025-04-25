import '../../../../data/repositories/i_saved_repository.dart';
import '../../../entities/result.dart';
import '../../usecase.dart';

class DeleteSavedTransactionUC implements UseCase<Result<String>, String> {
  final ISavedRepository _repository;

  DeleteSavedTransactionUC({required ISavedRepository repository})
      : _repository = repository;

  @override
  Future<Result<String>> call(String params) async {
    var deleteSavedTransaction =
        await _repository.deleteSavedTransaction(savedId: params);
    return deleteSavedTransaction;
  }
}
