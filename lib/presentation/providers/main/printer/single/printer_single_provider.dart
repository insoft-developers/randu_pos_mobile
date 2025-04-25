import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../domain/entities/printer/paper_size.dart';
import '../../../../../domain/entities/printer/printer_model/printer_model.dart';
import '../../../../../domain/usecases/printer/single/get_single_printer/get_single_printer_uc.dart';
import '../../../../../domain/usecases/printer/single/save_single_printer/save_single_printer_uc.dart';
import '../../../usecases/printer/single/get_single_printer/get_single_printer_uc_provider.dart';
import '../../../usecases/printer/single/save_single_printer/save_single_printer_uc_provider.dart';
import '../printer_service_provider.dart';

part 'printer_single_provider.freezed.dart';
part 'printer_single_provider.g.dart';
part 'printer_single_state.dart';

@riverpod
class PrinterSingle extends _$PrinterSingle {
  @override
  PrinterServiceState build() {
    return  PrinterServiceState(paperSizeSinglePrinter: paperSize80mm);
  }

  Future<PrinterModel?> getSelectedPrinter() async {
    GetSinglePrinterUC uc = ref.read(getSinglePrinterUCProvider);
    final result = await uc(null);
    if(result.isSuccess){
      return result.resultValue;
    }else{
      return null;
    }
  }

  void setSelectedPrinter(PrinterModel printer) {
    SaveSinglePrinterUC uc = ref.read(saveSinglePrinterUCProvider);
    uc(printer);
  }
}
