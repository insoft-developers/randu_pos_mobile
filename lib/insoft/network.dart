import 'dart:convert';

import 'package:http/http.dart' as http;

import '../core/const/constant.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

class Network {
  // #DEVELOPMENT
  // final String _url = Constant.BASE_URL + 'public/api';

  // #LIVE SERVER
  final String _url = endpointApi;

  var token;

  _getToken() {
    final tokenBox = Hive.box<String>('token');
    var tokens = tokenBox.get('token');
    token = jsonDecode(json.encode(tokens.toString()));
  }

  auth(data, apiURL) async {
    var fullUrl = _url + apiURL;
    await _getToken();
    return await http.post(Uri.parse(fullUrl),
        body: jsonEncode(data), headers: _setHeaders());
  }

  getData(apiURL) async {
    var fullUrl = _url + apiURL;
    await _getToken();
    return await http.get(
      Uri.parse(fullUrl),
      headers: _setHeaders(),
    );
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
}
