import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_customer_request_model.freezed.dart';
part 'get_customer_request_model.g.dart';

@freezed
class GetCustomerRequestModel with _$GetCustomerRequestModel {
  const factory GetCustomerRequestModel({
    @JsonKey(name: 'search') String? search,
    @JsonKey(name: 'page') int? page,
    @JsonKey(name: 'limit') int? limit,
  }) = _GetCustomerRequestModel;

  factory GetCustomerRequestModel.fromJson(Map<String, dynamic> json) =>
      _$GetCustomerRequestModelFromJson(json);
}
