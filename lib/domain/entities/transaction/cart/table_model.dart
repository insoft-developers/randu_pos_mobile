// To parse this JSON data, do
//
//     final tableModel = tableModelFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';

part 'table_model.freezed.dart';
part 'table_model.g.dart';

enum TableAvailability { available, reserved }

TableModel tableModelFromJson(String str) =>
    TableModel.fromJson(json.decode(str));

String tableModelToJson(TableModel data) => json.encode(data.toJson());

@freezed
class TableModel with _$TableModel {
  const TableModel._();
  @HiveType(typeId: 10, adapterName: 'TableModelAdapter')
  const factory TableModel({
    @HiveField(0) @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'user_id') int? userId,
    @HiveField(1) @JsonKey(name: 'no_meja') String? noMeja,
    @HiveField(2) @JsonKey(name: 'qr_id') String? qrId,
    @HiveField(3) @JsonKey(name: 'qr_link') String? qrLink,
    @HiveField(4) @JsonKey(name: 'availability') String? availability,
    @JsonKey(name: 'branch_id') int? branchId,
    @JsonKey(name: 'branch_name') String? branchName,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _TableModel;

  TableAvailability getAvailability() {
    if (availability == 'Available') {
      return TableAvailability.available;
    } else {
      return TableAvailability.reserved;
    }
  }

  factory TableModel.fromJson(Map<String, dynamic> json) =>
      _$TableModelFromJson(json);
}
