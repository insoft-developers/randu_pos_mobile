import 'package:hive_ce_flutter/hive_flutter.dart';

import '../../../../core/const/constant.dart';
import '../../../../data/repositories/i_cart_repository.dart';
import '../../../entities/result.dart';
import '../../../entities/transaction/cart/category_model.dart';
import '../../usecase.dart';

class GetProductCategoriesUC
    implements UseCase<Result<List<CategoryModel>>, bool> {
  final ICartRepository _cartRepository;

  GetProductCategoriesUC({required ICartRepository cartRepository})
      : _cartRepository = cartRepository;

  @override
  Future<Result<List<CategoryModel>>> call(bool isRefresh) async {
    final categoriesBox = Hive.box<CategoryModel>(categoriesData);
    if (categoriesBox.isNotEmpty && !isRefresh) {
      return Success(categoriesBox.values.toList());
    } else {
      var categories = await _cartRepository.getCategory();
      return categories;
    }
  }
}
