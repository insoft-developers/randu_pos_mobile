import '../../../../data/repositories/i_master_data_offline_repository.dart';
import '../../../entities/result.dart';
import '../../../entities/transaction/cart/product_model.dart';
import '../../usecase.dart';

class GetDataLocalProductsUC
    implements UseCase<Result<List<ProductModel>>, void> {
  final IMasterDataOfflineRepository _repository;

  GetDataLocalProductsUC({required IMasterDataOfflineRepository repository})
      : _repository = repository;

  @override
  Future<Result<List<ProductModel>>> call(void _) async {
    var result = await _repository.getProducts();
    return result;
  }
}
