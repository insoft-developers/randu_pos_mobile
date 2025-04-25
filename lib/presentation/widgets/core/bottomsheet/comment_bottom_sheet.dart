import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/const/colors.dart';
import '../../../../core/extensions/context_extension.dart';
import '../buttons/primary_button.dart';
import '../text/custom_text.dart';
import '../text_fields/custom_text_field.dart';

class CommentBottomSheet extends StatelessWidget {
  final String title;
  final String initialComment;
  final Function(String) onSave;
  final VoidCallback onCancel;

  const CommentBottomSheet({
    super.key,
    required this.title,
    required this.initialComment,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          top: 16,
          left: 16,
          right: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(context.isMobile ? 12 : 16),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
              color: CustomColors.primaryColor,
            ),
            child: Center(
              child: CustomText(
                title,
                style: context.isMobile
                    ? CustomTextStyle.mobileDialogTitle
                    : CustomTextStyle.tabletDialogTitle,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          InputCommentBottomSheet(
            initialComment: initialComment,
            onSave: onSave,
            onCancel: onCancel,
          ),
          const SizedBox(
            height: 24,
          )
        ],
      ),
    );
  }
}

class InputCommentBottomSheet extends ConsumerStatefulWidget {
  final String initialComment;
  final Function(String) onSave;
  final VoidCallback onCancel;

  const InputCommentBottomSheet({
    super.key,
    required this.initialComment,
    required this.onSave,
    required this.onCancel,
  });

  @override
  ConsumerState<InputCommentBottomSheet> createState() =>
      _InputCommentBottomSheetState();
}

class _InputCommentBottomSheetState
    extends ConsumerState<InputCommentBottomSheet> {
  late String _comment;

  @override
  void initState() {
    super.initState();
    _comment = widget.initialComment;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          initialValue: _comment,
          onChanged: (value) {
            setState(() {
              _comment = value;
            });
          },
          hintText: 'Contoh: Agak pedas ...',
        ),
        const SizedBox(
          height: 24,
        ),
        Row(
          children: [
            SizedBox(
              width: context.isMobile ? 0 : 200,
            ),
            Expanded(
                child: PrimaryButton(
              label: 'Batal',
              onTap: () {
                widget.onCancel();
                Navigator.pop(context);
              },
              buttonPrimaryType: ButtonPrimaryType.outlinedError,
            )),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: PrimaryButton(
                label: 'Simpan',
                onTap: () {
                  widget.onSave(_comment);
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
