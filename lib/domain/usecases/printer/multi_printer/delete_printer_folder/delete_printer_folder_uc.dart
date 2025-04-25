import '../../../../../data/repositories/i_printer_repository.dart';
import '../../../../entities/result.dart';
import '../../../usecase.dart';

class DeletePrinterFolderUC implements UseCase<Result<String>, String> {
  final IPrinterRepository _repository;

  DeletePrinterFolderUC({required IPrinterRepository repository})
      : _repository = repository;

  @override
  Future<Result<String>> call(String id) async {
    var result = await _repository.deletePrinterFolder(id);
    return result;
  }
}
