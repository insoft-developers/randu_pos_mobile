import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../domain/usecases/printer/multi_printer/edit_printer_folder/edit_printer_folder_uc.dart';
import '../../../../repositories/printer/printer_repository.dart';

part 'edit_printer_folder_uc_provider.g.dart';

@riverpod
EditPrinterFolderUC editPrinterFolderUC(Ref ref) {
  return EditPrinterFolderUC(repository: ref.read(iPrinterRepositoryProvider));
}
