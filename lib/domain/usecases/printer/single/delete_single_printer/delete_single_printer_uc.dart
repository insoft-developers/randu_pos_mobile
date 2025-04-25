import '../../../../../data/repositories/i_printer_repository.dart';
import '../../../../entities/result.dart';
import '../../../usecase.dart';

class DeleteSinglePrinterUC implements UseCase<Result<String>, void> {
  final IPrinterRepository _repository;

  DeleteSinglePrinterUC({required IPrinterRepository repository})
      : _repository = repository;

  @override
  Future<Result<String>> call(_) async {
    var result = await _repository.deleteSinglePrinter();
    return result;
  }
}
