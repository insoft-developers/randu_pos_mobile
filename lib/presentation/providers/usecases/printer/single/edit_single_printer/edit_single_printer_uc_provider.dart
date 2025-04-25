import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../domain/usecases/printer/single/edit_single_printer/edit_single_printer_uc.dart';
import '../../../../repositories/printer/printer_repository.dart';

part 'edit_single_printer_uc_provider.g.dart';

@riverpod
EditSinglePrinterUC editSinglePrinterUC(Ref ref) {
  return EditSinglePrinterUC(repository: ref.read(iPrinterRepositoryProvider));
}
