import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../domain/usecases/printer/printer_mode/get_printer_mode/get_printer_mode_uc.dart';
import '../../../../repositories/printer/printer_repository.dart';

part 'get_printer_mode_uc_provider.g.dart';

@riverpod
GetPrinterModeUC getPrinterModeUC(Ref ref) {
  return GetPrinterModeUC(repository: ref.read(iPrinterRepositoryProvider));
}
