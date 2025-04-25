import 'package:flutter/material.dart';

import '../../../../widgets/core/buttons/randu_button.dart';

class OrderFeeButton extends StatelessWidget {
  const OrderFeeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RanduButton(
        icon: Icons.monetization_on, text: 'Fee Order', onPressed: () {});
  }
}
