import 'package:flutter/material.dart';

import '../../../../core/const/colors.dart';
import '../../../widgets/core/container/custom_rounded_container.dart';
import '../../../widgets/core/text/custom_text.dart';

enum AttendanceTypeEnum { attendanceIn, attendanceOut }

class InfoAttendanceWidget extends StatelessWidget {
  const InfoAttendanceWidget({
    super.key,
    required this.type,
    required this.value,
  });
  final AttendanceTypeEnum type;
  final String value;
  @override
  Widget build(BuildContext context) {
    return CustomRoundedContainer(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: CustomText(
              type == AttendanceTypeEnum.attendanceIn ? 'IN' : 'OUT',
              style: CustomTextStyle.h6Bold.copyWith(
                  color: type == AttendanceTypeEnum.attendanceIn
                      ? CustomColors.lightSuccessMain
                      : CustomColors.lightErrorMain,
                  fontSize: 16),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CustomText(':'),
          ),
          Expanded(
            flex: 8,
            child: Text(
              value,
              style: CustomTextStyle.h6Bold
                  .copyWith(color: CustomColors.blue, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
