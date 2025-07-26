import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

import '../../domain/entities/user_model.dart';
import '../../presentation/pages/premium.dart';
import '../network.dart';

import 'package:get/get.dart';

class PremiumController extends GetxController {
  Future<void> cekPremium({
    required Function onNotPremium,
    required Function onPremium,
  }) async {
    final box = Hive.box<UserModel>('userBox');

    if (box.isEmpty) {
      print('User data not found in Hive box');
      return;
    }

    UserModel? userdata = box.getAt(0);
    String userid = userdata!.id.toString();
    String username = userdata.username.toString();

    var data = {'userid': userid, 'username': username};

    try {
      var res = await Network().auth(data, '/journal/check-omset');
      var result = jsonDecode(res.body);

      if (result['success']) {
        onPremium(); // Premium valid
      } else {
        onNotPremium(); // Navigasi ke halaman premium
      }
    } catch (e, stack) {
      debugPrint('Error cekPremium: $e');
      debugPrint('$stack');
    }
  }
}
