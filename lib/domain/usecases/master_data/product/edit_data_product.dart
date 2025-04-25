import '../../../../data/repositories/i_master_data_repository.dart';
import '../../../entities/general_response.dart';
import '../../../entities/master_data/request/edit_product/edit_product_params.dart';
import '../../../entities/result.dart';
import '../../usecase.dart';

class EditDataProductUC
    implements UseCase<Result<GeneralResponse>, EditProductParams> {
  final IMasterDataRepository _repository;

  EditDataProductUC({required IMasterDataRepository repository})
      : _repository = repository;

  @override
  Future<Result<GeneralResponse>> call(EditProductParams request) async {
    var result =
        await _repository.editProduct(request.idProduct, request.request);
    return result;
  }
}
