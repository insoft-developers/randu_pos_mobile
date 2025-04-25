import 'package:flutter/material.dart';

import '../../../../widgets/core/loading/skeleton.dart';

class ProductLoading extends StatelessWidget {
  final int totalList;
  final EdgeInsetsGeometry padding;
  final bool isExpanded;

  const ProductLoading({
    super.key,
    this.totalList = 10,
    this.isExpanded = true,
    this.padding = const EdgeInsets.all(0),
  });

  @override
  Widget build(BuildContext context) {
    if (isExpanded) {
      return Expanded(
        child: _content(),
      );
    } else {
      return _content();
    }
  }

  Padding _content() {
    return Padding(
      padding: padding,
      child: ListView.separated(
        itemCount: totalList,
        itemBuilder: (context, index) => const ListTile(
          dense: true,
          horizontalTitleGap: 20,
          leading: Skeleton(
            width: 35,
            height: 35,
            circle: true,
          ),
          title: Padding(
            padding: EdgeInsets.only(right: 50),
            child: Skeleton(
              width: 50,
              height: 16,
              radius: 20,
            ),
          ),
          trailing: Skeleton(
            width: 75,
            height: 16,
            radius: 20,
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(
          height: 8,
        ),
      ),
    );
  }
}
