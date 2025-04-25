part of 'printer_multi_provider.dart';

@freezed
class PrinterMultiState with _$PrinterMultiState {
  const factory PrinterMultiState({
    @Default(ResponseState.empty) ResponseState stateScanning,
    List<PrinterFolder>? printerFolders,
    PaperSizeModel? paperSizeSinglePrinter, // for individual printer
    String? message,
  }) = _PrinterMultiState;
}

extension PrinterMultiStateExtensions on PrinterMultiState {
  bool get isPrinterFoldersEmpty =>
      printerFolders == null || printerFolders!.isEmpty;
  int get totalPrintersInAllFolders {
    if (isPrinterFoldersEmpty) {
      print('is printer folder empty');
      return 0;
    }
    return printerFolders!.fold(
      0, // Initial value
      (total, folder) =>
          total + folder.printer.length, // Accumulate printer count
    );
  }

  //check printer available in the spesific folder
  bool isPrinterAvailable(PrinterTypeEnum type) {
    if (type == PrinterTypeEnum.allReceipt) {
      bool isAllReceiptPrinterSet = false;
      //CHECK PRINTER CASHIER
      if(printerFolders == null || printerFolders!.isEmpty){
        showToast('Semua printer belum dikonfigurasi');
        isAllReceiptPrinterSet = false;
        return isAllReceiptPrinterSet;
      }
      final folderCashier = printerFolders!.firstWhereOrNull((value) => value.type == PrinterTypeEnum.cashier);
      if (folderCashier == null) return false;
      if (folderCashier.printer.isEmpty) {
        // print('test : ')
        showToast('Printer cashier belum dikonfigurasi');
        isAllReceiptPrinterSet = false;
      } else {
        isAllReceiptPrinterSet = true;
      }
      //CHECK PRINTER CHECKER
      if(printerFolders == null || printerFolders!.isEmpty){
        showToast('Printer checker belum dikonfigurasi');
        isAllReceiptPrinterSet = false;
        return isAllReceiptPrinterSet;
      }
      final folderChecker = printerFolders!
          .firstWhereOrNull((value) => value.type == PrinterTypeEnum.checker);
      if (folderChecker == null) return false;
      if (folderChecker.printer.isEmpty) {
        showToast('Printer checker belum dikonfigurasi');
        isAllReceiptPrinterSet = false;
      } else {
        isAllReceiptPrinterSet = true;
      }
      return isAllReceiptPrinterSet;
    } else {
      final folder =
      printerFolders!.firstWhereOrNull((element) => element.type == type);
      if (folder == null) {
        showToast('Type printer not found');
        return false;
      } else {
        return folder.printer.isNotEmpty;
      }
    }
  }


}
