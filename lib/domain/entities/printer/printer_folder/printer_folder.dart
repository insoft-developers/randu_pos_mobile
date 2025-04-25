import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';

import '../paper_size.dart';
import '../printer_mode_enum.dart';
import '../printer_model/printer_model.dart';

part 'printer_folder.freezed.dart';
part 'printer_folder.g.dart';

final listPageSize = [
  MapEntry('58mm', paperSize58mm),
  MapEntry('80mm', paperSize80mm),
];

const defaultPrinterFolder = PrinterFolder(
  id: 'cashier',
  name: 'Cashier',
  printer: [],
  typeString: 'cashier',
  isReceipt: true,
);

const defaultCheckerFolder = PrinterFolder(
  id: 'checker',
  name: 'Checker',
  printer: [],
  typeString: 'checker',
  isReceipt: true,
);

const defaultDailyRecapFolder = PrinterFolder(
  id: 'dailyRecap',
  name: 'QR Code, Rekapitulasi Harian',
  printer: [],
  typeString: 'dailyRecap',
  isReceipt: false,
);

@Freezed(makeCollectionsUnmodifiable: false)
class PrinterFolder with _$PrinterFolder {
  @HiveType(typeId: 18, adapterName: 'PrinterFolderAdapter')
  const factory PrinterFolder(
      {@HiveField(0) required String id,
      @HiveField(1) required String name,
      @HiveField(2) required List<PrinterModel> printer,
      @HiveField(3) required String typeString,
      @HiveField(4) required bool isReceipt}) = _PrinterFolder;

  factory PrinterFolder.fromJson(Map<String, dynamic> json) =>
      _$PrinterFolderFromJson(json);
}

extension PrinterFolderExtension on PrinterFolder {
  PrinterTypeEnum get type {
    switch (typeString) {
      case 'cashier':
        return PrinterTypeEnum.checker;
      case 'checker':
        return PrinterTypeEnum.cashier;
      case 'dailyRecap':
        return PrinterTypeEnum.dailyRecap;
      default:
        return PrinterTypeEnum.allReceipt;
    }
  }
}
