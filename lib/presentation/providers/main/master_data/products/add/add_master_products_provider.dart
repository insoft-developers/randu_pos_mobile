import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../domain/entities/general_response.dart';
import '../../../../../../domain/entities/master_data/request/create_product/create_product_request_model.dart';
import '../../../../../../domain/entities/master_data/request/edit_product/edit_product_params.dart';
import '../../../../../../domain/entities/result.dart';
import '../../../../../../domain/entities/transaction/cart/category_model.dart';
import '../../../../../../domain/entities/transaction/cart/product_model.dart';
import '../../../../../../domain/usecases/cart/get_product_categories/get_product_categories_uc.dart';
import '../../../../../../domain/usecases/master_data/product/edit_data_product.dart';
import '../../../../../../domain/usecases/master_data/product/save_data_product.dart';
import '../../../../usecases/cart/get_product_categories/get_product_categories_uc_provider.dart';
import '../../../../usecases/master_data/product/edit_data_product/edit_data_product_uc_provider.dart';
import '../../../../usecases/master_data/product/save_data_product/save_data_product_uc_provider.dart';

part 'add_master_products_provider.freezed.dart';
part 'add_master_products_provider.g.dart';
part 'add_master_products_state.dart';

@riverpod
class AddMasterProducts extends _$AddMasterProducts {
  @override
  FutureOr<AddMasterProductsState> build() async {
    return const AddMasterProductsState(
        requestModel: CreateProductRequestModel(
            name: '',
            categoryId: 0,
            sku: '',
            price: 0,
            priceTa: 0,
            priceMp: 0,
            priceCus: 0));
  }

  Future<void> setProduct(ProductModel product) async {
    state = AsyncData(state.value!.copyWith(product: product));
  }

  Future<void> getCategories() async {
    state = const AsyncLoading();
    GetProductCategoriesUC getProductCategoriesUC =
        ref.read(getProductCategoriesUCProvider);
    final Result<List<CategoryModel>> result =
        await getProductCategoriesUC(true);
    state = AsyncData(
        state.value!.copyWith(categoriesProduct: result.resultValue ?? []));
  }

  Future<void> selectCategory(CategoryModel category) async {
    CreateProductRequestModel requestModel = state.value!.requestModel;
    requestModel = requestModel.copyWith(categoryId: category.id);
    state = AsyncData(state.value!.copyWith(requestModel: requestModel));
  }

  Future<void> setName(String name) async {
    CreateProductRequestModel requestModel = state.value!.requestModel;
    requestModel = requestModel.copyWith(name: name);
    state = AsyncData(state.value!.copyWith(requestModel: requestModel));
  }

  Future<void> setPrice(int price) async {
    CreateProductRequestModel requestModel = state.value!.requestModel;
    requestModel = requestModel.copyWith(price: price);
    state = AsyncData(state.value!.copyWith(requestModel: requestModel));
  }

  Future<void> setPriceTa(int priceTa) async {
    CreateProductRequestModel requestModel = state.value!.requestModel;
    requestModel = requestModel.copyWith(priceTa: priceTa);
    state = AsyncData(state.value!.copyWith(requestModel: requestModel));
  }

  Future<void> setPriceMp(int priceMp) async {
    CreateProductRequestModel requestModel = state.value!.requestModel;
    requestModel = requestModel.copyWith(priceMp: priceMp);
    state = AsyncData(state.value!.copyWith(requestModel: requestModel));
  }

  Future<void> setPriceCus(int priceCus) async {
    CreateProductRequestModel requestModel = state.value!.requestModel;
    requestModel = requestModel.copyWith(priceCus: priceCus);
    state = AsyncData(state.value!.copyWith(requestModel: requestModel));
  }

  Future<void> setSku(String sku) async {
    CreateProductRequestModel requestModel = state.value!.requestModel;
    requestModel = requestModel.copyWith(sku: sku);
    state = AsyncData(state.value!.copyWith(requestModel: requestModel));
  }

  Future<void> setBarcode(String barcode) async {
    CreateProductRequestModel requestModel = state.value!.requestModel;
    requestModel = requestModel.copyWith(barcode: barcode);
    state = AsyncData(state.value!.copyWith(requestModel: requestModel));
  }

  Future<void> saveProduct({bool isEdit = false}) async {
    print('save product');
    print(state);
    print('request model ${state.value?.requestModel.toJson()}');
    state = const AsyncLoading();
    late Result result;
    if (isEdit) {
      //EDIT PRODUCT
      print('editing...');
      EditDataProductUC saveDataProductUC = ref.read(editDataProductUCProvider);
      if (state.value?.product == null) {
        print('product null');
        return;
      }
      result = await saveDataProductUC(EditProductParams(
          idProduct: state.value?.product?.id ?? 0,
          request: state.value!.requestModel));
    } else {
      //ADD PRODUCT
      print('saving...');
      SaveDataProductUC saveDataProductUC = ref.read(saveDataProductUCProvider);
      result = await saveDataProductUC(state.value!.requestModel);
    }
    switch (result) {
      case Success(value: final response):
        state = AsyncData(state.value!.copyWith(response: response));
      case Failed(message: final message):
        state = AsyncError(message, StackTrace.current);
    }
  }

  Future<void> setRequestModel(CreateProductRequestModel request) async {
    print('set request model : ');
    print(request.toJson());
    if (state.value == null) {
      print('set when state null');
      state = AsyncData(AddMasterProductsState(requestModel: request));
      print(state.value);
    } else {
      state = AsyncData(state.value!.copyWith(requestModel: request));
    }
  }
}
