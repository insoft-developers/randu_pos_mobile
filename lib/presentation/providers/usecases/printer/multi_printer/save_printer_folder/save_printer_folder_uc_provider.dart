import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../domain/usecases/printer/multi_printer/save_printer_folder/save_printer_folder_uc.dart';
import '../../../../repositories/printer/printer_repository.dart';

part 'save_printer_folder_uc_provider.g.dart';

@riverpod
SavePrinterFolderUC savePrinterFolderUC(Ref ref) {
  return SavePrinterFolderUC(repository: ref.read(iPrinterRepositoryProvider));
}
