import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oktoast/oktoast.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core/enum/response_state.dart';
import '../../../../../domain/entities/printer/paper_size.dart';
import '../../../../../domain/entities/printer/printer_folder/printer_folder.dart';
import '../../../../../domain/entities/printer/printer_mode_enum.dart';
import '../../../../../domain/entities/printer/printer_model/printer_model.dart';
import '../../../../../domain/entities/result.dart';
import '../../../../../domain/usecases/printer/multi_printer/delete_printer_folder/delete_printer_folder_uc.dart';
import '../../../../../domain/usecases/printer/multi_printer/edit_printer_folder/edit_printer_folder_uc.dart';
import '../../../../../domain/usecases/printer/multi_printer/get_printer_folder/get_printer_folder_uc.dart';
import '../../../../../domain/usecases/printer/multi_printer/get_printer_folders/get_printer_folders_uc.dart';
import '../../../../../domain/usecases/printer/multi_printer/save_printer_folder/save_printer_folder_uc.dart';
import '../../../usecases/printer/multi_printer/delete_printer_folder/delete_printer_folder_uc_provider.dart';
import '../../../usecases/printer/multi_printer/edit_printer_folder/edit_printer_folder_uc_provider.dart';
import '../../../usecases/printer/multi_printer/get_printer_folder/get_printer_folder_uc_provider.dart';
import '../../../usecases/printer/multi_printer/get_printer_folders/get_printer_folders_uc_provider.dart';
import '../../../usecases/printer/multi_printer/save_printer_folder/save_printer_folder_uc_provider.dart';

part 'printer_multi_provider.freezed.dart';
part 'printer_multi_provider.g.dart';
part 'printer_multi_state.dart';

@Riverpod(keepAlive: true)
class PrinterMulti extends _$PrinterMulti {
  @override
  PrinterMultiState build() {
    return const PrinterMultiState();
  }

  //SET INITIAL PRINTER FOLDERS
  Future<void> setInitialPrinterFolders() async {
    print('set initial');
    GetPrinterFoldersUC uc = ref.read(getPrinterFoldersUCProvider);
    final result = await uc(null);
    if (result is Success<List<PrinterFolder>?>) {
      print('success');
      if (result.resultValue == null || result.resultValue!.isEmpty) {
        // If no printer folders are found, set the default printer folders
        state = state.copyWith(printerFolders: [
          defaultPrinterFolder,
          defaultCheckerFolder,
          defaultDailyRecapFolder
        ]);
        // Save the printer folders to local storage
        SavePrinterFolderUC savePrinterFolderUC =
        ref.read(savePrinterFolderUCProvider);
        await savePrinterFolderUC(defaultPrinterFolder);
        await savePrinterFolderUC(defaultCheckerFolder);
        await savePrinterFolderUC(defaultDailyRecapFolder);
        getPrinterFolders();
      } else {
        print('not initialize printer multi');
      }
    } else if (result is Failed) {
      if (kDebugMode) {
        print('Error set initial printer folders: $result');
      }
      state = state.copyWith(message: result.errorMessage);
    } else if (result.isSuccess && result.resultValue != null) {
      state = state.copyWith(printerFolders: result.resultValue);
    } else {
      print('whats ');
    }
  }

  Future<void> getPrinterFolders() async {
    GetPrinterFoldersUC uc = ref.read(getPrinterFoldersUCProvider);
    final result = await uc(null);

    if (result is Success<List<PrinterFolder>?>) {
      if (result.resultValue == null || result.resultValue!.isEmpty) {
        await setInitialPrinterFolders(); // Note: might need to await this
      } else {
        await updatePrinterFoldersProperties();
      }
      state = state.copyWith(printerFolders: result.resultValue);
    } else if (result is Failed) {
      state = state.copyWith(message: result.errorMessage);
    } else {
      print('Unexpected result type: ${result.runtimeType}');
    }
  }

  Future<void> savePrinterFolder(PrinterFolder printerFolder) async {
    SavePrinterFolderUC uc = ref.read(savePrinterFolderUCProvider);
    final result = await uc(printerFolder);

    switch (result) {
      case Success(value: String message):
        getPrinterFolders();
        state = state.copyWith(message: message);
        break;
      case Failed(message: String message):
        state = state.copyWith(message: message);
        break;
    }
  }

  Future<void> deletePrinterFolder(String id) async {
    DeletePrinterFolderUC uc = ref.read(deletePrinterFolderUCProvider);
    final result = await uc(id);

    switch (result) {
      case Success(value: String message):
        state = state.copyWith(message: message);
        break;
      case Failed(message: String message):
        state = state.copyWith(message: message);
        break;
    }
  }

  Future<void> editPrinterFolder(PrinterFolder printerFolder) async {
    EditPrinterFolderUC uc = ref.read(editPrinterFolderUCProvider);
    final result = await uc(printerFolder);

    switch (result) {
      case Success(value: String message):
        state = state.copyWith(message: message);
        break;
      case Failed(message: String message):
        state = state.copyWith(message: message);
        break;
    }
  }

  Future<void> saveChanges() async {
    SavePrinterFolderUC uc = ref.read(savePrinterFolderUCProvider);
    getPrinterFolders();
    final printerFolder = state.printerFolders;
    if (printerFolder == null || printerFolder.isEmpty) {
      return;
    }
    for (var i = 0; i < printerFolder.length; i++) {
      final folder = printerFolder[i];
      final result = await uc(folder);
      switch (result) {
        case Success(value: String message):
          state = state.copyWith(message: message);
          break;
        case Failed(message: String message):
          state = state.copyWith(message: message);
          break;
      }
    }
    getPrinterFolders();
  }

  void setPaperSizePrinter(PrinterModel printer, PrinterFolder folder,
      PaperSizeModel paperSize) {
    // Check if the printer already exists in the folder
    if (!folder.printer.contains(printer)) {
      showToast('Printer not found in the folder');
      return;
    }

    // Create a new list with the added printer
    final updatedPrinters = [...folder.printer];

    // Update the folder with the new list
    final index = updatedPrinters
        .indexWhere((element) => element.macAddress == printer.macAddress);
    if (index != -1) {
      updatedPrinters[index] = printer.copyWith(paperSize: paperSize);
    }

    final updatedFolder = folder.copyWith(printer: updatedPrinters);

    // Update the list of folders in state
    final listFolder = [...?state.printerFolders];
    final indexFolder =
    listFolder.indexWhere((element) => element.id == folder.id);
    if (indexFolder != -1) {
      listFolder[indexFolder] = updatedFolder;
    }

    // Update the state with the new list
    state = state.copyWith(printerFolders: listFolder);
  }

  void deletePrinterFromFolder(PrinterModel printer, PrinterFolder folder) {
    final listFolder = [...?state.printerFolders];
    final index = listFolder.indexWhere((element) => element.id == folder.id);
    if (index != -1) {
      final updatedPrinters = [...folder.printer];
      updatedPrinters.remove(printer);
      final updatedFolder = folder.copyWith(printer: updatedPrinters);
      listFolder[index] = updatedFolder;
    }
    state = state.copyWith(printerFolders: listFolder);
  }

  //get printer available in the spesific folder
  Future<PrinterModel?> getPrinterAvailable(PrinterTypeEnum type) async {
    getPrinterFolders();
    print('get printer available');
    final printerFolders = state.printerFolders;
    print('init printer folder : ${printerFolders?.length ?? 'zeroo'}');
    if (type == PrinterTypeEnum.allReceipt) {
      print('type all receipt');
      bool isAllReceiptPrinterSet = false;
      //CHECK PRINTER CASHIER
      if (printerFolders == null || printerFolders.isEmpty) {
        showToast('Printer cashier is not found');
        return null;
      }
      final folderCashier = printerFolders.firstWhereOrNull((value) =>
      value.type == PrinterTypeEnum.cashier);
      if (folderCashier == null) return null;
      if (folderCashier.printer.isEmpty) {
        showToast('Printer cashier is not found');
        return null;
      }
      return folderCashier.printer.first;
    } else {
      print('type : $type');
      // CHECK PRINTER CASHIER

      print('Available types in printerFolders ${type.name}:');
      print('before loop');
      // for (var folder in printerFolders??[]) {
      //   print('Folder type: ${folder.type}');
      // }
      print('after loop');
      if (printerFolders == null) {
        showToast('Printer cashier is not found');
        return null;
      }
      print('before folder');
      final folder =
      printerFolders.firstWhereOrNull((element) => element.type == type);
      if (folder == null) {
        showToast('Type printer not found');
        return null;
      } else {
        return folder.printer.isNotEmpty ? folder.printer.first : null;
      }
    }
  }

  Future<PrinterModel?> checkPrinter(PrinterTypeEnum type) async {
    await getPrinterFolders();
    if (state.printerFolders == null) return null;
    final folder =
    state.printerFolders?.firstWhereOrNull((element) => element.type == type);
    if (folder == null) return null;
    return folder.printer.first;
    // return null;
  }

  Future<PaperSizeModel?> getPaperSize(String id) async {
    // GET PRINTER FOLDER
    GetPrinterFolderUC uc = ref.read(getPrinterFolderUCProvider);
    final result = await uc(id);
    if (result is Success<PrinterFolder?>) {
      if (result.resultValue == null) {
        return null;
      } else {
        state = state.copyWith(
            paperSizeSinglePrinter: result.resultValue?.printer.first
                .paperSize);
        return result.resultValue!.printer.first.paperSize;
      }
    } else if (result is Failed) {
      if (kDebugMode) {
        print('Error get printer folder: $result');
      }
      return null;
    }
    return null;
  }

  updatePrinterFoldersProperties() async {
    print('update printer folder properties');
    // GET PRINTER FOLDERS
    GetPrinterFoldersUC uc = ref.read(getPrinterFoldersUCProvider);
    final foldersResult = await uc(null); // Renamed to foldersResult

    if (foldersResult is Success<List<PrinterFolder>?>) {
      if (foldersResult.resultValue == null ||
          foldersResult.resultValue!.isEmpty) {
        return;
      }
      for (var i = 0; i < foldersResult.resultValue!.length; i++) {
        PrinterFolder folder = foldersResult.resultValue![i];
        String nameFolder = folder.name;
        if (i == 0) {
          nameFolder = 'Cashier';
        } else if (i == 1) {
          nameFolder = 'Checker';
        } else if (i == 2) {
          nameFolder = 'QR Code, Rekapitulasi Harian';
        }
        folder = folder.copyWith(name: nameFolder);
        EditPrinterFolderUC uc = ref.read(editPrinterFolderUCProvider);
        final editResult = await uc(folder); // Renamed to editResult
        switch (editResult) {
          case Success(value: String message):
            break;
          case Failed(message: String message):
            break;
        }
      }
    }
  }
}