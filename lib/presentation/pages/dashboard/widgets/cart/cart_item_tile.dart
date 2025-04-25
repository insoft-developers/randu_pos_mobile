import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/const/colors.dart';
import '../../../../../core/extensions/context_extension.dart';
import '../../../../../core/utils/confirmation_dialog.dart';
import '../../../../../core/utils/currency_utils.dart';
import '../../../../../core/utils/custom_alert_dialog.dart';
import '../../../../../core/utils/rounded_bottom_sheet.dart';
import '../../../../../domain/entities/transaction/sale_type/sale_type_enum.dart';
import '../../../../providers/main/cart/cart_provider.dart';
import '../../../../widgets/core/bottomsheet/comment_bottom_sheet.dart';
import '../../../../widgets/core/text/custom_text.dart';
import '../../utils/dashboard_utils.dart';
import '../edit_price_dialog.dart';
import 'edit_item_quantity.dart';
import 'list_variant.dart';

class CartItemTile extends ConsumerWidget {
  const CartItemTile({
    super.key,
    required this.cartItem,
  });

  final CartItem cartItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final saleType = ref.watch(cartProvider.select((value) => value.saleType));
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
            radius: 13,
            backgroundColor: Colors.blue,
            child: CustomText(
              cartItem.quantity.toString(),
              style: const TextStyle(color: Colors.white, fontSize: 13),
            )),
        const SizedBox(width: 12),
        Flexible(
          fit: FlexFit.loose,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 4),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          cartItem.product.name ?? '-',
                          ellipsis: true,
                          style: CustomTextStyle.productName,
                        ),
                        (cartItem.product.note == null ||
                                cartItem.product.note!.isEmpty)
                            ? const SizedBox.shrink()
                            : CustomText(
                                'Catatan: ${cartItem.product.note ?? '-'}',
                                ellipsis: true,
                                style: CustomTextStyle.productName.copyWith(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 11,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                      ],
                    ),
                  ),
                  if (cartItem.product.isProductEditable)
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            if (context.isMobile) {
                              await showRoundedBottomSheet(
                                context: context,
                                isDismissible: false,
                                onClose: (value) {
                                  print(value);
                                },
                                builder: (context) => EditPriceDialog(
                                  cartItem: cartItem,
                                  title: 'Masukkan Data',
                                  onSave: (name, amount) async {
                                    final result = await context.confirmationPopUp(
                                        context: context,
                                        titleMessage: 'Konfirmasi',
                                        content:
                                            'Apakah anda yakin ingin menambahkan pengeluaran ini?',
                                        type: DialogType.warning);
                                    if (result != null && result) {
                                      ref
                                          .read(cartProvider.notifier)
                                          .updatePrice(
                                              cartItem, int.parse(amount));
                                      if (context.mounted) {
                                        context.pop();
                                      }
                                    }
                                  },
                                  onCancel: () {
                                    print('Comment editing canceled');
                                  },
                                ),
                                enableDrag: false,
                              );
                            } else {
                              await showCustomAlertDialog(
                                context: context,
                                barrierDismissable: false,
                                onClose: (value) {
                                  print(value);
                                },
                                builder: (context) => AlertDialog(
                                  content: SizedBox(
                                    width:
                                        500, // MediaQuery.of(context).size.width * 0.5,
                                    child: EditPriceDialog(
                                      cartItem: cartItem,
                                      title: 'Masukkan Data',
                                      onSave: (name, amount) async {
                                        final result =
                                            await context.confirmationPopUp(
                                                context: context,
                                                titleMessage: 'Konfirmasi',
                                                content:
                                                    'Apakah anda yakin ingin menambahkan pengeluaran ini?',
                                                type: DialogType.warning);
                                        if (result != null && result) {
                                          ref
                                              .read(cartProvider.notifier)
                                              .updatePrice(
                                                  cartItem, int.parse(amount));
                                          if (context.mounted) {
                                            context.pop();
                                          }
                                        }
                                      },
                                      onCancel: () {
                                        print('Comment editing canceled');
                                      },
                                    ),
                                  ),
                                ),
                              );
                            }
                          },
                          child: Icon(
                            Icons.edit_document,
                            color: CustomColors.darkGray.withValues(alpha: .7),
                            size: 18,
                          ),
                        ),
                        const SizedBox(width: 4),
                        CustomText(
                          formatStringIDRToCurrency(
                              text: getProductPrice(cartItem.product,
                                      SaleTypeEnum.findByString(saleType))
                                  .toString(),
                              symbol: 'Rp '),
                          ellipsis: true,
                          style: CustomTextStyle.productName,
                        ),
                      ],
                    )
                  else
                    CustomText(
                      formatStringIDRToCurrency(
                          text: getProductPrice(cartItem.product,
                                  SaleTypeEnum.findByString(saleType))
                              .toString(),
                          symbol: 'Rp '),
                      ellipsis: true,
                      style: CustomTextStyle.productName,
                    ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () async {
                      final note = cartItem.note;
                      final builder = CommentBottomSheet(
                        title: 'Masukkan catatan',
                        initialComment: note,
                        onSave: (note) {
                          // Handle save action
                          ref
                              .read(cartProvider.notifier)
                              .setCartItemNote(cartItem, note);
                        },
                        onCancel: () {
                          // Handle cancel action
                          print('Note editing canceled');
                        },
                      );

                      if (context.isMobile) {
                        await showRoundedBottomSheet(
                          context: context,
                          isDismissible: false,
                          onClose: (value) {
                            print(value);
                          },
                          builder: (context) => builder,
                          enableDrag: false,
                        );
                      } else {
                        await showCustomAlertDialog(
                          context: context,
                          onClose: (value) {
                            print(value);
                          },
                          builder: (context) => AlertDialog(
                              content: SizedBox(
                            width: 550,
                            child: builder,
                          )),
                        );
                      }
                    },
                    child: Icon(
                      Icons.edit_document,
                      color: CustomColors.darkGray.withValues(alpha: .7),
                      size: 18,
                    ),
                  ),
                  const SizedBox(width: 12),
                  GestureDetector(
                    onTap: () async {
                      final result = await context.confirmationPopUp(
                        titleMessage: 'Hapus',
                        content: 'Apakah anda yakin ingin menghapus item ini?',
                        type: DialogType.warning,
                        context: context,
                      );
                      if (result != true) {
                        print('tidak jadi');
                        return;
                      }
                      ref.read(cartProvider.notifier).removeCartItem(cartItem);
                    },
                    child: Icon(
                      Icons.delete_forever_rounded,
                      color: CustomColors.darkGray.withValues(alpha: .7),
                      size: 18,
                    ),
                  ),
                  const SizedBox(width: 12),
                  EditItemQuantity(cartItem: cartItem),
                ],
              ),
              const SizedBox(height: 8),
              ListVariant(variants: cartItem.variants),
            ],
          ),
        ),
        const SizedBox(width: 6),
      ],
    );
  }
}
