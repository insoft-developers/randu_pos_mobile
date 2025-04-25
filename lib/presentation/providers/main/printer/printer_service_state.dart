part of 'printer_service_provider.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class PrinterServiceState with _$PrinterServiceState {
  const factory PrinterServiceState({
    @Default(ResponseState.empty) ResponseState connectBluetoothState,
    @Default(ResponseState.empty) ResponseState scanPrinterState,
    @Default([]) List<PrinterModel> printerList,
    @Default([]) List<PrinterModel> tempPrinterList,
    @Default([]) List<PrinterModel> selectedPrinterList,
    PrinterModel? connectedPrinter,
    PaperSizeModel? paperSizeSinglePrinter,
    @Default(PrinterModeEnum.single) PrinterModeEnum printerMode,
    String? message,
    @Default(false) bool isPrintAllProductChecker, // for reset all product in checker
  }) = _PrinterServiceState;
}

extension PrinterServiceStateExtension on PrinterServiceState {
  bool get isPrinterSet => connectedPrinter != null;
  PrinterModel? get getSelectedTempPrinter =>
      printerList.firstWhereOrNull((element) => element.isSelected);
  PrinterModel? get getSelectedPrinter =>
      connectedPrinter;

}
