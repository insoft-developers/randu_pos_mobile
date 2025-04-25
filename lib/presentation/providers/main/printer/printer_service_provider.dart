import 'dart:io';

import 'package:app_settings/app_settings.dart';
import 'package:collection/collection.dart';
import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:oktoast/oktoast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/const/constant.dart';
import '../../../../core/enum/response_state.dart';
import '../../../../core/utils/bluetooth_service.dart';
import '../../../../data/dummies/printer_dummies.dart';
import '../../../../domain/entities/printer/paper_size.dart';
import '../../../../domain/entities/printer/printer_folder/printer_folder.dart';
import '../../../../domain/entities/printer/printer_mode_enum.dart';
import '../../../../domain/entities/printer/printer_model/printer_model.dart';
import '../../../../domain/entities/transaction/cart/request/payment/payment_request_model.dart';
import '../../../../domain/entities/user_model.dart';
import '../../../../domain/usecases/printer/printer_mode/get_printer_mode/get_printer_mode_uc.dart';
import '../../../../domain/usecases/printer/printer_mode/save_printer_mode/save_printer_mode_uc.dart';
import '../../../../domain/usecases/printer/single/get_single_printer/get_single_printer_uc.dart';
import '../../../../domain/usecases/printer/single/save_single_printer/save_single_printer_uc.dart';
import '../../../pages/receipt/receipt_utils.dart';
import '../../usecases/printer/printer_mode/get_printer_mode/get_printer_mode_uc_provider.dart';
import '../../usecases/printer/printer_mode/save_printer_mode/save_printer_mode_uc_provider.dart';
import '../../usecases/printer/single/get_single_printer/get_single_printer_uc_provider.dart';
import '../../usecases/printer/single/save_single_printer/save_single_printer_uc_provider.dart';
import 'multi_printer/printer_multi_provider.dart';
import 'single/printer_single_provider.dart';

part 'printer_service_provider.freezed.dart';
part 'printer_service_provider.g.dart';
part 'printer_service_state.dart';

@Riverpod(keepAlive: true)
class PrinterService extends _$PrinterService {
  @override
  PrinterServiceState build() {
    // final PaperSize paperSize = ref.read(userDataProvider
    //     .select((value) => value.value?.user?.paperSize ?? PaperSize.mm80));
    return PrinterServiceState(paperSizeSinglePrinter: paperSize80mm);
  }

  // ignore: avoid_public_notifier_properties
  final bluetoothPermissionHandler = BluetoothPermissionHandler();

  void setPaperSize(PaperSizeModel paperSize) {
    state = state.copyWith(paperSizeSinglePrinter: paperSize);
    final connectedPrinter = state.connectedPrinter;
    if (connectedPrinter != null) {
      final newPrinter = connectedPrinter.copyWith(
        paperSize: paperSize,
      );
      updatePrinter(newPrinter);
    }
  }

  void updatePrinter(PrinterModel printer) {
    state = state.copyWith(connectedPrinter: printer);
    saveSelectedPrinter(printer);
  }

  void chooseSinglePrinter(PrinterModel selectedPrinter) {
    final newListPrinter = state.printerList.map((e) {
      // If the current printer is the selected one, flip its isSelected value
      if (e == selectedPrinter) {
        return e.copyWith(isSelected: !e.isSelected); // Flip the value
      } else {
        return e.copyWith(isSelected: false); // Set all others to false
      }
    }).toList();
    //save to local
    ref
        .read(printerSingleProvider.notifier)
        .setSelectedPrinter(selectedPrinter);
    state = state.copyWith(printerList: [...newListPrinter]);
  }

  void revertListPrinter() {
    state = state.copyWith(printerList: state.tempPrinterList);
  }

  //CONNTECT SINGLE PRINTER BASED ON LIST PRINTER
  Future<void> connectSinglePrinter() async {
    // Early return if no printer is selected
    if (state.getSelectedTempPrinter == null) return;

    final selectedPrinter = state.getSelectedTempPrinter!;
    print('Selected printer: ${selectedPrinter.name}');

    // Set state to loading
    state = state.copyWith(connectBluetoothState: ResponseState.loading);
    if (fakePrinters) {
      print('You are using fake printers');
      _updatePrinterState(selectedPrinter);
      // showToast('Printer connected: ${selectedPrinter.name}');
      return;
    }

    try {
      // Check if already connected to another printer
      final bool isConnected = await PrintBluetoothThermal.connectionStatus;
      if (isConnected) {
        print('Disconnecting from current printer...');
        await PrintBluetoothThermal.disconnect;
      }

      // Connect to the new printer
      final bool isSuccess = await PrintBluetoothThermal.connect(
        macPrinterAddress: selectedPrinter.macAddress,
      );

      if (isSuccess) {
        _updatePrinterState(selectedPrinter);
        // showToast('Printer connected: ${selectedPrinter.name}');
      } else {
        throw Exception('Failed to connect to printer');
      }
    } catch (e) {
      // Handle errors
      state = state.copyWith(connectBluetoothState: ResponseState.error);
      // showToast('Error: Gagal konek ke printer, harap coba kembali');
      print('Error connecting to printer: ${e.toString()}');
    }
  }

// Helper method to update printer state
  void _updatePrinterState(PrinterModel selectedPrinter) {
    final newPrinterList = state.printerList.map((printer) {
      return printer.copyWith(
          isSelected: printer.macAddress == selectedPrinter.macAddress);
    }).toList();

    //set paper size single
    selectedPrinter = selectedPrinter.copyWith(paperSize: state.paperSizeSinglePrinter);
    saveSelectedPrinter(selectedPrinter);
    state = state.copyWith(
      connectBluetoothState: ResponseState.ok,
      connectedPrinter: selectedPrinter,
      printerList: newPrinterList,
    );
  }

  //CONNECT SINGLE PRINTER WITH SELECTED PRINTER

  // 1. CHECK IF USING FAKE PRINTER THEN RETURN
  // 2. CHECK IF ALREADY CONNECTED WITH SELECTED PRINTER THEN RETURN
  // 3. DISCONNECT PRINTER IF CONNECTED
  // 4. CONNECT WITH SELECTED PRINTER
  Future<bool> connectSinglePrinter2(PrinterModel selectedPrinter, {PaperSizeModel? paperSize}) async {
    print('connecting with ${selectedPrinter.name}');
    // 1. CHECK IF USING FAKE PRINTER
    if (fakePrinters) {
      print('you are using fake printers');
      return false;
    }

    // 2. CHECK IF ALREADY CONNECTED WITH SELECTED PRINTER
    if(state.connectedPrinter != null && state.connectedPrinter == selectedPrinter){
      print('already connected with ${selectedPrinter.name}');
      return true;
    }

    // 3. DISCONNECT PRINTER IF CONNECTED
    print('checking real connection in printer');
    final bool connectionStatus =
    await PrintBluetoothThermal.connectionStatus;
    if (connectionStatus) {
      print('Disconnecting from current printer...');
      await PrintBluetoothThermal
          .disconnect; // Disconnect if already connected
    }

    // 4. CONNECT WITH SELECTED PRINTER
    print('Connecting to ${selectedPrinter.name}');
    final responseConnectBL = await PrintBluetoothThermal.connect(
      macPrinterAddress: selectedPrinter.macAddress,
    );

    // 5. UPDATE STATE
    if(responseConnectBL){
      print('Printer connecting success');
      saveSelectedPrinter(selectedPrinter);
      state = state.copyWith(
        // connectBluetoothState: ResponseState.loading,
        connectedPrinter: selectedPrinter, // Reset connected printer
      );
      if(paperSize != null){
        state = state.copyWith(paperSizeSinglePrinter: paperSize);
      }
      return true;
    }else{
      // showToast('Printer connecting failed');
      print('Printer connecting failed');
      state = state.copyWith(
        // connectBluetoothState: ResponseState.error,
        connectedPrinter: null, // Reset connected printer
      );
      return false;
    }
  }

  Future<void> requestBluetoothPermissions() async {
    if (Platform.isAndroid) {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.bluetooth,
        Permission.bluetoothConnect,
        Permission.bluetoothScan,
      ].request();
      if (statuses[Permission.bluetooth]!.isDenied ||
          statuses[Permission.bluetoothConnect]!.isDenied ||
          statuses[Permission.bluetoothScan]!.isDenied) {
        // Permissions not granted, handle accordingly
        print('Bluetooth or Location permissions are denied');
        // You might want to show a dialog explaining why the permission is needed
      }
      checkBluetoothEnabled();
      checkLocationServices();
    }
  }

  Future<void> checkLocationServices() async {
    bool serviceEnabled = await Permission.location.serviceStatus.isEnabled;
    if (!serviceEnabled) {
      // Location services are not enabled, prompt user to enable them
      print(
          'Please enable location services for Bluetooth scanning to work properly');
    }
  }

  Future<void> checkBluetoothEnabled() async {
    bool enabled = await PrintBluetoothThermal.bluetoothEnabled;
    if (!enabled) {
      // Prompt user to enable Bluetooth
      print('Please enable Bluetooth');
      await AppSettings.openAppSettings(type: AppSettingsType.bluetooth);
    }
  }

  Future<bool> isConnected() async {
    final bool connectionStatus = await PrintBluetoothThermal.connectionStatus;
    return connectionStatus;
  }

  Future<void> startScanPrinter(
      {bool isDummy = false, bool isRefresh = true}) async {
    try {
      print('is refresh: $isRefresh');
      //if is refresh is false and list printer not empty
      if (!isRefresh && state.printerList.isNotEmpty) {
        for (var i = 0; i < state.printerList.length; i++) {
          print('printer name ${state.printerList[i].name}');
        }
        print('length ${state.printerList.length}');
        print('refresh false');
        final isPrinterConnected = await isConnected();
        if (state.connectedPrinter != null && !isPrinterConnected) {
          connectSinglePrinter2(state.connectedPrinter!);
        }
      } else {
        print('refresh true');
        if (isDummy) {
          print('is dummy');
          state = state.copyWith(scanPrinterState: ResponseState.loading);
          await Future.delayed(const Duration(seconds: 2));
          state = state.copyWith(
              printerList: listDummyPrinter,
              tempPrinterList: listDummyPrinter,
              scanPrinterState: ResponseState.ok);
          return;
        }
        await requestBluetoothPermissions();
        showToast('Start scan printer');
        state = state
            .copyWith(scanPrinterState: ResponseState.loading, printerList: []);
        debugPrint('before paired bluetooths');
        final List<BluetoothInfo> listResult =
            await PrintBluetoothThermal.pairedBluetooths;
        print('selected printer: ${state.connectedPrinter}');
        final selectedPrinter =
            await ref.read(printerSingleProvider.notifier).getSelectedPrinter();
        //auto connect printer if selected printer is not null
        if (selectedPrinter != null) {
          if (!state.printerList.contains(selectedPrinter)) {
            // await connectSinglePrinter2(selectedPrinter);
          }
        }
        final listPrinter = listResult
            .map((e) => PrinterModel(
                  name: e.name,
                  macAddress: e.macAdress,
                  isSelected: e.macAdress == state.connectedPrinter?.macAddress,
                ))
            .toList();
        debugPrint('after paired bluetooths');
        state = state.copyWith(
            printerList: listPrinter,
            tempPrinterList: listPrinter,
            scanPrinterState: ResponseState.ok);
        print('list printer after scan: ${listPrinter.length}');
      }
    } catch (e) {
      state = state.copyWith(scanPrinterState: ResponseState.error);
      print('error scan :${e.toString()}');
    }
  }

  Future<void> disconnect() async {
    try {
      final status = await PrintBluetoothThermal.connectionStatus;
      if (!status) return;
      if (kDebugMode) print('disconnect printer');
      await PrintBluetoothThermal.disconnect;
      print('status disconnect $status');
    } catch (e) {
      print('error :${e.toString()}');
    }
  }

  Future<bool> printString(PrinterTypeEnum? type) async {
    print('print testing');
    bool conexionStatus = await PrintBluetoothThermal.connectionStatus;
    if (conexionStatus) {
      String enter = '\n';
      await PrintBluetoothThermal.writeBytes(enter.codeUnits);
      String text = 'Default';
      if (type == PrinterTypeEnum.cashier) {
        text = 'Cashier';
      } else if (type == PrinterTypeEnum.checker) {
        text = 'Checker';
      }else if(type == null){
        text = '';
      }
      showToast('Printing...');
      final responseWriteString = await PrintBluetoothThermal.writeString(
          printText: PrintTextSize(size: 3, text: text));
      return responseWriteString;
    } else {
      print('not connected bluetooth');
      showToast('Printer not connected');
      return false;
    }
  }

  Future<bool> printTicket({required List<int> receiptBytes}) async {
    // TODO Don't forget to choose printer's paper
    try {
      showToast('Mencetak struk');
      bool conexionStatus = await PrintBluetoothThermal.connectionStatus;
      print('connection status: $conexionStatus');
      if (conexionStatus) {
        bool result = false;
        result = await PrintBluetoothThermal.writeBytes(receiptBytes);
        print('print test result:  $result');
        return result;
      } else {
        print('print test conexionStatus: $conexionStatus');
        disconnect();
        return false;
        //throw Exception("Not device connected");
      }
    } catch (e) {
      print('error :${e.toString()}');
      return false;
    }
  }

  Future<void> testPrintSinglePrinter(
      PrinterFolder folder, PrinterModel printer) async {
    try {
      // Check if a printer is connected
      final connectedPrinter = state.connectedPrinter;
      if (connectedPrinter != null) {
        // Show toast with connected printer details
        showToast(
          'Connected Printer: ${connectedPrinter.name}\nMAC Address: ${connectedPrinter.macAddress}',
        );
        print(
          'Connected Printer: ${connectedPrinter.name}\nMAC Address: ${connectedPrinter.macAddress}',
        );

        // Print a test string to the connected printer
        await printString(folder.type); // Call your existing printString method
      } else {
        await connectSinglePrinter();
      }
    } catch (e) {
      // Handle any errors
      showToast('Error: ${e.toString()}');
    }
  }

  void setPrinter(PrinterModel printer) {
    print('printer : $printer');

    // Create a copy of the current printer list
    List<PrinterModel> listPrinter = [...state.printerList];

    // Find the index of the printer to update
    int index = listPrinter
        .indexWhere((element) => element.macAddress == printer.macAddress);

    if (index != -1) {
      // Update the isSelected state of the printer
      PrinterModel updatedPrinter = listPrinter[index]
          .copyWith(isSelected: !listPrinter[index].isSelected);

      // Replace the old printer with the updated one
      listPrinter[index] = updatedPrinter;

      // Update the state with the new list
      state = state.copyWith(printerList: listPrinter);
    } else {
      print('Printer not found in the list');
    }
  }

  void addPrinter() {
    // Create a copy of the current printer list
    List<PrinterModel> listPrinter = [
      ...state.printerList.where((element) => element.isSelected)
    ];

    // Add the new printer to the list

    // Update the state with the new list
    state = state.copyWith(selectedPrinterList: listPrinter);
  }

  void printMultiplePrinter(
      {bool isTesting = false,
      PaymentReceiptModel? receipt,
      PrinterTypeEnum? printerType}) async {
    final bool connectionStatus = await PrintBluetoothThermal.connectionStatus;
    if (connectionStatus) {
      print('Disconnecting from current printer...');
      await PrintBluetoothThermal.disconnect; // Disconnect if already connected
    }

    final List<PrinterFolder>? printerList = await ref.read(printerMultiProvider
        .select((value) => value.printerFolders));
    print('Count of folders: ${printerList?.length}');
    if(printerList == null || printerList.isEmpty){
      print('printer list is empty');
      return;
    }
    for (PrinterFolder folder
        in printerList.where((element) => element.isReceipt == true)) {
      print('Printing for folder: ${folder.name}');

      for (PrinterModel printer in folder.printer) {
        try {
          // Connect to the current printer
          print(
              'Connecting to printer: ${printer.name} (${printer.macAddress})...');
          final bool connected = await PrintBluetoothThermal.connect(
            macPrinterAddress: printer.macAddress,
          );

          if (connected) {
            print('Successfully connected to printer: ${printer.name}');

            // Add a delay to ensure the print job is processed
            await Future.delayed(
                const Duration(milliseconds: 300)); // Increased delay
            // Send the   print job
            bool printing = true;
            if (isTesting) {
              print('printing string : ${folder.type.name}');
              printing = await printString(folder.type);
            } else {
              print('printer type : ${folder.type}');
              print('printer name : ${folder.printer.first.name}');
              print('paper size : ${folder.printer.first.paperSize}');
              printing = await printReceipt(folder.type, receipt, folder.printer.first.paperSize);
              await Future.delayed(
                  const Duration(seconds: 3)); // Increased delay
            }
            print('Print job sent to printer: ${printer.name}');

            // Disconnect from the current printer
            await PrintBluetoothThermal.disconnect;
            print('Disconnected from printer: ${printer.name}');
          } else {
            print('Failed to connect to printer: ${printer.name}');
          }
        } catch (e) {
          print('Error while printing to printer ${printer.name}: $e');
        }
      }
    }
  }

  void setModePrinter(PrinterModeEnum printerMode) async{
    disconnect();
    SavePrinterModeUC uc = await ref.read(savePrinterModeUCProvider);
    uc(printerMode.name);
    state = state.copyWith(
      printerMode: printerMode,
      connectedPrinter: null,
      // printerList: [],
      // tempPrinterList: [],
    );
  }


  Future<bool> printReceipt(
      PrinterTypeEnum type, PaymentReceiptModel? receipt, PaperSizeModel? paperSize) async {
    final profile = await CapabilityProfile.load();
    final user = Hive.box<UserModel>('userBox').get('userBox');
    return ref.read(printerServiceProvider.notifier).printTicket(
            receiptBytes: await receipt!.generateReceipt(
          user: user!,
          paperSize: paperSize?.size ?? PaperSize.mm80,
          capabilityProfile: profile,
          businessName: user.bussinessName ?? '-',
          businessAddress: user.bussinessAddress ?? '',
          footer: user.footerReceipt,
          isCashier: type == PrinterTypeEnum.cashier,
        ));
  }

  Future<void> testPrintIndiviualPrinterInMultiPrinter(
      PrinterModel printer, PrinterFolder folder) async {
    print('testPrintIndiviualPrinterInMultiPrinter : ${printer.name}');
    try {
      final connect = await connectSinglePrinter2(printer);
      if(!connect){
        showToast('Printer not connected !!');
        print('Printer not connected!!');
        return;
      }
      await Future.delayed(const Duration(milliseconds: 300));
      final responsePrintString = await printString(folder.type);
      if(responsePrintString){
        showToast('Test print success');
        print('Test print success');
      }else{
        showToast('Printer not connected');
        print('Printer not connected');
      }
    } catch (e) {
      showToast('Error connecting and printing to printer: ${e.toString()}');
    }
  }

  Future<PrinterModel?> getSelectedPrinter() async {

    GetSinglePrinterUC uc = ref.read(getSinglePrinterUCProvider);
    final result = await uc(null);
    if(result.isSuccess){
      return result.resultValue;
    }else{
      return null;
    }
  }

  void saveSelectedPrinter(PrinterModel printer) {
    SaveSinglePrinterUC uc = ref.read(saveSinglePrinterUCProvider);
    print('save selected printer : ${printer.name}');
    print('save selected printer : ${printer.paperSize?.name}');
    uc(printer);
  }

  void automaticallyConnectPrinter() async {
    print('automatically connect printer');

    //get mode printer
    GetPrinterModeUC uc = ref.read(getPrinterModeUCProvider);
    final result = await uc(null);
    if(result.resultValue != null){
      print('printer mode : ${result.resultValue}');
      state = state.copyWith(printerMode: PrinterModeEnum.findByName(result.resultValue!));
      if(state.printerMode == PrinterModeEnum.single){
        //check connection
        final status = await PrintBluetoothThermal.connectionStatus;
        final printer = await getSelectedPrinter();
        if(status && printer != null){
          print('1 : ${printer.paperSize?.name}');
          state = state.copyWith(connectedPrinter: printer, paperSizeSinglePrinter: printer.paperSize);
        }else if(!status && printer != null){
          print('2 : ${printer.paperSize?.name}');
          await connectSinglePrinter2(printer, paperSize: printer.paperSize);
        }
      }
    }else{
      print('printer mode not found');
    }
  }

  void togglePrintAllProductChecker() {
    state = state.copyWith(isPrintAllProductChecker: !state.isPrintAllProductChecker);
  }
}
