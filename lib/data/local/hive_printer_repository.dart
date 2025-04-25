import 'package:flutter/foundation.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

import '../../core/const/constant.dart';
import '../../domain/entities/printer/printer_folder/printer_folder.dart';
import '../../domain/entities/printer/printer_model/printer_model.dart';
import '../../domain/entities/result.dart';
import '../repositories/i_printer_repository.dart';

class HivePrinterRepository implements IPrinterRepository {
  @override
  Future<Result<String>> saveSinglePrinter(PrinterModel model) async {
    try {
      var box = await Hive.openBox<PrinterModel>(printerBox);
      await box.put('singlePrinter', model);
      return const Result.success('Printer saved successfully');
    } catch (e) {
      if (kDebugMode) {
        print('Error saving printer: $e');
      }
      return Result.failed(e.toString());
    }
  }

  @override
  Future<Result<String>> deleteSinglePrinter() async {
    try {
      var box = await Hive.openBox<PrinterModel>(printerBox);
      await box.delete('singlePrinter');
      return const Result.success('Printer deleted successfully');
    } catch (e) {
      if (kDebugMode) {
        print('Error deleting printer: $e');
      }
      return Result.failed(e.toString());
    }
  }

  @override
  Future<Result<PrinterModel?>> getSinglePrinter() async {
    try {
      var box = await Hive.openBox<PrinterModel>(printerBox);
      var printer = box.get('singlePrinter');
      return Result.success(printer);
    } catch (e) {
      if (kDebugMode) {
        print('Error retrieving printer: $e');
      }
      return Result.failed(e.toString());
    }
  }

  @override
  Future<Result<String>> editSinglePrinter({
    required PrinterModel printer,
  }) async {
    try {
      var box = await Hive.openBox<PrinterModel>(printerBox);
      var existingPrinter = box.get('singlePrinter');

      if (existingPrinter != null) {
        await box.put('singlePrinter', printer);
        return const Result.success('Printer updated successfully');
      } else {
        return const Result.failed('Printer not found or MAC address mismatch');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error editing printer: $e');
      }
      return Result.failed(e.toString());
    }
  }

  @override
  Future<Result<List<PrinterFolder>>> getPrinterFolders() async {
    try {
      var box = await Hive.openBox<PrinterFolder>(printerMultiData);
      var printerFolders = box.values.toList();
      return Result.success(printerFolders);
    } catch (e) {
      if (kDebugMode) {
        print('Error retrieving printer folders: $e');
      }
      return Result.failed(e.toString());
    }
  }

  @override
  Future<Result<PrinterFolder?>> getPrinterFolder(String id) async {
    try {
      var box = await Hive.openBox<PrinterFolder>(printerMultiData);
      var printerFolder = box.get(id);

      return Result.success(printerFolder);
    } catch (e) {
      if (kDebugMode) {
        print('Error retrieving printer folder: $e');
      }
      return Result.failed(e.toString());
    }
  }

  @override
  Future<Result<String>> savePrinterFolder(PrinterFolder folder) async {
    try {
      var box = await Hive.openBox<PrinterFolder>(printerMultiData);
      await box.put(folder.id, folder);
      return const Result.success('Printer folder saved successfully');
    } catch (e) {
      if (kDebugMode) {
        print('Error saving printer folder: $e');
      }
      return Result.failed(e.toString());
    }
  }

  @override
  Future<Result<String>> deletePrinterFolder(String id) async {
    try {
      var box = await Hive.openBox<PrinterFolder>(printerMultiData);
      await box.delete(id);
      return const Result.success('Printer folder deleted successfully');
    } catch (e) {
      if (kDebugMode) {
        print('Error deleting printer folder: $e');
      }
      return Result.failed(e.toString());
    }
  }

  @override
  Future<Result<String>> editPrinterFolder(PrinterFolder folder) async {
    try {
      var box = await Hive.openBox<PrinterFolder>(printerMultiData);
      var existingFolder = box.get(folder.id);

      if (existingFolder != null) {
        await box.put(folder.id, folder);
        return const Result.success('Printer folder updated successfully');
      } else {
        return const Result.failed('Printer folder not found or ID mismatch');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error editing printer folder: $e');
      }
      return Result.failed(e.toString());
    }
  }

  @override
  Future<Result<String>> deletePrinterMode() async {
    try {
      var box = await Hive.openBox<String>(printerModeBox);
      await box.delete(printerModeBox);
      return const Result.success('Printer mode deleted successfully');
    } catch (e) {
      if (kDebugMode) {
        print('Error deleting printer folder: $e');
      }
      return Result.failed(e.toString());
    }
  }

  @override
  Future<Result<String?>> getPrinterMode() async{
    try {
      var box = await Hive.openBox<String>(printerModeBox);
      var printer = box.get(printerModeBox);
      return Result.success(printer);
    } catch (e) {
      if (kDebugMode) {
        print('Error retrieving printer mode: $e');
      }
      return Result.failed(e.toString());
    }
  }

  @override
  Future<Result<String>> savePrinterMode(String printerMode) async{
    try {
      var box = await Hive.openBox<String>(printerModeBox);
      await box.put(printerModeBox, printerMode);
      return const Result.success('Printer mode saved successfully');
    } catch (e) {
      if (kDebugMode) {
        print('Error saving printer mode: $e');
      }
      return Result.failed(e.toString());
    }
  }
}
