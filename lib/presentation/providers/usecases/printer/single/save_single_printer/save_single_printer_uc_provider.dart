import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../domain/usecases/printer/single/save_single_printer/save_single_printer_uc.dart';
import '../../../../repositories/printer/printer_repository.dart';

part 'save_single_printer_uc_provider.g.dart';

@riverpod
SaveSinglePrinterUC saveSinglePrinterUC(Ref ref) {
  return SaveSinglePrinterUC(repository: ref.read(iPrinterRepositoryProvider));
}
