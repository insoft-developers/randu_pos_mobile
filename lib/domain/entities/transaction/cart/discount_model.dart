import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';

part 'discount_model.freezed.dart';
part 'discount_model.g.dart';

@freezed
class DiscountModel with _$DiscountModel {
  @HiveType(typeId: 8, adapterName: 'DiscountModelAdapter')
  const factory DiscountModel({
    @HiveField(0) required int id,
    @HiveField(1) String? name,
    @HiveField(2) String? code,
    @HiveField(3) String? type,
    @HiveField(4) int? value,
    @HiveField(5) @JsonKey(name: 'expired_at') String? expiredAt,
    @HiveField(6) @JsonKey(name: 'min_order') int? minOrder,
    @HiveField(7) @JsonKey(name: 'account_id') int? accountId,
    @HiveField(8) @JsonKey(name: 'max_use') int? maxUse,
    @HiveField(9)
    @JsonKey(name: 'allowed_multiple_use')
    int? allowedMultipleUse,
    @HiveField(10) @JsonKey(name: 'discount_use') int? discountUse,
    @HiveField(11)
    @JsonKey(name: 'discount_allowed_use')
    int? discountAllowedUse,
  }) = _DiscountModel;
  factory DiscountModel.fromJson(Map<String, dynamic> json) =>
      _$DiscountModelFromJson(json);
}
