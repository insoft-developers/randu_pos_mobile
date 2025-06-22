import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:just_audio/just_audio.dart';
import 'package:oktoast/oktoast.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

import '../../../core/const/audio_const.dart';
import '../../../core/utils/open_cashier_util.dart';
import '../../../domain/entities/general_response.dart';
import '../../../insoft/controller/premium_controller.dart';
import '../../providers/cores/audio/just_audio_provider.dart';
import '../../providers/main/cart/cart_provider.dart';
import '../../providers/main/dialog_petty_cach_provider.dart';
import '../../providers/main/master_data/products_barcode/products_barcode_provider.dart';
import '../../providers/main/transaction_provider.dart';
import '../../widgets/core/extension_dialog/extension_dialog.dart';
import '../../widgets/core/responsive/responsive_layout.dart';
import 'widgets.dart';

class DashboardPage extends ConsumerWidget {
  // static const route = '/';
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PremiumController controller = Get.put(PremiumController());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.cekPremium(context);
    });
    //DIALOG PETTY CASH
    pettyCashListener(ref, context);
    //OPEN / CLOSE CASHIER
    transactionDataListener(ref, context);
    // BARCODE CONTINUOUS LISTENER
    barcodeListener(ref, context);
    //PLAY SOUND ON ADD PRODUCT TO CART
    // addProductCartListener(ref);

    // Ini akan dijalankan sekali setelah build

    return const ResponsiveLayout(
      tabletBody: DashboardBodyTablet(),
      mobileBody: DashboardBodyMobile(),
    );
  }

  void addProductCartListener(WidgetRef ref) {
    ref.listen(cartProvider.select((value) => value.totalQuantity),
        (previous, next) async {
      final audioPlayer = ref.read(audioPlayerProvider);
      debugPrint('failed add product to cart');
      // print('previous length ${previous?.length}');
      if (next > (previous ?? 0)) {
        await audioPlayer.setAsset(successAddProductToCartSound);
        audioPlayer.play();
      } else {
        await audioPlayer.setAsset(deleteProductFromCartSound);
        audioPlayer.play();
      }
    });
  }

  void barcodeListener(WidgetRef ref, BuildContext context) {
    final audioPlayer = ref.watch(audioPlayerProvider);
    ref.listen(getProductForBarcodeProvider, (previous, next) async {
      if (next is AsyncData) {
        final value = next.value;
        if (value != null) {
          context.pop();
          await Future.delayed(const Duration(milliseconds: 100));
          if (context.mounted) {
            SimpleBarcodeScanner.streamBarcode(
              context,
              barcodeAppBar: const BarcodeAppBar(
                appBarTitle: 'Scan Barcode',
                centerTitle: false,
                enableBackButton: true,
                backButtonIcon: Icon(Icons.arrow_back_ios),
              ),
              scanType: ScanType.barcode,
              scanFormat: ScanFormat.ONLY_BARCODE,
              isShowFlashIcon: true,
              delayMillis: 700,
            ).listen((event) async {
              print('Stream Barcode Result: $event');
              final provider = ref.read(getProductForBarcodeProvider);
              if (provider.value == null) {
                debugPrint('products data is null');
                showToast('Products data is null');
                await playFailedAddToCartAudio(audioPlayer);
                return;
              }
              if (provider.value!.isEmpty) {
                debugPrint('products empty');
                showToast('Products empty');
                await playFailedAddToCartAudio(audioPlayer);
                return;
              }

              //search for the product
              final product = provider.value!
                  .firstWhereOrNull((element) => element.barcode == event);

              if (product == null) {
                debugPrint('product not found');
                showToast('Product not found');
                await playFailedAddToCartAudio(audioPlayer);
                return;
              }

              // check if the product is already in the cart
              final isExist = ref.read(cartProvider.select((value) => value
                  .cartItems
                  .any((element) => element.product.id == product.id)));

              if (isExist) {
                debugPrint('product already in cart');
                showToast('Product already in cart');
                await playFailedAddToCartAudio(audioPlayer);
                return;
              } else {
                //add the product to the cart
                ref.read(cartProvider.notifier).addProduct(product, [], '');
              }
            });
          }
        }
      } else if (next is AsyncLoading) {
        context.showLoadingDialog(
            title: 'Menyiapkan produk dan barcode scanner...',
            barrierDismissible: true);
      }
    });
  }

  Future<void> playFailedAddToCartAudio(AudioPlayer audioPlayer) async {
    await audioPlayer.setAsset(failedAddProductToCartSound);
    audioPlayer.play();
  }

  void transactionDataListener(WidgetRef ref, BuildContext context) {
    ref.listen(transactionDataProvider, (previous, next) async {
      if (next is AsyncData) {
        final value = next.value;
        if (value != null) {
          context.pop();
          await Future.delayed(const Duration(milliseconds: 100));
          if (value.status) {
            if (context.mounted) {
              context.showResultDialog(baseResponse: value);
            }
          } else {
            if (context.mounted) {
              context.showResultDialog(
                  baseResponse:
                      GeneralResponse(status: false, message: value.message));
            }
          }
        }
      } else if (next is AsyncError) {
        context.pop();
        await Future.delayed(const Duration(milliseconds: 100));
        if (context.mounted) {
          context.showResultDialog(
              baseResponse: GeneralResponse(
                  status: false, message: next.error.toString()));
        }
      } else if (next is AsyncLoading) {
        context.showLoadingDialog();
      }
    });
  }

  void pettyCashListener(WidgetRef ref, BuildContext context) {
    ref.listen(dialogPettyCachProvider, (previous, next) async {
      if (next) {
        await showStartShiftDialog(context, ref);
      }
    });
  }
}
