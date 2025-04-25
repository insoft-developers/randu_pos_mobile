import 'package:flutter/material.dart';

import '../../../../widgets/core/buttons/randu_button.dart';

class SavedTransactionButton extends StatelessWidget {
  const SavedTransactionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RanduButton(
        icon: Icons.food_bank_rounded, text: 'Tersimpan', onPressed: () {});
  }
}
