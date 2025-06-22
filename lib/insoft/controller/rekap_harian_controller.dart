import 'dart:convert';

import 'package:get/get.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

import '../../domain/entities/user_model.dart';
import '../network.dart';

class RekapHarianController extends GetxController {
  var rekapHarianData = List.empty().obs;
  var loading = false.obs;
  var selectedDate = ''.obs;
  var todayDate = ''.obs;

  void changeSelectedDate(String date) {
    selectedDate.value = date;
    getRekapData(date);
  }

  void getRekapData(String tanggal) async {
    loading(true);
    final box = Hive.box<UserModel>('userBox');
    UserModel? userdata = box.getAt(0);
    String? userid = userdata?.id.toString();
    var data = {'userid': userid, 'date': tanggal};

    var res = await Network().auth(data, '/rekap-v2');
    var body = jsonDecode(jsonEncode(res.body));
    var result = jsonDecode(body);
    if (result['success']) {
      loading(false);
      rekapHarianData.value = result['data'];
    }
  }
}
