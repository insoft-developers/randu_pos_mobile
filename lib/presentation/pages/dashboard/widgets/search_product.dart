import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/const/colors.dart';

import '../../../../core/utils/debouncer.dart';
import '../../../providers/main/cart/search_product/search_product_provider.dart';
import '../../../widgets/core/container/custom_rounded_container.dart';
import '../../../widgets/core/text_fields/custom_text_field.dart';

class SearchProductDashboard extends ConsumerStatefulWidget {
  const SearchProductDashboard({super.key});

  @override
  ConsumerState createState() => _SearchProductState();
}

class _SearchProductState extends ConsumerState<SearchProductDashboard> {
  final Debouncer _debouncer = Debouncer(milliseconds: 500);
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _debouncer.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomRoundedContainer(
      // padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      radius: 12,
      shadow: const [],
      margin: const EdgeInsets.all(0),
      child: CustomTextField(
        controller: _controller,
        onChanged: (value) {
          _debouncer.run(() {
            FocusManager.instance.primaryFocus?.unfocus();
            ref
                .read(searchProductProvider.notifier)
                .setSearchParam(param: _controller.text);
          });
        },
        prefixIcon: const Icon(Icons.search),
        suffixIcon: GestureDetector(
          onTap: () {
            ref.read(searchProductProvider.notifier).setSearchParam(param: '');
            _controller.text = '';
            ref.read(activateSearchProductProvider.notifier).toggleSearch();
          },
          child: const Icon(
            Icons.cancel_outlined,
            color: CustomColors.lightErrorMain,
          ),
        ),
        hintText: 'Cari Menu',
      ),
    );
  }
}
