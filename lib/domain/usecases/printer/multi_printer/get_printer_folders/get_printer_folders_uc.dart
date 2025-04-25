import '../../../../../data/repositories/i_printer_repository.dart';
import '../../../../entities/printer/printer_folder/printer_folder.dart';
import '../../../../entities/result.dart';
import '../../../usecase.dart';
import '../save_printer_folder/save_printer_folder_uc.dart';

class GetPrinterFoldersUC
    implements UseCase<Result<List<PrinterFolder>>, void> {
  final IPrinterRepository _repository;

  GetPrinterFoldersUC({required IPrinterRepository repository})
      : _repository = repository;

  @override
  Future<Result<List<PrinterFolder>>> call(_) async {
    var result = await _repository.getPrinterFolders();
    if (result.isSuccess) {
      if (result.resultValue == null) {
        SavePrinterFolderUC savePrinterFolderUC =
            SavePrinterFolderUC(repository: _repository);
        await savePrinterFolderUC(defaultPrinterFolder);
        await savePrinterFolderUC(defaultCheckerFolder);
        await savePrinterFolderUC(defaultDailyRecapFolder);
      }
    }
    return result;
  }
}
