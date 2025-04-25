part of 'master_data_offline_products_provider.dart';

@freezed
class MasterDataOfflineProductsState with _$MasterDataOfflineProductsState {
  const factory MasterDataOfflineProductsState({
    @Default('') String? message,
    @Default([]) List<ProductModel> values,
  }) = _MasterDataOfflineProductsState;
}
