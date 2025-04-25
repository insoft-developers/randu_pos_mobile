import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../domain/usecases/master_data/category_product/save_data_category_product.dart';
import '../../../../repositories/master_data_repository/master_data_repository.dart';

part 'save_data_category_product_uc_provider.g.dart';

@riverpod
SaveDataCategoriesProductUC saveDataCategoriesProductUC(
    SaveDataCategoriesProductUCRef ref) {
  return SaveDataCategoriesProductUC(
      repository: ref.read(iMasterDataRepositoryProvider));
}
