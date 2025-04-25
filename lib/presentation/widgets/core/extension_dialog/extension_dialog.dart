import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../domain/entities/general_response.dart';
import '../../../../core/misc/app_image.dart';
import '../buttons/primary_button.dart';
import '../text/custom_text.dart';

extension CustomDialog on BuildContext {
  Future<void> showLoadingDialog({
    bool barrierDismissible = false,
    String? title,
  }) {
    return showGeneralDialog(
      barrierColor: Colors.black.withValues(alpha: 0.6),
      transitionDuration: const Duration(milliseconds: 400),
      context: this,
      barrierDismissible: barrierDismissible,
      barrierLabel: MaterialLocalizations.of(this).modalBarrierDismissLabel,
      pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        return Align(
          alignment: Alignment.center,
          child: Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Material(
              type: MaterialType.transparency,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CircularProgressIndicator(),
                    const SizedBox(height: 8),
                    CustomText(title ?? 'Loading...'),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<bool?> showResultDialog({
    required GeneralResponse baseResponse,
    bool barrierDismissible = false,
  }) {
    return showGeneralDialog(
      barrierColor: Colors.black.withValues(alpha: 0.6),
      transitionDuration: const Duration(milliseconds: 400),
      context: this,
      barrierDismissible: barrierDismissible,
      barrierLabel: MaterialLocalizations.of(this).modalBarrierDismissLabel,
      pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        double width = MediaQuery.of(context).size.width;
        return SizedBox(
          width: width > 700 ? 450 : width * 0.8,
          child: Align(
            alignment: Alignment.center,
            child: Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Material(
                type: MaterialType.transparency,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      getLottieImage(
                        baseResponse.status ? 'success' : 'error',
                        height: 200,
                        width: 200,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        baseResponse.message ?? 'Error',
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        width: width > 700 ? 400 : 250,
                        child: PrimaryButton(
                            label: 'OK',
                            onTap: () {
                              context.pop(true);
                            }),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<bool?> showPhoto({
    required String title,
    required XFile attachment,
    Function()? onRetry,
    bool barrierDismissible = false,
  }) {
    return showGeneralDialog(
      barrierColor: Colors.black.withValues(alpha: 0.6),
      transitionDuration: const Duration(milliseconds: 400),
      context: this,
      barrierDismissible: barrierDismissible,
      barrierLabel: MaterialLocalizations.of(this).modalBarrierDismissLabel,
      pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        // double width = MediaQuery.of(context).size.width;
        final isPortrait =
            MediaQuery.of(context).orientation == Orientation.portrait;
        final width = isPortrait
            ? MediaQuery.of(context).size.width
            : MediaQuery.of(context).size.height;
        return Align(
          alignment: Alignment.center,
          child: Material(
            color: Colors.transparent,
            child: FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, -0.1),
                  end: Offset.zero,
                ).animate(animation),
                child: Container(
                  width: width > 700 ? 450 : width * 0.8,
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.2),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomText(title, style: CustomTextStyle.h5),
                      const SizedBox(height: 16),
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                maxHeight: width * 0.7,
                              ),
                              child: Image.file(
                                File(attachment.path),
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          if (onRetry != null)
                            Positioned(
                              top: 8,
                              right: 8,
                              child: IconButton(
                                icon: const Icon(Icons.refresh,
                                    color: Colors.white),
                                onPressed: () {
                                  context.pop(false);
                                  onRetry();
                                },
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: PrimaryButton(
                              buttonPrimaryType:
                                  ButtonPrimaryType.outlinedWhitePrimary,
                              label: 'Cancel',
                              onTap: () {
                                context.pop(false);
                              },
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: PrimaryButton(
                              label: 'OK',
                              onTap: () {
                                context.pop(true);
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<bool?> showPhotoUrl({
    required BuildContext context,
    required String title,
    required String imageUrl,
    bool barrierDismissible = false,
  }) {
    return showGeneralDialog(
      barrierColor: Colors.black.withValues(alpha: 0.6),
      transitionDuration: const Duration(milliseconds: 400),
      context: context,
      barrierDismissible: barrierDismissible,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        final isPortrait =
            MediaQuery.of(context).orientation == Orientation.portrait;
        final width = isPortrait
            ? MediaQuery.of(context).size.width
            : MediaQuery.of(context).size.height;
        return Align(
          alignment: Alignment.center,
          child: Material(
            color: Colors.transparent,
            child: FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, -0.1),
                  end: Offset.zero,
                ).animate(animation),
                child: Container(
                  width: width > 700 ? 450 : width * 0.8,
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.2),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomText(title, style: CustomTextStyle.h5),
                      const SizedBox(height: 16),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: width * 0.7,
                          ),
                          child: Image.network(
                            imageUrl,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                                null &&
                                            loadingProgress
                                                    .expectedTotalBytes !=
                                                0
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : null,
                                  ),
                                );
                              }
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return const Center(
                                child: Icon(
                                  Icons.error,
                                  color: Colors.red,
                                  size: 50,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: PrimaryButton(
                              label: 'OK',
                              onTap: () {
                                Navigator.of(context).pop(true);
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

//TODO PLACE CONFIRMATION DIALOG HERE
}
