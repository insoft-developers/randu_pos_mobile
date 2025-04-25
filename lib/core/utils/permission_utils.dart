import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../presentation/widgets/core/text/custom_text.dart';

Future<void> checkPermission(
    {required Permission permission,
      required VoidCallback onGrantedPermissionCallback,
      required VoidCallback onPermanentlyDeniedPermissionCallback}) async {
  PermissionStatus status = await permission.status;

  if ((status == PermissionStatus.denied )|| (status == PermissionStatus.permanentlyDenied)) {
    print('request permission ${permission.toString()}');
    status = await permission.request();
    print('after request permission $status');
  }
  print('status $status');

  if (status == PermissionStatus.granted || status == PermissionStatus.limited) {
    onGrantedPermissionCallback();
  } else if (status == PermissionStatus.permanentlyDenied) {
    onPermanentlyDeniedPermissionCallback();
  }
}

enum PermissionTypeEnum { microphone, photos, camera, location, bluetooth }

Future<void> permissionPermanentlyDeniedPopUp(BuildContext context,
    {required PermissionTypeEnum permissionType}) async {
  if (permissionType == PermissionTypeEnum.microphone) {
    return permissionRequestConfirmationDialog(
      context,
      'Randu Would Like to Access the Microphone',
      'This app require access to microphone to be able to practice or evaluate speaking',
    );
  } else if (permissionType == PermissionTypeEnum.photos) {
    return permissionRequestConfirmationDialog(
      context,
      'Randu Would Like to Access the Gallery',
      'This app require access to gallery to be able to select and upload image',
    );
  } else if (permissionType == PermissionTypeEnum.camera) {
    return permissionRequestConfirmationDialog(
      context,
      'Randu Would Like to Access the Camera',
      'This app require access to camera to be able to take and upload image',
    );
  }else if (permissionType == PermissionTypeEnum.location) {
    return permissionRequestConfirmationDialog(
      context,
      'Randu Would Like to Access the Location',
      'This app require access to location to be able to get your location',
    );
  }else if (permissionType == PermissionTypeEnum.bluetooth) {
    return permissionRequestConfirmationDialog(
      context,
      'Randu Would Like to Access the Bluetooth',
      'This app require access to bluetooth to be able to connect printer',
    );
  }
}

Future<void> permissionRequestConfirmationDialog(BuildContext context, String title, String content) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: CustomText(
          title,
          style: CustomTextStyle.h6,
        ),
        content: CustomText(
            content),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const CustomText('Open settings'),
                onPressed: () {
                  Navigator.pop(context);
                  openAppSettings();
                },
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const CustomText('Close'),
                onPressed: () => Navigator.pop(context),
              )
            ],
          ),
        ],
      );
    },
  );
}
