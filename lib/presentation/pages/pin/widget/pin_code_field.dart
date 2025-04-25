import 'package:custom_pin_screen/custom_pin_screen.dart';
import 'package:flutter/material.dart';
import '../../../../core/const/colors.dart';

/// PinCodeField
class PinCodeField extends StatelessWidget {
  const PinCodeField({
    super.key,
    required this.pin,
    required this.pinCodeFieldIndex,
    required this.theme,
  });

  /// The pin code
  final String pin;

  /// The the theme of the pin code field
  final PinTheme theme;

  /// The index of the pin code field
  final int pinCodeFieldIndex;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: MediaQuery.of(context).size.width < 400 ? 45 : 50,
      width: MediaQuery.of(context).size.width < 400 ? 45 : 50,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color:
            CustomColors.lightBackgroundBodyBackground, //getFillColorFromIndex,
        borderRadius: BorderRadius.circular(16),
        shape: BoxShape.rectangle,
        border: Border.all(
          color: CustomColors.primaryColor, //getFillColorFromIndex,
          width: 1,
        ),
      ),
      duration: const Duration(microseconds: 40000),
      child: pin.length > pinCodeFieldIndex
          ? const Icon(
              Icons.circle,
              color: CustomColors.primaryColor,
              size: 12,
            )
          : const SizedBox(),
    );
  }
}
