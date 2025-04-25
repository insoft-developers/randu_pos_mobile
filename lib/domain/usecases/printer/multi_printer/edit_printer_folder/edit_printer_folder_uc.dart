import '../../../../../data/repositories/i_printer_repository.dart';
import '../../../../entities/printer/printer_folder/printer_folder.dart';
import '../../../../entities/result.dart';
import '../../../usecase.dart';

class EditPrinterFolderUC implements UseCase<Result<String>, PrinterFolder> {
  final IPrinterRepository _repository;

  EditPrinterFolderUC({required IPrinterRepository repository})
      : _repository = repository;

  @override
  Future<Result<String>> call(PrinterFolder request) async {
    var result = await _repository.editPrinterFolder(request);
    return result;
  }
}
