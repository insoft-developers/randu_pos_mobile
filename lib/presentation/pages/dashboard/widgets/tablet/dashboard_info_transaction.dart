import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/const/colors.dart';
import '../../../../../core/extensions/context_extension.dart';
import '../../../../../core/misc/app_image.dart';
import '../../../../../core/utils/custom_alert_dialog.dart';
import '../../../../../core/utils/debouncer.dart';
import '../../../../../domain/entities/general_response.dart';
import '../../../../providers/cores/router/go_router_provider.dart';
import '../../../../providers/main/cart/cart_provider.dart';
import '../../../../providers/main/cart/search_product/search_product_provider.dart';
import '../../../../providers/main/customer/create_customer_provider.dart';
import '../../../../providers/main/saved/get_saved_transactions/get_saved_transactions_provider.dart';
import '../../../../widgets/core/buttons/primary_button.dart';
import '../../../../widgets/core/buttons/randu_button.dart';
import '../../../../widgets/core/container/custom_rounded_container.dart';
import '../../../../widgets/core/extension_dialog/extension_dialog.dart';
import '../../../../widgets/core/text/custom_text.dart';
import '../../../discount/discount_tablet_dialog.dart';
import '../../widgets.dart';
import '../mobile/name_and_additional_info.dart';
import '../phone_number_input.dart';
import '../search_product.dart';
import '../shipping_fee_input.dart';

class DashboardInfoTransaction extends ConsumerStatefulWidget {
  const DashboardInfoTransaction({
    super.key,
  });

  @override
  ConsumerState<DashboardInfoTransaction> createState() =>
      _DashboardInfoTransactionState();
}

class _DashboardInfoTransactionState
    extends ConsumerState<DashboardInfoTransaction> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();
  final Debouncer _debouncer = Debouncer(milliseconds: 500);

  @override
  void dispose() {
    _nameController.dispose();
    _searchController.dispose();
    _debouncer.cancel();
    super.dispose();
  }

  void _showCreateCustomer(context) async {
    await showCustomAlertDialog(
      context: context,
      builder: (value) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          content: const SizedBox(width: 550, child: PhoneNumberInput()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final showSearch = ref.watch(activateSearchProductProvider);
    final savedTransaction = ref.watch(getSavedTransactionsProvider);
    List<CartState> listSavedTransaction = savedTransaction.value ?? [];

    ref.listen(cartProvider.select((value) => value.note), (previous, next) {
      if (next != null && next.trim().isNotEmpty) {
        _nameController.text = next;
      }
    });
    final customer = ref.watch(cartProvider.select((value) => value.customer));
    ref.listen(createCustomerProvider, (previous, next) async {
      if (next is AsyncData) {
        final value = next.value;
        if (value != null && value.id != null) {
          if (context.canPop()) {
            context.pop();
          }
          await Future.delayed(const Duration(milliseconds: 100));
          ref.read(cartProvider.notifier).setCustomer(value);
          if (context.mounted) {
            context.showResultDialog(
                baseResponse: const GeneralResponse(
                    status: true, message: 'Berhasil menambahkan pelanggan'));
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
        // context.pop();
        context.showLoadingDialog();
      }
    });
    return CustomRoundedContainer(
      color: Colors.white,
      radius: 8,
      height: 60,
      padding: const EdgeInsets.all(8),
      child: showSearch
          ? const SearchProductDashboard()
          : Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      const ModeTransactionButton(),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        flex: 4,
                        child: PrimaryButton(
                          buttonPrimaryType:
                              ButtonPrimaryType.outlinedWhitePrimary,
                          radius: 12,
                          ellipsis: true,
                          label: customer?.name ??
                              (context.isPotraitOrSmallerThan1000
                                  ? 'Nama Pelanggan'
                                  : 'Ketik Nama Pelanggan Lalu Enter...'),
                          onTap: () async {
                            await showCustomAlertDialog(
                              barrierDismissable: true,
                              context: context,
                              builder: (value) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  content: const SizedBox(
                                      width: 550,
                                      child: NameAndAdditionalInfo()),
                                );
                              },
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      RanduButton(
                          icon: Icons.phone_android_rounded,
                          onPressed: () => _showCreateCustomer(context)),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          flex: 2,
                          child: RanduButton(
                              icon: Icons.search,
                              onPressed: () async {
                                ref
                                    .read(
                                        activateSearchProductProvider.notifier)
                                    .toggleSearch();
                              })
                          // )
                          ),
                      //                   ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                    flex: 2,
                    child: ButtonCardGroupTablet(
                        listSavedTransaction: listSavedTransaction)),
              ],
            ),
    );
  }
}

class ButtonCardGroupTablet extends ConsumerStatefulWidget {
  const ButtonCardGroupTablet({
    super.key,
    required this.listSavedTransaction,
  });

  final List<CartState> listSavedTransaction;

  @override
  ConsumerState<ButtonCardGroupTablet> createState() =>
      _ButtonCardGroupTabletState();
}

class _ButtonCardGroupTabletState extends ConsumerState<ButtonCardGroupTablet> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(getSavedTransactionsProvider.notifier).fetchSavedTransactions();
    });
  }

  void _showDiscountDialog(context) async {
    await showCustomAlertDialog(
      barrierDismissable: true,
      context: context,
      builder: (value) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          content: const DiscountTabletDialog(),
        );
      },
    );
  }

  void _showShippingFee(context) async {
    await showCustomAlertDialog(
      context: context,
      builder: (value) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          content: const SizedBox(width: 550, child: ShippingFeeInput()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = ref.watch(cartProvider);
    final savedTransaction = ref.watch(getSavedTransactionsProvider);
    List<CartState> listSavedTransaction = savedTransaction.value ?? [];
    var orientation = MediaQuery.of(context).orientation;
    final isPortrait = orientation == Orientation.portrait;
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Tooltip(
            message: 'Tersimpan',
            child: PrimaryButton(
              buttonPrimaryType: listSavedTransaction.isNotEmpty
                  ? ButtonPrimaryType.solidPrimary
                  : ButtonPrimaryType.outlinedWhitePrimary,
              radius: 12,
              preFixWidget: Padding(
                padding: const EdgeInsets.only(right: 4),
                child: getSvgImage(
                  'basket-shopping',
                  color: listSavedTransaction.isNotEmpty
                      ? Colors.white
                      : CustomColors.primaryColor,
                ),
              ),
              postFixWidget: widget.listSavedTransaction.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: CustomRoundedContainer(
                        radius: 2,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 4),
                        color: Colors.red[600],
                        shadow: const [],
                        child: Text(
                          widget.listSavedTransaction.length.toString(),
                          style: CustomTextStyle.lightComponentInputLabel
                              .copyWith(color: Colors.white, fontSize: 11),
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
              label: context.isPotraitOrSmallerThan1000 ? '' : 'Tersimpan',
              useAutoSizedLabel: true,
              onTap: () {
                if (widget.listSavedTransaction.isNotEmpty) {
                  ref.read(routerProvider).pushNamed('saved_transaction');
                }
              },
            )..shadowColor,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          flex: 3,
          child: Tooltip(
            message: 'Tambahan',
            child: PrimaryButton(
              useAutoSizedLabel: true,
              buttonPrimaryType: (cart.orderFee ?? 0) > 0
                  ? ButtonPrimaryType.solidPrimary
                  : ButtonPrimaryType.outlinedWhitePrimary,
              radius: 12,
              // preFixWidget: Padding(
              //   padding: const EdgeInsets.only(right: 8),
              //   child: Icon(
              //     Icons.local_shipping_outlined,
              //     color: (cart.orderFee ?? 0) > 0
              //         ? Colors.white
              //         : CustomColors.primaryColor,
              //   ),
              // ),
              label: context.isPotraitOrSmallerThan1000 ? '' : 'Tambahan',
              onTap: () => _showShippingFee(context),
            ),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          flex: 3,
          child: PrimaryButton(
            buttonPrimaryType: cart.discount != null
                ? ButtonPrimaryType.solidPrimary
                : ButtonPrimaryType.outlinedWhitePrimary,
            radius: 12,
            useAutoSizedLabel: true,
            preFixWidget: Padding(
              padding: const EdgeInsets.only(right: 4),
              child: getSvgImage(
                'discount',
                color: cart.discount != null
                    ? Colors.white
                    : CustomColors.primaryColor,
              ),
            ),
            label: context.isPotraitOrSmallerThan1000 ? '' : 'Voucher',
            onTap: () => _showDiscountDialog(context),
          ),
        )
      ],
    );
  }
}
