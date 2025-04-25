import '../../../../../data/repositories/i_printer_repository.dart';
import '../../../../entities/result.dart';
import '../../../usecase.dart';

class SavePrinterModeUC implements UseCase<Result<String>, String> {
  final IPrinterRepository _repository;

  SavePrinterModeUC({required IPrinterRepository repository})
      : _repository = repository;

  @override
  Future<Result<String>> call(String request) async {
    var result = await _repository.savePrinterMode(request);
    return result;
  }
}
