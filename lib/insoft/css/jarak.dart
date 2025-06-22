import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Jarak extends StatelessWidget {
  double tinggi;
  Jarak({super.key, required this.tinggi});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: tinggi,
    );
  }
}
