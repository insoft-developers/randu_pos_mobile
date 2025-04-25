import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:oktoast/oktoast.dart';

import '../../../../core/extensions/context_extension.dart';
import '../../../../core/utils/debouncer.dart';
import '../../../../domain/entities/customer/customer_model.dart';
import '../../../../core/const/colors.dart';
import '../../../providers/main/cart/cart_provider.dart';
import '../../../providers/main/customer/create_customer_provider.dart';
import '../../../widgets/core/buttons/primary_button.dart';
import '../../../widgets/core/text/custom_text.dart';
import '../../../widgets/core/text_fields/custom_text_field.dart';

class PhoneNumberInput extends StatelessWidget {
  const PhoneNumberInput({super.key});

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
                'Tambah Pelanggan',
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
          const InputPhoneNumber(),
          const SizedBox(
            height: 24,
          )
        ],
      ),
    );
  }
}

class InputPhoneNumber extends ConsumerStatefulWidget {
  const InputPhoneNumber({super.key});

  @override
  ConsumerState<InputPhoneNumber> createState() => _InputPhoneNumberState();
}

class _InputPhoneNumberState extends ConsumerState<InputPhoneNumber> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final Debouncer _debouncer = Debouncer(milliseconds: 500);

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(createCustomerProvider, (previous, next) {
      final value = next.value;
      if (next is AsyncData) {
        if (value?.id != null) {
          showToast('Berhasil menambahkan pelanggan (${value?.name})');
          context.pop();
        }
      } else if (next is AsyncError) {
        showToast('Gagal menambahkan pelanggan');
      }
    });
    return Column(
      children: [
        CustomTextField(
          controller: _nameController,
          unfocusTapOutside: true,
          labelText: 'Nama Pelanggan',
          hintText: 'Masukan nama',
          onChanged: (value) {
            _debouncer.run(() {
              ref
                  .read(createCustomerProvider.notifier)
                  .setCustomerName(_nameController.text);
            });
          },
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: _phoneController,
          unfocusTapOutside: true,
          labelText: 'Nomor handphone',
          hintText: 'Masukan nomor handphone',
          textInputType: const TextInputType.numberWithOptions(
            decimal: false,
            signed: false,
          ),
          onChanged: (value) {
            _debouncer.run(() {
              ref
                  .read(createCustomerProvider.notifier)
                  .setCustomerPhone(_phoneController.text);
            });
          },
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
                disabled: _nameController.text.trim().isEmpty ||
                    _phoneController.text.trim().isEmpty,
                label: 'Proses',
                isLoading: ref.watch(createCustomerProvider).isLoading,
                onTap: () async {
                  ref.read(createCustomerProvider.notifier).createCustomer(
                      name: _nameController.text, phone: _phoneController.text);
                  CustomerModel customer = CustomerModel(
                      name: _nameController.text, phone: _phoneController.text);
                  ref.read(cartProvider.notifier).setCustomer(customer);
                  // Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
