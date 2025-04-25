import 'package:freezed_annotation/freezed_annotation.dart';

part 'general_request_model.freezed.dart';
part 'general_request_model.g.dart';

@freezed
class GeneralRequestModel with _$GeneralRequestModel {
  @JsonSerializable(includeIfNull: false)
  const factory GeneralRequestModel({
    String? search,
    @JsonKey(name: 'per_page') int? perPage,
    @JsonKey(name: 'group_by') String? groupBy,
    bool? all,
    int? page,
    String? date,
    String? bulan,
    String? tahun,
    @JsonKey(name: 'selected_range') String? selectedRange,
    String? endDate,
    String? startDate,
    @JsonKey(name: 'transaction_status') int? transactionStatus,
  }) = _GeneralRequestModel;

  factory GeneralRequestModel.fromJson(Map<String, dynamic> json) =>
      _$GeneralRequestModelFromJson(json);
}
