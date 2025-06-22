import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

import '../../domain/entities/user_model.dart';
import '../../presentation/pages/premium.dart';
import '../network.dart';

import 'package:get/get.dart';

class PremiumController extends GetxController {
  Future cekPremium(BuildContext context) async {
    final box = Hive.box<UserModel>('userBox');

    if (box.isEmpty) {
      print('User data not found in Hive box');
      return;
    }

    UserModel? userdata = box.getAt(0);

    String userid = userdata!.id.toString();
    String username = userdata.username.toString();

    print('userdata: $userdata');
    var data = {'userid': userid, 'username': username};

    var res = await Network().auth(data, '/journal/check-omset');

    // Penanganan parsing response lebih aman
    var result = jsonDecode(res.body);
    if (result['success']) {
      print('lanjut gunakan');
      return true;
    } else {
      print('update dolu dong');
      return Navigator.push(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => const Premium()),
      );
    }
  }
}
