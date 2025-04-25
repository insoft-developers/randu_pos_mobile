import '../../../../data/repositories/i_master_data_offline_repository.dart';
import '../../../entities/result.dart';
import '../../../entities/transaction/cart/category_model.dart';
import '../../usecase.dart';

class SaveDataLocalCategoriesUC
    implements UseCase<Result<String>, List<CategoryModel>> {
  final IMasterDataOfflineRepository _repository;

  SaveDataLocalCategoriesUC({required IMasterDataOfflineRepository repository})
      : _repository = repository;

  @override
  Future<Result<String>> call(List<CategoryModel> categories) async {
    var result = await _repository.saveCategories(categories);
    return result;
  }
}
