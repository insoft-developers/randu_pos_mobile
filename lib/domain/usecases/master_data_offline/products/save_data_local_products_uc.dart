import '../../../../data/repositories/i_master_data_offline_repository.dart';
import '../../../entities/result.dart';
import '../../../entities/transaction/cart/product_model.dart';
import '../../usecase.dart';

class SaveDataLocalProductsUC
    implements UseCase<Result<String>, List<ProductModel>> {
  final IMasterDataOfflineRepository _repository;

  SaveDataLocalProductsUC({required IMasterDataOfflineRepository repository})
      : _repository = repository;

  @override
  Future<Result<String>> call(List<ProductModel> products) async {
    var result = await _repository.saveProducts(products);
    return result;
  }
}
