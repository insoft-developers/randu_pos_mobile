import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../domain/usecases/printer/single/get_single_printer/get_single_printer_uc.dart';
import '../../../../repositories/printer/printer_repository.dart';

part 'get_single_printer_uc_provider.g.dart';

@riverpod
GetSinglePrinterUC getSinglePrinterUC(Ref ref) {
  return GetSinglePrinterUC(repository: ref.read(iPrinterRepositoryProvider));
}
