part of 'products_barcode_provider.dart';

@freezed
class ProductsBarcodeState with _$ProductsBarcodeState {
  const factory ProductsBarcodeState({
    @Default([]) List<ProductModel> products,
    ProductModel? product,
  }) = _ProductsBarcodeState;
}
