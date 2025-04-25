import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/utils/confirmation_dialog.dart';
import '../../../../providers/main/cart/cart_provider.dart';
import '../../../../widgets/core/container/custom_rounded_container.dart';

class EditItemQuantity extends ConsumerStatefulWidget {
  const EditItemQuantity({
    super.key,
    required this.cartItem,
  });

  final CartItem cartItem;

  @override
  ConsumerState<EditItemQuantity> createState() => _EditItemQuantityState();
}

class _EditItemQuantityState extends ConsumerState<EditItemQuantity> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = widget.cartItem.quantity.toString();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentQuantity = ref.watch(cartProvider.select((cart) {
      final item = cart.cartItems
          .firstWhereOrNull((item) => item.id == widget.cartItem.id);
      return item?.quantity ?? 0;
    }));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_controller.text.isEmpty) {
        _controller.text = '';
        return;
      }
      if (_controller.text != currentQuantity.toString()) {
        _controller.text = currentQuantity.toString();
      }
    });
    return CustomRoundedContainer(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
      radius: 5,
      border: Border.all(color: Colors.black26, width: .5),
      shadow: const [],
      child: Row(
        children: [
          GestureDetector(
            onTap: () async {
              if (widget.cartItem.quantity == 1) {
                final result = await context.confirmationPopUp(
                  titleMessage: 'Hapus',
                  content: 'Apakah anda yakin ingin menghapus item ini?',
                  type: DialogType.warning,
                  context: context,
                );
                if (result == true) {
                  ref.read(cartProvider.notifier).removeProduct(
                      widget.cartItem.product,
                      widget.cartItem.variants,
                      widget.cartItem.product.note ?? '',
                      cartId: widget.cartItem.id);
                } else {
                  debugPrint('tidak jadi hapus');
                }
              } else {
                print('substract');
                _controller.value = TextEditingValue(
                    text: ref
                        .read(cartProvider)
                        .cartItems
                        .firstWhere((item) => item.id == widget.cartItem.id)
                        .quantity
                        .toString());
                ref.read(cartProvider.notifier).removeProduct(
                    widget.cartItem.product,
                    widget.cartItem.variants,
                    widget.cartItem.product.note ?? '',
                    cartId: widget.cartItem.id);
              }
            },
            child: Icon(
              Icons.remove,
              size: 12,
              color: widget.cartItem.quantity == 1
                  ? Colors.grey
                  : Colors.blue.shade300,
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: 32,
            height: 16,
            child: TextFormField(
              // initialValue: widget.cartItem.quantity.toString(),
              controller: _controller,
              onEditingComplete: () {
                FocusManager.instance.primaryFocus?.unfocus();
                if (widget.cartItem.quantity == 1) {
                  _controller.text = '1';
                }
              },
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus?.unfocus();
                if (widget.cartItem.quantity == 1) {
                  _controller.text = '1';
                }
              },
              onChanged: (value) {
                value = value.trim();

                if (value.isEmpty) {
                  ref
                      .read(cartProvider.notifier)
                      .updateQuantity(widget.cartItem, 0);
                }

                int intValue = int.tryParse(value) ?? 1;
                if (widget.cartItem.product.isBufferedStock &&
                    intValue > widget.cartItem.product.shadowStock) {
                  intValue = widget.cartItem.product.shadowStock;
                  _controller.text = intValue.toString();
                }
                ref
                    .read(cartProvider.notifier)
                    .updateQuantity(widget.cartItem, intValue);
              },
              maxLines: 1,
              keyboardType: const TextInputType.numberWithOptions(
                  signed: false, decimal: false),
              textAlignVertical: TextAlignVertical.top,
              cursorHeight: 12,
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                isDense: true,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
              style: const TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () {
              if (widget.cartItem.product.isBufferedStock &&
                  widget.cartItem.quantity >=
                      widget.cartItem.product.shadowStock) {
                return;
              }
              ref.read(cartProvider.notifier).addProduct(
                  widget.cartItem.product,
                  widget.cartItem.variants,
                  widget.cartItem.product.note ?? '',
                  cartItemId: widget.cartItem.id);

              _controller.value = TextEditingValue(
                  text: ref
                      .read(cartProvider)
                      .cartItems
                      .firstWhere((item) => item.id == widget.cartItem.id)
                      .quantity
                      .toString());
            },
            child: Icon(
              Icons.add,
              size: 12,
              color: (widget.cartItem.product.isBufferedStock &&
                      widget.cartItem.quantity >=
                          widget.cartItem.product.shadowStock)
                  ? Colors.grey
                  : Colors.blue.shade300,
            ),
          ),
        ],
      ),
    );
  }
}
