import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/const/colors.dart';
import '../utils.dart';

class ProductAddFab extends ConsumerWidget {
  const ProductAddFab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FloatingActionButton(
          foregroundColor: CustomColors.white,
          backgroundColor: CustomColors.primaryColor,
          onPressed: () async {
            await onPressedFab(ref, null);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
