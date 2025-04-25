import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/const/colors.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/utils/custom_alert_dialog.dart';
import '../../../../core/utils/rounded_bottom_sheet.dart';
import '../../../providers/main/cart/variant_selection/variant_selection_provider.dart';
import '../../../widgets/core/bottomsheet/comment_bottom_sheet.dart';
import '../../../widgets/core/container/custom_rounded_container.dart';
import '../../../widgets/core/text/custom_text.dart';

class AddProductNote extends StatelessWidget {
  const AddProductNote({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomRoundedContainer(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shadow: const [],
      height: 50,
      width: context.isMobile ? null : 170,
      radius: 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Consumer(builder: (context, ref, child) {
            final note = ref
                .watch(variantSelectionProvider.select((value) => value.note));
            return GestureDetector(
              onTap: () async {
                final builder = CommentBottomSheet(
                  title: 'Masukkan Catatan',
                  initialComment: note,
                  onSave: (comment) {
                    // Handle save action, e.g., update state or send to server
                    ref
                        .read(variantSelectionProvider.notifier)
                        .setNote(comment);
                  },
                  onCancel: () {
                    // Handle cancel action
                    print('Comment editing canceled');
                  },
                );

                if (context.isMobile) {
                  await showRoundedBottomSheet(
                    context: context,
                    isDismissible: false,
                    onClose: (value) {
                      print(value);
                    },
                    builder: (context) => builder,
                    enableDrag: false,
                  );
                } else {
                  await showCustomAlertDialog(
                    context: context,
                    onClose: (value) {
                      print(value);
                    },
                    builder: (context) => AlertDialog(
                        content: SizedBox(
                      width: 550,
                      child: builder,
                    )),
                  );
                }
                // await showRoundedBottomSheet(
                //   context: context,
                //   isDismissible: false,
                //   onClose: (value) {
                //     print(value);
                //   },
                //   builder: (context) => builder,
                //   enableDrag: false,
                // );
              },
              child: CustomText(
                note.isEmpty ? 'Tambah Catatan' : note,
                style: CustomTextStyle.mobileDialogText,
              ),
            );
          })),
          const SizedBox(
            width: 8,
          ),
          const Icon(
            Icons.edit_note,
            color: CustomColors.darkGray,
            size: 24,
          )
        ],
      ),
    );
  }
}
