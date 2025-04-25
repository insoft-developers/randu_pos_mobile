part of 'add_master_products_provider.dart';

@freezed
class AddMasterProductsState with _$AddMasterProductsState {
  const AddMasterProductsState._();

  const factory AddMasterProductsState({
    GeneralResponse? response,
    List<CategoryModel>? categoriesProduct,
    @Default(CreateProductRequestModel(
        name: '',
        categoryId: 0,
        sku: '',
        price: 0,
        priceTa: 0,
        priceMp: 0,
        priceCus: 0))
    CreateProductRequestModel requestModel,
    ProductModel? product, //FOR EDIT
  }) = _AddMasterProductsState;

  CategoryModel? get selectedCategory {
    return categoriesProduct
        ?.firstWhereOrNull((element) => element.id == requestModel.categoryId);
  }

  String get generatedSKU {
    return requestModel.name.toLowerCase().replaceAll(' ', '-');
  }
}
