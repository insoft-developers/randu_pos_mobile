part of 'master_data_offline_categories_provider.dart';

@freezed
class MasterDataOfflineCategoriesState with _$MasterDataOfflineCategoriesState {
  const factory MasterDataOfflineCategoriesState({
    List<CategoryModel>? values,
    String? saveMessage,
  }) = _MasterDataOfflineCategoriesState;
}
