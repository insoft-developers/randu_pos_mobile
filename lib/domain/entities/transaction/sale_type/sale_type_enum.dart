import 'package:collection/collection.dart';

enum SaleTypeEnum {
  dineIn('Default (Dine In / Ambil di Toko)', 'price'),
  takeAway('Take Away (Delivery)', 'price_ta'),
  marketPlace('MarketPlace (Shopee, GoFood, Tokopedia, etc.)', 'price_mp'),
  customPrice('Custom Price', 'price_cus');

  final String name;
  final String value;
  const SaleTypeEnum(this.name, this.value);

  static SaleTypeEnum findByString(String status) =>
      SaleTypeEnum.values
          .firstWhereOrNull((element) => element.value == status) ??
      SaleTypeEnum.dineIn;
}
