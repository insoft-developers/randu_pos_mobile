import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../domain/usecases/printer/multi_printer/delete_printer_folder/delete_printer_folder_uc.dart';
import '../../../../repositories/printer/printer_repository.dart';

part 'delete_printer_folder_uc_provider.g.dart';

@riverpod
DeletePrinterFolderUC deletePrinterFolderUC(Ref ref) {
  return DeletePrinterFolderUC(
      repository: ref.read(iPrinterRepositoryProvider));
}
