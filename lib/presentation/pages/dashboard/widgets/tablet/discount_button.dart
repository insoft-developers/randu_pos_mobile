import 'package:flutter/material.dart';

import '../../../../widgets/core/buttons/randu_button.dart';

class DiscountButton extends StatelessWidget {
  const DiscountButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RanduButton(icon: Icons.percent_rounded, onPressed: () {});
  }
}
