import '../../../../../data/repositories/i_printer_repository.dart';
import '../../../../entities/printer/printer_folder/printer_folder.dart';
import '../../../../entities/result.dart';
import '../../../usecase.dart';

class GetPrinterFolderUC implements UseCase<Result<PrinterFolder?>, String> {
  final IPrinterRepository _repository;

  GetPrinterFolderUC({required IPrinterRepository repository})
      : _repository = repository;

  @override
  Future<Result<PrinterFolder?>> call(String id) async {
    var result = await _repository.getPrinterFolder(id);
    return result;
  }
}
