import '../../domain/entities/general_response.dart';
import '../../domain/entities/master_data/request/create_category_product/create_category_product_request_model.dart';
import '../../domain/entities/master_data/request/create_product/create_product_request_model.dart';
import '../../domain/entities/result.dart';

abstract class IMasterDataRepository {
  //ADD PRODUCT
  Future<Result<GeneralResponse>> saveProduct(
      CreateProductRequestModel request);

  //EDIT PRODUCT
  Future<Result<GeneralResponse>> editProduct(
      int idProduct, CreateProductRequestModel request);

  //ADD CATEGORY PRODUCT
  Future<Result<GeneralResponse>> saveCategories(
      CreateCategoryProductRequestModel request);

//EDIT CATEGORY PRODUCT
  Future<Result<GeneralResponse>> editCategory(
      int idCategory, CreateCategoryProductRequestModel request);
}
