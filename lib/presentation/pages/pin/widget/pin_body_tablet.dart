import 'package:flutter/material.dart';

import '../../../../core/const/colors.dart';
import 'widget.dart';

class PinBodyTablet extends StatelessWidget {
  const PinBodyTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MediaQuery.of(context).size.width > 800
              ? Expanded(
                  child: Image.asset(
                    'assets/images/login-hero.webp',
                    fit: BoxFit.fitWidth,
                  ),
                )
              : const SizedBox(),
          Container(
            width: MediaQuery.of(context).size.width > 800 ? 450 : 400,
            height: MediaQuery.of(context).size.height / 1.2,
            padding: const EdgeInsets.only(
              top: 24,
              left: 24,
              right: 24,
              bottom: 24,
            ),
            decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: CustomColors.gray,
                    blurRadius: 4,
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(16))),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                PinHeaderTablet(),
                PinInput(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
