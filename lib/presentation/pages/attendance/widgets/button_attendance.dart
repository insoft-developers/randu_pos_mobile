import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../core/utils/permission_utils.dart';
import '../../../../domain/entities/attendance/attendance_model.dart';
import '../../../../core/utils/confirmation_dialog.dart';
import '../../../providers/main/attendance/set_attendance_param_provider/set_attendance_param_provider.dart';
import '../../../widgets/core/buttons/primary_button.dart';

class ButtonAttendance extends StatelessWidget {
  const ButtonAttendance({
    super.key,
    required this.ref,
    required this.attendanceModel,
  });
  final WidgetRef ref;
  final AttendanceModel? attendanceModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: PrimaryButton(
            disabled: (attendanceModel != null &&
                    !attendanceModel!.haveBeenCompleted) &&
                (attendanceModel != null && attendanceModel!.haveBeenIn),
            buttonPrimaryType: ButtonPrimaryType.solidSuccess,
            label: 'MASUK',
            onTap: () async {
              checkPermission(
                permission: Permission.location,
                onGrantedPermissionCallback: () {
                  checkPermission(permission: Permission.camera, onGrantedPermissionCallback: ()=>onTap(context, 'Masuk'), onPermanentlyDeniedPermissionCallback: () => permissionPermanentlyDeniedPopUp(context, permissionType: PermissionTypeEnum.camera));
                },
                onPermanentlyDeniedPermissionCallback: () =>
                    permissionPermanentlyDeniedPopUp(
                      context,
                      permissionType: PermissionTypeEnum.location,
                    ),
              );

            },
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: PrimaryButton(
            disabled: (attendanceModel != null &&
                    attendanceModel!.haveBeenCompleted) &&
                (attendanceModel != null && attendanceModel!.haveBeenIn),
            buttonPrimaryType: ButtonPrimaryType.solidWarning,
            label: 'PULANG',
            onTap: () async {
              checkPermission(
                permission: Permission.location,
                onGrantedPermissionCallback: () {
                  checkPermission(permission: Permission.camera, onGrantedPermissionCallback: ()=>onTap(context, 'Pulang'), onPermanentlyDeniedPermissionCallback: () => permissionPermanentlyDeniedPopUp(context, permissionType: PermissionTypeEnum.camera));
                },
                onPermanentlyDeniedPermissionCallback: () =>
                    permissionPermanentlyDeniedPopUp(
                      context,
                      permissionType: PermissionTypeEnum.location,
                    ),
              );
            },
          ),
        ),
      ],
    );
  }

  onTap(BuildContext context, String type) async {
    final result = await context.confirmationPopUp(
      titleMessage: 'Peringatan',
      content: 'Apakah anda yakin ingin $type?',
      context: context,
      type: DialogType.warning,
    );
    if (result != null && result) {
      ref
          .read(setAttendanceParamProvider.notifier)
          .pickImage(type);
    }
  }
}
