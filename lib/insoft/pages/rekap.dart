import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../presentation/widgets/core/responsive/responsive_layout.dart';
import '../controller/rekap_harian_controller.dart';
import 'rekap_mobile.dart';
import 'rekap_tablet.dart';
import 'package:get/get.dart';

class Rekap extends StatelessWidget {
  Rekap({super.key});
  final RekapHarianController _rhc = Get.put(RekapHarianController());

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedDate = DateFormat('yyyy-MM-dd').format(now);
    _rhc.selectedDate.value = formattedDate;
    _rhc.todayDate.value = formattedDate;
    _rhc.getRekapData(_rhc.selectedDate.value);
    return ResponsiveLayout(
      mobileBody: RekapMobile(),
      tabletBody: RekapTablet(),
    );
  }
}
