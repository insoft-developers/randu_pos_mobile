import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../domain/entities/result.dart';
import '../../../../../domain/entities/transaction/cart/discount_model.dart';
import '../../../../../domain/usecases/cart/get_discounts/get_discounts_uc.dart';
import '../../../usecases/cart/get_discounts/get_discounts_uc_provider.dart';

part 'get_discounts_provider.g.dart';

@Riverpod(keepAlive: true)
class GetDiscounts extends _$GetDiscounts {
  @override
  FutureOr<List<DiscountModel>> build() => const [];

  Future<void> fetchDiscounts() async {
    state = const AsyncLoading();
    GetDiscountsUC getDiscountsUC = ref.read(getDiscountsUCProvider);
    var result = await getDiscountsUC(null);
    switch (result) {
      case Success(value: final listDiscount):
        state = AsyncData(listDiscount);
      case Failed(message: _):
        state = const AsyncData([]);
    }
  }
}
