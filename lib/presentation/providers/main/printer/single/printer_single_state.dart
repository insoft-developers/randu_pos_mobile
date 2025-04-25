part of 'printer_single_provider.dart';

@freezed
class PrinterSingleState with _$PrinterSingleState {
  const factory PrinterSingleState(
      {PrinterModel? selectedSinglePrinter,
      String? message}) = _PrinterSingleState;
}
