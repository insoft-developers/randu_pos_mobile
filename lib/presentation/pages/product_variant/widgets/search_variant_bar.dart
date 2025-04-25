import 'package:flutter/material.dart';

class SearchVariantBar extends StatelessWidget {
  const SearchVariantBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        hintText: 'Cari',
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32)),
        ),
        contentPadding: EdgeInsets.all(0),
      ),
    );
  }
}
