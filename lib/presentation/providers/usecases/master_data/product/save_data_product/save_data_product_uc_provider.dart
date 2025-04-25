import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../domain/usecases/master_data/product/save_data_product.dart';
import '../../../../repositories/master_data_repository/master_data_repository.dart';

part 'save_data_product_uc_provider.g.dart';

@riverpod
SaveDataProductUC saveDataProductUC(SaveDataProductUCRef ref) {
  return SaveDataProductUC(repository: ref.read(iMasterDataRepositoryProvider));
}
