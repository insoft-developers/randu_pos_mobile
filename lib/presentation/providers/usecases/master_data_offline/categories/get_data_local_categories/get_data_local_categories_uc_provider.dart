import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../domain/usecases/master_data_offline/categories/get_data_local_categories_uc.dart';
import '../../../../repositories/master_data_offline_repository/master_data_offline_repository.dart';

part 'get_data_local_categories_uc_provider.g.dart';

@riverpod
GetDataLocalCategoriesUC getDataLocalCategoriesUC(
    GetDataLocalCategoriesUCRef ref) {
  return GetDataLocalCategoriesUC(
      repository: ref.watch(iMasterDataOfflineRepositoryProvider));
}
