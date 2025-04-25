import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/const/audio_const.dart';
import '../../../../domain/entities/transaction/cart/product_model.dart';
import '../../../../domain/entities/transaction/cart/request/producs/products_request_model.dart';
import '../../../providers/cores/audio/just_audio_provider.dart';
import '../../../providers/cores/router/go_router_provider.dart';
import '../../../providers/main/cart/get_products/get_products_provider.dart';
import '../../../providers/main/master_data/products/list/get_master_products_provider.dart';

enum SoundTypeEnum {
  successAction(alertSuccessSound),
  successTransaction(alertSuccessTransactionSound),
  failed(failedAddProductToCartSound),
  addProductCart(successAddProductToCartSound),
  deleteProductCart(deleteProductFromCartSound);

  final String path;

  const SoundTypeEnum(this.path);
}

Future<void> onPressedFab(WidgetRef ref, ProductModel? product) async {
  final result =
      await ref.read(routerProvider).pushNamed('product_add', extra: product);
  if (result != null) {
    final bool isSuccess = result as bool;
    if (isSuccess) {
      // GET PRODUCTS
      const ProductsRequestModel request = ProductsRequestModel();
      await ref
          .read(getMasterProductsProvider.notifier)
          .fetchProducts(request, refresh: true);
      await ref
          .read(getProductsProvider.notifier)
          .fetchProducts(request, refresh: true);

      // PLAY SOUND
      await playSoundAlert(ref, SoundTypeEnum.successAction);
    }
  }
}

Future<void> playSoundAlert(WidgetRef ref, SoundTypeEnum type) async {
  final audioPlayer = ref.read(audioPlayerProvider);
  await audioPlayer.setAsset(type.path);
  audioPlayer.play();
}
