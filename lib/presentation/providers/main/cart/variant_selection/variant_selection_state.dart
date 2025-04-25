// part 'variant_selection_state.freezed.dart';
part of 'variant_selection_provider.dart';

@freezed
class VariantSelectionState with _$VariantSelectionState {
  const factory VariantSelectionState({
    required List<VariantModel> selectedSinglePickVariants,
    required Map<VariantModel, int> multiPickQuantities,
    required ProductModel product,
    @Default(1) int productQuantity,
    @Default('') String note,
    @Default({}) Map<int, String> variantComments,
  }) = _VariantSelectionState;
}

extension VariantSelectionStateExtensions on VariantSelectionState {
  String getCommentForVariant(int variantId) {
    return variantComments[variantId] ?? '';
  }
}
