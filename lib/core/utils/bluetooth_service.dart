import 'package:oktoast/oktoast.dart';
import 'package:permission_handler/permission_handler.dart';

class BluetoothPermissionHandler {
  Future<bool> checkAndRequestBluetoothPermissions() async {
    print('Checking Bluetooth permissions...');
    // Check if Bluetooth permissions are granted
    try {
      if (await Permission.bluetooth.isGranted) {
        return true;
      } else {
        // Request Bluetooth permissions
        final status = await Permission.bluetooth.request();
        return status.isGranted;
      }
    } catch (e) {
      showToast('error :${e.toString()}');
      print('error :${e.toString()}');
      return false;
    }
  }

  Future<bool> enableBluetooth() async {
    final status = await Permission.bluetooth.request();
    return status.isGranted;
  }
}
