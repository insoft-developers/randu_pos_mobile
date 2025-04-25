import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../domain/usecases/master_data/product/edit_data_product.dart';
import '../../../../repositories/master_data_repository/master_data_repository.dart';

part 'edit_data_product_uc_provider.g.dart';

@riverpod
EditDataProductUC editDataProductUC(EditDataProductUCRef ref) {
  return EditDataProductUC(repository: ref.read(iMasterDataRepositoryProvider));
}
