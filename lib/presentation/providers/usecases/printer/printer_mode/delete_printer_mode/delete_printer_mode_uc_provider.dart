import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../domain/usecases/printer/printer_mode/delete_printer_mode/delete_printer_mode_uc.dart';
import '../../../../repositories/printer/printer_repository.dart';

part 'delete_printer_mode_uc_provider.g.dart';

@riverpod
DeletePrinterModeUC deletePrinterModeUC(Ref ref) {
  return DeletePrinterModeUC(
      repository: ref.read(iPrinterRepositoryProvider));
}
