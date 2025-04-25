import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../domain/usecases/printer/single/delete_single_printer/delete_single_printer_uc.dart';
import '../../../../repositories/printer/printer_repository.dart';

part 'delete_single_printer_uc_provider.g.dart';

@riverpod
DeleteSinglePrinterUC editSinglePrinterUC(Ref ref) {
  return DeleteSinglePrinterUC(
      repository: ref.read(iPrinterRepositoryProvider));
}
