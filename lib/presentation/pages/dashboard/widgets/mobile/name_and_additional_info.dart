import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/const/colors.dart';
import '../../../../../core/extensions/context_extension.dart';
import '../../../../providers/cores/router/go_router_provider.dart';
import '../../../../providers/main/cart/cart_provider.dart';
import '../../../../widgets/core/buttons/primary_button.dart';
import '../../../../widgets/core/text/custom_text.dart';
import '../select_or_input_customer.dart';

class NameAndAdditionalInfo extends StatelessWidget {
  const NameAndAdditionalInfo({super.key});

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
                'Info tambahan / nama pelanggan',
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
          const InputNameAndAdditionalInfo(),
          const SizedBox(
            height: 24,
          )
        ],
      ),
    );
  }
}

class InputNameAndAdditionalInfo extends ConsumerStatefulWidget {
  const InputNameAndAdditionalInfo({super.key});

  @override
  ConsumerState<InputNameAndAdditionalInfo> createState() =>
      _InputNameAndAdditionalInfoState();
}

class _InputNameAndAdditionalInfoState
    extends ConsumerState<InputNameAndAdditionalInfo> {
  @override
  Widget build(BuildContext context) {
    final nameAndInfo = ref.watch(cartProvider).customer;
    return Column(
      children: [
        // CustomTextField(
        //   initialValue: nameAndInfo ?? '',
        //   onChanged: (value) {
        //     ref.read(cartProvider.notifier).setNote(value);
        //   },
        //   hintText: 'Masukan info tambahan / nama pelanggan',
        // ),
        const SelectOrInputCustomer(),
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
                disabled: (nameAndInfo == null),
                label: 'Simpan',
                onTap: () {
                  ref.read(routerProvider).pop();
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
