import 'package:flutter/material.dart';

extension BottomReachExtension on ScrollController {
  void onBottomReach(VoidCallback callback, {double sensitivity = 250.0}) {
    addListener(() {
      final maxScroll = position.maxScrollExtent;
      final currentScroll = position.pixels;
      if (maxScroll - currentScroll <= sensitivity) {
        callback();
      }
    });
  }
}
