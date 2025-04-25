import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extension.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    super.key,
    required this.mobileBody,
    required this.tabletBody,
  });

  final Widget mobileBody;
  final Widget tabletBody;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (context.isMobile) {
          return mobileBody;
        } else {
          return tabletBody;
        }
      },
    );
  }
}
