import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/const/colors.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/utils/confirmation_dialog.dart';
import '../../../core/utils/currency_utils.dart';
import '../../../domain/usecases/report/outlet_expense/create_outlet_expense/create_outlet_expense_uc.dart';
import '../../providers/main/report/outlet_expense/create_outlet_expense/create_outlet_expense_provider.dart';
import '../../widgets/core/buttons/primary_button.dart';
import '../../widgets/core/text/custom_text.dart';
import '../../widgets/core/text_fields/custom_text_field.dart';

class CreateExpenseForm extends StatelessWidget {
  final String title;
  final Function(String, String) onSave;
  final VoidCallback onCancel;

  const CreateExpenseForm({
    super.key,
    required this.title,
    required this.onSave,
    required this.onCancel,
  });

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
                title,
                style: context.isMobile
                    ? CustomTextStyle.mobileDialogTitle
                    : CustomTextStyle.tabletDialogTitle,
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          InputCreateExpenseForm(
            onSave: onSave,
            onCancel: onCancel,
          ),
          const SizedBox(
            height: 24,
          )
        ],
      ),
    );
  }
}

class InputCreateExpenseForm extends ConsumerStatefulWidget {
  final Function(String, String) onSave;
  final VoidCallback onCancel;

  const InputCreateExpenseForm({
    super.key,
    required this.onSave,
    required this.onCancel,
  });

  @override
  ConsumerState<InputCreateExpenseForm> createState() =>
      _InputCreateExpenseFormState();
}

class _InputCreateExpenseFormState
    extends ConsumerState<InputCreateExpenseForm> {
  late String name;
  late String amount;

  final TextEditingController _nominalController = TextEditingController();
  final CurrencyInputFormatter _formatter =
      CurrencyInputFormatter(symbol: 'Rp ');

  @override
  void initState() {
    _nominalController.addListener(_formatInput);
    super.initState();
  }

  @override
  void dispose() {
    _nominalController.removeListener(_formatInput);

    super.dispose();
  }

  void _formatInput() {
    String current = _nominalController.text;

    // Only format if there's a change in the numeric value
    String numericOnly = _formatter.stripFormat(current);
    String formatted = _formatter.formatCurrency(numericOnly);

    if (current != formatted) {
      _nominalController.value = TextEditingValue(
        text: formatted,
        selection: TextSelection.collapsed(
          offset: formatted.length,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          onChanged: (value) {
            setState(() {
              name = value;
            });
          },
          hintText: ' Nama pengeluaran',
        ),
        const SizedBox(
          height: 24,
        ),
        CustomTextField(
          controller: _nominalController,
          onChanged: (value) {
            if (_nominalController.text.isEmpty) {
              return;
            }
            setState(() {
              amount = formatIDRCurrencyToStringDigit(_nominalController.text);
            });
          },
          textInputType: TextInputType.number,
          hintText: 'Nominal',
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
                widget.onCancel();
                Navigator.pop(context);
              },
              buttonPrimaryType: ButtonPrimaryType.outlinedError,
            )),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: PrimaryButton(
                label: 'Simpan',
                onTap: () async {
                  final result = await context.confirmationPopUp(
                      context: context,
                      titleMessage: 'Konfirmasi',
                      content:
                          'Apakah anda yakin ingin menambahkan pengeluaran ini?',
                      type: DialogType.warning);
                  if (result != null && result) {
                    final params = CreateOutletExpenseParams(
                        amount: int.parse(amount), name: name);
                    ref
                        .read(createOutletExpenseProvider.notifier)
                        .createOutletExpense(params);
                    if (context.mounted) {
                      context.pop();
                    }
                  }
                  // widget.onSave(name, amount);
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
