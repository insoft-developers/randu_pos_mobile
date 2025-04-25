import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
class CategoryModel with _$CategoryModel {
  @HiveType(typeId: 5, adapterName: 'CategoryModelAdapter')
  const factory CategoryModel({
    @HiveField(0) required int id,
    @HiveField(1) String? code,
    @HiveField(2) String? name,
    DateTime? created,
    @HiveField(3) @JsonKey(name: 'user_id') required int userId,
    String? image,
    String? description,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}
