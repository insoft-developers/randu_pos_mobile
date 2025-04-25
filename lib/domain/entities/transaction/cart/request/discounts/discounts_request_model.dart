import 'package:freezed_annotation/freezed_annotation.dart';

part 'discounts_request_model.freezed.dart';
part 'discounts_request_model.g.dart';

@freezed
class DiscountsRequestModel with _$DiscountsRequestModel {
  const factory DiscountsRequestModel({
    String? search,
    int? perPage,
    String? groupBy,
    bool? all,
  }) = _DiscountsRequestModel;

  factory DiscountsRequestModel.fromJson(Map<String, dynamic> json) =>
      _$DiscountsRequestModelFromJson(json);
}
