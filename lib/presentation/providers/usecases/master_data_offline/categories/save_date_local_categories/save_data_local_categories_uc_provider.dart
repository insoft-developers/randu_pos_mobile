import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../domain/usecases/master_data_offline/categories/save_data_local_categories_uc.dart';
import '../../../../repositories/master_data_offline_repository/master_data_offline_repository.dart';

part 'save_data_local_categories_uc_provider.g.dart';

@riverpod
SaveDataLocalCategoriesUC saveDataLocalCategoriesUC(
    SaveDataLocalCategoriesUCRef ref) {
  return SaveDataLocalCategoriesUC(
      repository: ref.watch(iMasterDataOfflineRepositoryProvider));
}
