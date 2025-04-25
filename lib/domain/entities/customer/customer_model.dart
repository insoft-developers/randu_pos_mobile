import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';

part 'customer_model.freezed.dart';
part 'customer_model.g.dart';

@freezed
class CustomerModel with _$CustomerModel {
  const CustomerModel._();
  @HiveType(typeId: 9, adapterName: 'CustomerModelAdapter')
  factory CustomerModel({
    @HiveField(0) int? id,
    @HiveField(1) String? name,
    @HiveField(2) String? phone,
    @HiveField(3) @JsonKey(name: 'user_id') int? userId,
  }) = _CustomerModel;

  String get customer {
    if (id == null) {
      return name ?? '';
    }
    return id.toString();
  }

  factory CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerModelFromJson(json);
}
