import 'dart:convert';

import 'package:get/get.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

import '../../domain/entities/user_model.dart';
import '../network.dart';

class PaymentMethodController extends GetxController {
  var flagData = List.empty().obs;
  var loading = false.obs;
  var selectedFlagRow = <String, dynamic>{}.obs;
  var selectedFlagId = ''.obs;
  var selectedFlagName = 'No Flag'.obs;
  var totalPaid = 0.0.obs;

  void setSelectedFlag(Map<String, dynamic> pilihan) {
    selectedFlagRow.value = pilihan;
    selectedFlagId.value = pilihan['id'].toString();
    selectedFlagName.value = pilihan['flag'].toString();
    print(selectedFlagName);
  }

  void getFlagData(String? code) async {
    loading(true);
    final box = Hive.box<UserModel>('userBox');
    UserModel? userdata = box.getAt(0);
    String? userid = userdata?.id.toString();
    var data = {'userid': userid, 'code': code};

    var res = await Network().auth(data, '/get_flag_data');
    var body = jsonDecode(jsonEncode(res.body));
    var result = jsonDecode(body);
    if (result['success']) {
      loading(false);
      flagData.value = result['data'];
      print(flagData);
      selectedFlagId.value = '';
      selectedFlagName.value = 'No Flag';
      selectedFlagRow.value = <String, dynamic>{};
    }
  }
}
