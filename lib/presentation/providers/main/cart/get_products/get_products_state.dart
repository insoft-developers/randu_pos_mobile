part of 'get_products_provider.dart';

@freezed
class GetProductsState with _$GetProductsState {
  const GetProductsState._();

  const factory GetProductsState({
    GeneralRequestModel? request,
    List<ProductModel>? value,
    int? lastPage,
    @Default(1) int page,
  }) = _GetProductsState;

  int get totalData => value?.length ?? 0;

  bool get isLastPageReached => page == lastPage;
}
