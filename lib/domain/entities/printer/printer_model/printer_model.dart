import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

import '../paper_size.dart';

part 'printer_model.freezed.dart';
part 'printer_model.g.dart';

@freezed
class PrinterModel with _$PrinterModel {
  @HiveType(typeId: 17, adapterName: 'PrinterModelAdapter')
  const factory PrinterModel(
      {@HiveField(0) String? id,
      @HiveField(1) required String name,
      @HiveField(2) required String macAddress,
      int? deviceId,
      int? vendorId,
      int? productId,
      @HiveField(3)@Default(0) int type,
      @HiveField(4) PaperSizeModel? paperSize,
      @HiveField(5) @Default(false) bool isSelected}) = _PrinterModel;

  factory PrinterModel.fromJson(Map<String, dynamic> json) =>
      _$PrinterModelFromJson(json);
}

extension PrinterModelExtension on PrinterModel {
  bool is58mm() {
    return paperSize?.id == '58mm';
  }

  bool is80mm() {
    return paperSize?.id == '80mm';
  }

  String get paperSizeString {
    switch (paperSize?.id) {
      case '58mm':
        return '58mm';
      case '80mm':
        return '80mm';
      default:
        return '80mm';
    }
  }
}
