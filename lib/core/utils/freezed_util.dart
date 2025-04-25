import 'package:json_annotation/json_annotation.dart';

/// To handle data from json that have 2 possible value between int or string
/// and can be null as well
class IntOrStringConverter implements JsonConverter<int?, dynamic> {
  const IntOrStringConverter();

  @override
  int? fromJson(dynamic json) {
    if (json == null) {
      return null;
    } else if (json is int) {
      return json;
    } else if (json is String) {
      return int.tryParse(json);
    } else {
      throw Exception('Invalid type for int field');
    }
  }

  @override
  dynamic toJson(int? object) {
    return object;
  }
}
