import 'package:flutter/material.dart';

import 'widget.dart';

class PinBodyMobile extends StatelessWidget {
  const PinBodyMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PinHeaderMobile(),
          PinInput(),
        ],
      ),
    );
  }
}
