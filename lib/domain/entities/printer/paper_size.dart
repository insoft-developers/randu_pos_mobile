import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

part 'paper_size.freezed.dart';
part 'paper_size.g.dart';

@freezed
class PaperSizeModel with _$PaperSizeModel {
  @HiveType(typeId: 16, adapterName: 'PaperSizeModelAdapter')
  const factory PaperSizeModel({
    @HiveField(0) required String id,
    @HiveField(1) required String name,
    @HiveField(2) required int width,
  }) = _PaperSizeModel;

  factory PaperSizeModel.fromJson(Map<String, dynamic> json) =>
      _$PaperSizeModelFromJson(json);
}

PaperSizeModel paperSize80mm = const PaperSizeModel(
  id: '80mm',
  name: '80mm',
  width: 558,
);

PaperSizeModel paperSize72mm = const PaperSizeModel(
  id: '72mm',
  name: '72mm',
  width: 512,
);

PaperSizeModel paperSize58mm = const PaperSizeModel(
  id: '58mm',
  name: '58mm',
  width: 384,
);

extension PaperSizeModelExtension on PaperSizeModel {
  PaperSize get size {
    switch (id) {
      case '80mm':
        return PaperSize.mm80;
      case '72mm':
        return PaperSize.mm72;
      case '58mm':
        return PaperSize.mm58;
      default:
        return PaperSize.mm80;
    }
  }
}
