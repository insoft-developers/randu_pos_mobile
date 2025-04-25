import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/const/colors.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../providers/main/cart/cart_provider.dart';
import '../../../widgets/core/container/custom_rounded_container.dart';
import '../../../widgets/core/text/custom_text.dart';
import 'saved_transaction_info.dart';

class SavedTransactionItem extends ConsumerWidget {
  const SavedTransactionItem({
    super.key,
    required this.item,
  });

  final CartState item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var cartItemList = item.cartItems;
    return CustomRoundedContainer(
      padding: context.isMobile
          ? const EdgeInsets.fromLTRB(0, 4, 0, 12)
          : const EdgeInsets.all(8),
      margin: const EdgeInsets.all(0),
      shadow: const [],
      color: Colors.transparent,
      border: context.isMobile ? null : Border.all(color: CustomColors.gray),
      radius: 8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SavedTransactionInfo(item: item),
          const SizedBox(height: 12),
          SavedProductList(cartItemList: cartItemList),
        ],
      ),
    );
  }
}

class SavedProductList extends StatefulWidget {
  const SavedProductList({
    super.key,
    required this.cartItemList,
  });

  final List<CartItem> cartItemList;

  @override
  State<SavedProductList> createState() => _SavedProductListState();
}

class _SavedProductListState extends State<SavedProductList> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return CustomRoundedContainer(
      color: Colors.lightBlue.shade50,
      shadow: const [],
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      radius: 12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 8),
                      Flexible(
                        fit: FlexFit.loose,
                        child: SavedProductItem(
                            cartItem: widget.cartItemList.first),
                      ),
                    ],
                  ),
                ],
              ),
              widget.cartItemList.length > 1
                  ? DetailButton(
                      isExpanded: isExpanded,
                      onPressed: () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },
                    )
                  : const SizedBox.shrink(),
            ],
          ),
          if (context.isMobile)
            ...List.generate(
              isExpanded ? widget.cartItemList.length - 1 : 0,
              (index) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child:
                    SavedProductItem(cartItem: widget.cartItemList[index + 1]),
              ),
            )
          else
            SizedBox(
              height: isExpanded ? 60 : 0,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: SavedProductItem(
                        cartItem: widget.cartItemList[index + 1]),
                  );
                },
                itemCount: isExpanded ? widget.cartItemList.length - 1 : 0,
              ),
            )
        ],
      ),
    );
  }
}

class SavedProductItem extends StatelessWidget {
  const SavedProductItem({
    super.key,
    required this.cartItem,
  });

  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 12,
          backgroundColor: Colors.blue,
          child: Text(
            cartItem.quantity.toString(),
            style: const TextStyle(color: Colors.white, fontSize: 13),
          ),
        ),
        const SizedBox(width: 16),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Flexible(
              fit: FlexFit.loose,
              child: CustomText(
                cartItem.product.name ?? '-',
                style: CustomTextStyle.productName,
              ),
            ),
            cartItem.variants.isEmpty
                ? const SizedBox.shrink()
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...List.generate(
                        cartItem.variants.length,
                        (index) {
                          var variant = cartItem.variants[index];
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ...variant.entries.map((entry) {
                                final variant = entry.key;
                                final quantity = entry.value;
                                return Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Text(
                                    '$quantity x  ${variant.varianName}', // Updated to display the quantity
                                    style: CustomTextStyle.body3.copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 11,
                                      color: Colors.blue.shade600,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                );
                              }),
                            ],
                          );
                        },
                      )
                    ],
                  ),
          ],
        ),
      ],
    );
  }
}

class DetailButton extends StatelessWidget {
  final Function()? onPressed;
  final bool isExpanded;

  const DetailButton({
    super.key,
    required this.onPressed,
    required this.isExpanded,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            shadowColor: Colors.transparent,
            overlayColor: Colors.transparent,
            elevation: 0,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            visualDensity: VisualDensity.compact),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Rincian',
                style: TextStyle(color: Colors.blue, fontSize: 12)),
            Icon(
              isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              color: Colors.blue,
              size: 20,
            )
          ],
        ));
  }
}
