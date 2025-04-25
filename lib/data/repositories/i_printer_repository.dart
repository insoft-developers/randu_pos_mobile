import '../../domain/entities/printer/printer_folder/printer_folder.dart';
import '../../domain/entities/printer/printer_model/printer_model.dart';
import '../../domain/entities/result.dart';

abstract class IPrinterRepository {
  Future<Result<String>> saveSinglePrinter(PrinterModel model);
  Future<Result<String>> deleteSinglePrinter();
  Future<Result<PrinterModel?>> getSinglePrinter();
  Future<Result<String>> editSinglePrinter({required PrinterModel printer});

  Future<Result<List<PrinterFolder>>> getPrinterFolders();
  Future<Result<PrinterFolder?>> getPrinterFolder(String id);
  Future<Result<String>> savePrinterFolder(PrinterFolder folder);
  Future<Result<String>> deletePrinterFolder(String id);
  Future<Result<String>> editPrinterFolder(PrinterFolder folder);

  Future<Result<String?>> getPrinterMode();
  Future<Result<String>> savePrinterMode(String printerMode);
  Future<Result<String>> deletePrinterMode();

}
