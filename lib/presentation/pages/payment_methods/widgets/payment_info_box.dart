import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extension.dart';
import '../../../../core/utils/currency_utils.dart';
import '../../../widgets/core/container/custom_rounded_container.dart';
import '../../../widgets/core/text/custom_text_style.dart';

class PaymentInfoBox extends StatelessWidget {
  const PaymentInfoBox({
    super.key,
    required this.title,
    required this.nominal,
    required this.colorStart,
    required this.colorEnd,
    this.isTextRow = false,
  });
  final String title;
  final String nominal;
  final Color colorStart;
  final Color colorEnd;
  final bool isTextRow;
  @override
  Widget build(BuildContext context) {
    return CustomRoundedContainer(
      height: context.isMobile ? 60 : 100,
      gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colorStart,
            colorEnd,
          ]),
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: _content(
            isTextRow: isTextRow,
            isMobile: context.isMobile,
          )),
    );
  }

  Widget _content({required bool isTextRow, isMobile = false}) {
    return isTextRow
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: CustomTextStyle.tabletDialogText
                      .copyWith(color: Colors.white),
                ),
                const SizedBox(height: 8),
                Text(
                  formatStringIDRToCurrency(text: nominal, symbol: 'Rp '),
                  textAlign: TextAlign.center,
                  style: isMobile
                      ? CustomTextStyle.h5.copyWith(color: Colors.white)
                      : CustomTextStyle.h4.copyWith(color: Colors.white),
                ),
              ],
            ),
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: CustomTextStyle.mobileDialogText
                    .copyWith(color: Colors.white),
              ),
              SizedBox(height: isMobile ? 0 : 8),
              Text(
                formatStringIDRToCurrency(text: nominal, symbol: 'Rp '),
                textAlign: TextAlign.center,
                style: isMobile
                    ? CustomTextStyle.tabletDialogText
                        .copyWith(color: Colors.white)
                    : CustomTextStyle.h4.copyWith(color: Colors.white),
              ),
            ],
          );
  }
}
