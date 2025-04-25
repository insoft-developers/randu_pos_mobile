import '../../../../data/repositories/i_master_data_offline_repository.dart';
import '../../../entities/result.dart';
import '../../../entities/transaction/cart/category_model.dart';
import '../../usecase.dart';

class GetDataLocalCategoriesUC
    implements UseCase<Result<List<CategoryModel>>, void> {
  final IMasterDataOfflineRepository _repository;

  GetDataLocalCategoriesUC({required IMasterDataOfflineRepository repository})
      : _repository = repository;

  @override
  Future<Result<List<CategoryModel>>> call(void _) async {
    var result = await _repository.getCategories();
    return result;
  }
}
