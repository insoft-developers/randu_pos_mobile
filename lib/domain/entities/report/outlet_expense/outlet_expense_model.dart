import 'package:freezed_annotation/freezed_annotation.dart';

part 'outlet_expense_model.freezed.dart';
part 'outlet_expense_model.g.dart';

@freezed
class OutletExpenseModel with _$OutletExpenseModel {
  factory OutletExpenseModel({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'user_id') int? userId,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'amount') int? amount,
    // TODO : Make sure sync status data type
    @JsonKey(name: 'sync_status') dynamic syncStatus,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _OutletExpenseModel;

  factory OutletExpenseModel.fromJson(Map<String, dynamic> json) =>
      _$OutletExpenseModelFromJson(json);
}
