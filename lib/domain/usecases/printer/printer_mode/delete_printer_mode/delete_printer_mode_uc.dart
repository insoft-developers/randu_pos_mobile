import '../../../../../data/repositories/i_printer_repository.dart';
import '../../../../entities/result.dart';
import '../../../usecase.dart';

class DeletePrinterModeUC implements UseCase<Result<String>, void> {
  final IPrinterRepository _repository;

  DeletePrinterModeUC({required IPrinterRepository repository})
      : _repository = repository;

  @override
  Future<Result<String>> call(_) async {
    var result = await _repository.deletePrinterMode();
    return result;
  }
}
