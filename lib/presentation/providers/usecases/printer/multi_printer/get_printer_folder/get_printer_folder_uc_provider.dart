import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../domain/usecases/printer/multi_printer/get_printer_folder/get_printer_folder_uc.dart';
import '../../../../repositories/printer/printer_repository.dart';

part 'get_printer_folder_uc_provider.g.dart';

@riverpod
GetPrinterFolderUC getPrinterFolderUC(Ref ref) {
  return GetPrinterFolderUC(repository: ref.read(iPrinterRepositoryProvider));
}
