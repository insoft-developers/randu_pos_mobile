import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/const/colors.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/misc/app_image.dart';
import '../../../core/utils/currency_utils.dart';
import '../../../domain/entities/transaction/cart/discount_model.dart';
import '../../providers/cores/router/go_router_provider.dart';
import '../../providers/main/cart/cart_provider.dart';
import '../../widgets/core/text/custom_text.dart';
import '../../widgets/core/text_fields/custom_text_field.dart';
import 'discount_item_card.dart';

class DiscountList extends ConsumerStatefulWidget {
  final List<DiscountModel> discounts;

  const DiscountList({super.key, required this.discounts});

  @override
  ConsumerState<DiscountList> createState() => _DiscountListState();
}

class _DiscountListState extends ConsumerState<DiscountList> {
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _discountController = TextEditingController();
  List<DiscountModel> filteredDiscounts = [];
  final CurrencyInputFormatter _formatter =
      CurrencyInputFormatter(symbol: 'Rp ');

  @override
  void initState() {
    _searchController.addListener(_filterDiscounts);
    _discountController.addListener(_formatInput);
    _filterDiscounts();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterDiscounts);
    _discountController.removeListener(_formatInput);
    _searchController.dispose();
    _discountController.dispose();
    super.dispose();
  }

  void _filterDiscounts() {
    setState(() {
      filteredDiscounts = widget.discounts
          .where(
            (discount) => discount.name!
                .toLowerCase()
                .contains(_searchController.text.trim()),
          )
          .toList();
    });
  }

  void _formatInput() {
    String current = _discountController.text;

    // Only format if there's a change in the numeric value
    String numericOnly = _formatter.stripFormat(current);
    String formatted = _formatter.formatCurrency(numericOnly);

    if (current != formatted) {
      _discountController.value = TextEditingValue(
        text: formatted,
        selection: TextSelection.collapsed(
          offset: formatted.length,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          context.isMobile
              ? const SizedBox.shrink()
              : Container(
                  padding: EdgeInsets.all(context.isMobile ? 12 : 16),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                    color: CustomColors.primaryColor,
                  ),
                  child: Center(
                    child: CustomText(
                      'Pilih Voucher',
                      style: context.isMobile
                          ? CustomTextStyle.mobileDialogTitle
                          : CustomTextStyle.tabletDialogTitle,
                    ),
                  ),
                ),
          SizedBox(height: context.isMobile ? 0 : 24),
          Wrap(
            runSpacing: 16,
            children: [
              CustomTextField(
                controller: _searchController,
                maxLine: 1,
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchController.text.isNotEmpty
                    ? GestureDetector(
                        onTap: () {
                          _searchController.text = '';
                        },
                        child: const Icon(
                          Icons.cancel_outlined,
                          color: CustomColors.lightErrorMain,
                        ),
                      )
                    : const SizedBox.shrink(),
                hintText: 'Cari promo',
              ),
              CustomTextField(
                controller: _discountController,
                maxLine: 1,
                textInputType: TextInputType.number,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12),
                  child: getSvgImage(
                    'discount',
                    height: 16,
                    width: 16,
                    color: Colors.black.withValues(alpha: .7),
                  ),
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    if (_discountController.text.isEmpty) {
                      return;
                    }
                    int discountValue = int.parse(
                        formatIDRCurrencyToStringDigit(
                            _discountController.text));
                    DiscountModel discount = DiscountModel(
                        id: 0, value: discountValue, type: 'nominal');
                    ref.read(cartProvider.notifier).setDiscount(discount);
                    ref.read(routerProvider).pop();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 100,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: const BoxDecoration(
                      border: Border(
                        left: BorderSide(color: Colors.black54),
                      ),
                      borderRadius:
                          BorderRadius.horizontal(right: Radius.circular(8)),
                      color: CustomColors.primaryColor,
                    ),
                    child: AutoSizeText(
                      'Gunakan',
                      style: CustomTextStyle.mobileDialogText
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
                hintText: 'Masukan potongan harga',
              ),
            ],
          ),
          const SizedBox(height: 16),
          context.isMobile
              ? Expanded(
                  child: ListView.separated(
                    itemCount: filteredDiscounts.length,
                    itemBuilder: (context, index) {
                      DiscountModel discount = filteredDiscounts[index];
                      return DiscountItemCard(discount: discount);
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 16);
                    },
                  ),
                )
              : Expanded(
                  child: Wrap(
                  alignment: WrapAlignment.start,
                  runSpacing: 16,
                  spacing: 16,
                  children: [
                    for (int index = 0;
                        index < filteredDiscounts.length;
                        index++)
                      SizedBox(
                          width: 320,
                          child: DiscountItemCard(
                              discount: filteredDiscounts[index])),
                  ],
                )),
          /*IgnorePointer(
            child: Row(
              children: [
                SizedBox(
                  width: context.isMobile ? 0 : 350,
                ),
                Expanded(
                    child: PrimaryButton(
                  label: 'Batal',
                  onTap: () {
                    Navigator.pop(context);
                  },
                  buttonPrimaryType: ButtonPrimaryType.outlinedError,
                )),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: PrimaryButton(
                      disabled: false, label: 'Proses', onTap: () {}),
                ),
              ],
            ),
          ),*/
        ],
      ),
    );
  }
}
