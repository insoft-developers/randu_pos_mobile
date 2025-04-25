import '../../../../../data/repositories/i_printer_repository.dart';
import '../../../../entities/printer/printer_model/printer_model.dart';
import '../../../../entities/result.dart';
import '../../../usecase.dart';

class SaveSinglePrinterUC implements UseCase<Result<String>, PrinterModel> {
  final IPrinterRepository _repository;

  SaveSinglePrinterUC({required IPrinterRepository repository})
      : _repository = repository;

  @override
  Future<Result<String>> call(PrinterModel request) async {
    var result = await _repository.saveSinglePrinter(request);
    return result;
  }
}
