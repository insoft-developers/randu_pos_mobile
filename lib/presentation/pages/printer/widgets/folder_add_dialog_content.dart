import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../widgets/core/buttons/primary_button.dart';
import '../../../widgets/core/text/custom_text.dart';
import '../../../widgets/core/text_fields/custom_text_field.dart';

class FolderAddDialogMobile extends ConsumerStatefulWidget {
  const FolderAddDialogMobile({super.key});

  @override
  ConsumerState<FolderAddDialogMobile> createState() =>
      _FolderAddDialogMobileState();
}

class _FolderAddDialogMobileState extends ConsumerState<FolderAddDialogMobile> {
  final TextEditingController _textEditingController = TextEditingController();
  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            top: 16,
            left: 16,
            right: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const CustomText('Tambah Folder'),
              const SizedBox(
                height: 8,
              ),
              CustomTextField(
                hintText: 'Folder',
                maxLine: 1,
                onFieldSubmitted: (value) {},
                onSaved: (value) {},
                textInputAction: TextInputAction.done,
                onChanged: (value) {
                  _textEditingController.text = value;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              PrimaryButton(
                radius: 8,
                // expandableHeight: true,
                preFixWidget: const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Icon(Icons.add),
                ),
                label: 'SIMPAN',
                onTap: () {
                  context.pop();
                  // ref
                  //     .read(printerServiceProvider.notifier)
                  //     .addFolder(_textEditingController.text);
                },
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }
}
