import '../../../../../data/repositories/i_printer_repository.dart';
import '../../../../entities/printer/printer_model/printer_model.dart';
import '../../../../entities/result.dart';
import '../../../usecase.dart';

class GetSinglePrinterUC implements UseCase<Result<PrinterModel?>, void> {
  final IPrinterRepository _repository;

  GetSinglePrinterUC({required IPrinterRepository repository})
      : _repository = repository;

  @override
  Future<Result<PrinterModel?>> call(_) async {
    var result = await _repository.getSinglePrinter();
    return result;
  }
}
