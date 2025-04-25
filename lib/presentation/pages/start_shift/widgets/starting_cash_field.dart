import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

import '../../../../core/extensions/context_extension.dart';
import '../../../../core/utils/currency_utils.dart';
import '../../../../domain/entities/user_model.dart';
import '../../../providers/main/transaction_provider.dart';
import '../../../widgets/core/buttons/primary_button.dart';
import '../../../widgets/core/text_fields/custom_text_field.dart';

class StartingCashField extends ConsumerStatefulWidget {
  const StartingCashField({super.key});

  @override
  ConsumerState<StartingCashField> createState() => _StartingCashFieldState();
}

class _StartingCashFieldState extends ConsumerState<StartingCashField> {
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final CurrencyInputFormatter _formatter =
      CurrencyInputFormatter(symbol: 'Rp ');

  @override
  void initState() {
    super.initState();
    _controller.addListener(_formatInput);
  }

  @override
  void dispose() {
    _controller.removeListener(_formatInput);
    _controller.dispose();
    super.dispose();
  }

  void _formatInput() {
    String current = _controller.text;

    // Only format if there's a change in the numeric value
    String numericOnly = _formatter.stripFormat(current);
    String formatted = _formatter.formatCurrency(numericOnly);

    if (current != formatted) {
      _controller.value = TextEditingValue(
        text: formatted,
        selection: TextSelection.collapsed(
          offset: formatted.length,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          CustomTextField(
            controller: _controller,
            validator: (value) {
              final user = Hive.box<UserModel>('userBox').get('userBox');
              final pettyCash = user?.pettyCash ?? 0;
              if (pettyCash == 1) {
                if (value == null || value.isEmpty) {
                  return 'Mohon masukan kas awal';
                }
              }
              return null;
            },
            hintText: 'Masukan Kas Awal',
            textInputType: const TextInputType.numberWithOptions(
                decimal: false, signed: false),
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            children: [
              SizedBox(
                width: context.isMobile ? 0 : 350,
              ),
              Expanded(
                child: PrimaryButton(
                  disabled: false,
                  isLoading: ref.watch(transactionDataProvider).isLoading,
                  label: 'Proses',
                  onTap: () async {
                    if (!_formkey.currentState!.validate()) {
                      return;
                    }
                    Navigator.pop(context);
                    final amount = int.parse(
                        formatIDRCurrencyToStringDigit(_controller.text));
                    await ref
                        .read(transactionDataProvider.notifier)
                        .openCashier(initialCashAmount: amount);

                    log(formatIDRCurrencyToStringDigit(_controller.text));
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
