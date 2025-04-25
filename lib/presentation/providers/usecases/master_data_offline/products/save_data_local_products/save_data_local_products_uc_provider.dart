import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../domain/usecases/master_data_offline/products/save_data_local_products_uc.dart';
import '../../../../repositories/master_data_offline_repository/master_data_offline_repository.dart';

part 'save_data_local_products_uc_provider.g.dart';

@riverpod
SaveDataLocalProductsUC saveDataLocalProductsUC(
    SaveDataLocalProductsUCRef ref) {
  return SaveDataLocalProductsUC(
      repository: ref.watch(iMasterDataOfflineRepositoryProvider));
}
