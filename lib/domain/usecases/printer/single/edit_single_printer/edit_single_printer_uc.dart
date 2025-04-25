import '../../../../../data/repositories/i_printer_repository.dart';
import '../../../../entities/printer/printer_model/printer_model.dart';
import '../../../../entities/result.dart';
import '../../../usecase.dart';

class EditSinglePrinterUC implements UseCase<Result<String>, PrinterModel> {
  final IPrinterRepository _repository;

  EditSinglePrinterUC({required IPrinterRepository repository})
      : _repository = repository;

  @override
  Future<Result<String>> call(PrinterModel request) async {
    var result = await _repository.editSinglePrinter(printer: request);
    return result;
  }
}
