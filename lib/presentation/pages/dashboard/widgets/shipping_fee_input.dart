import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../core/const/colors.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../providers/main/cart/cart_provider.dart';
import '../../../widgets/core/buttons/primary_button.dart';
import '../../../widgets/core/text/custom_text.dart';
import '../../../widgets/core/text_fields/custom_text_field.dart';

class ShippingFeeInput extends StatelessWidget {
  const ShippingFeeInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          top: 16,
          left: 16,
          right: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(context.isMobile ? 12 : 16),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
              color: CustomColors.primaryColor,
            ),
            child: Center(
              child: CustomText(
                'Biaya Tambahan',
                style: context.isMobile
                    ? CustomTextStyle.mobileDialogTitle
                    : CustomTextStyle.tabletDialogTitle,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const SizedBox(
            height: 8,
          ),
          const InputShippingFee(),
          const SizedBox(
            height: 24,
          )
        ],
      ),
    );
  }
}

class InputShippingFee extends ConsumerStatefulWidget {
  const InputShippingFee({super.key});

  @override
  ConsumerState<InputShippingFee> createState() => _InputShippingFeeState();
}

class _InputShippingFeeState extends ConsumerState<InputShippingFee> {
  final TextEditingController _shippingController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var orderFee = ref.watch(cartProvider.select((value) => value.orderFee));
      String text = orderFee != null ? orderFee.toString() : '';
      if (orderFee != null) {
        final NumberFormat currencyFormat = NumberFormat.currency(
            locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
        text = text.replaceAll(RegExp(r'[^\d]'), '');
        double value = double.tryParse(text) ?? 0;
        String formattedText = currencyFormat.format(value);

        _shippingController.value = TextEditingValue(
          text: formattedText,
          selection: TextSelection.collapsed(offset: formattedText.length),
        );
      }
      _shippingController.addListener(_formatInput);
    });
    super.initState();
  }

  @override
  void dispose() {
    _shippingController.removeListener(_formatInput);
    _shippingController.dispose();
    super.dispose();
  }

  void _formatInput() {
    String text = _shippingController.text;
    if (text.isEmpty) return;

    // IDK why but in tablet when not use setState()
    // the controller value not update
    setState(() {});

    if (text.length > 13) {
      _shippingController.value = TextEditingValue(
        text: text.replaceRange(text.length - 1, null, ''),
        selection: TextSelection.collapsed(offset: text.length),
      );
      return;
    }

    // Not using the one in currency utils yet because still bugs there
    final NumberFormat currencyFormat =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    text = text.replaceAll(RegExp(r'[^\d]'), '');
    double value = double.tryParse(text) ?? 0;
    String formattedText = currencyFormat.format(value);

    _shippingController.value = TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: _shippingController,
          unfocusTapOutside: true,
          // bug Initial value not set yet although orderfee exist
          labelText: 'Tambahan',
          hintText: 'Masukan Tambahan',
          textInputType: const TextInputType.numberWithOptions(
            decimal: false,
            signed: false,
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Row(
          children: [
            SizedBox(
              width: context.isMobile ? 0 : 200,
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
                disabled: _shippingController.text.trim().isEmpty,
                label: 'Proses',
                onTap: () async {
                  String cleannedText =
                      _shippingController.text.replaceAll(RegExp(r'[^\d]'), '');
                  int fee = int.tryParse(cleannedText) ?? 0;
                  ref.read(cartProvider.notifier).setOrderFee(fee);
                  context.pop();
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
