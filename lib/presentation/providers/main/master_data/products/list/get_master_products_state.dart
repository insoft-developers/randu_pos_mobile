part of 'get_master_products_provider.dart';

@freezed
class GetMasterProductsState with _$GetMasterProductsState {
  const GetMasterProductsState._();

  const factory GetMasterProductsState({
    ProductsRequestModel? request,
    List<ProductModel>? value,
    int? lastPage,
    @Default(1) int page,
  }) = _GetMasterProductsState;

  int get totalData => value?.length ?? 0;

  bool get isLastPageReached => page == lastPage;
}
