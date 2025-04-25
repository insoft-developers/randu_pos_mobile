import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../domain/usecases/master_data_offline/products/get_data_local_products_uc.dart';
import '../../../../repositories/master_data_offline_repository/master_data_offline_repository.dart';

part 'get_data_local_products_uc_provider.g.dart';

@riverpod
GetDataLocalProductsUC getDataLocalProductsUC(GetDataLocalProductsUCRef ref) {
  return GetDataLocalProductsUC(
      repository: ref.watch(iMasterDataOfflineRepositoryProvider));
}
