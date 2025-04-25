import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../domain/usecases/printer/multi_printer/get_printer_folders/get_printer_folders_uc.dart';
import '../../../../repositories/printer/printer_repository.dart';

part 'get_printer_folders_uc_provider.g.dart';

@riverpod
GetPrinterFoldersUC getPrinterFoldersUC(Ref ref) {
  return GetPrinterFoldersUC(repository: ref.read(iPrinterRepositoryProvider));
}
