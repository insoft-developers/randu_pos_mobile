import 'package:flutter/material.dart';

import '../../widgets/core/responsive/responsive_layout.dart';
import 'daily_recap_page_mobile.dart';
import 'daily_recap_page_tablet.dart';

class DailyRecapPage extends StatelessWidget {
  const DailyRecapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileBody: DailyRecapPageMobile(),
      tabletBody: DailyRecapPageTablet(),
    );
  }
}
