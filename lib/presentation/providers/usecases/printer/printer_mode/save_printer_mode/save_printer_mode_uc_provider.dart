import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../domain/usecases/printer/printer_mode/save_printer_mode/save_printer_mode_uc.dart';
import '../../../../repositories/printer/printer_repository.dart';

part 'save_printer_mode_uc_provider.g.dart';

@riverpod
SavePrinterModeUC savePrinterModeUC(Ref ref) {
  return SavePrinterModeUC(repository: ref.read(iPrinterRepositoryProvider));
}
