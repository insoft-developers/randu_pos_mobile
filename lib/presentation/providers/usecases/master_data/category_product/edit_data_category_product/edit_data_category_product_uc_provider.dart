import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../domain/usecases/master_data/category_product/edit_data_category_product.dart';
import '../../../../repositories/master_data_repository/master_data_repository.dart';

part 'edit_data_category_product_uc_provider.g.dart';

@riverpod
EditDataCategoryProductUC editDataCategoryProductUC(
    EditDataCategoryProductUCRef ref) {
  return EditDataCategoryProductUC(
      repository: ref.read(iMasterDataRepositoryProvider));
}
