import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class ConnectivityService {
  final Connectivity _connectivity = Connectivity();
  final InternetConnection _internetChecker = InternetConnection();

  // Stream to provide connectivity updates
  Stream<ConnectivityStatus> get connectivityStream {
    return _connectivity.onConnectivityChanged.asyncMap((results) async {
      final result = _mapConnectivityResults(results);

      // If there's no connection, return offline immediately
      if (result == ConnectivityResult.none) {
        return ConnectivityStatus.offline;
      }

      // Otherwise, check for actual internet access
      final hasInternet = await _internetChecker.hasInternetAccess;

      return hasInternet
          ? ConnectivityStatus.online
          : ConnectivityStatus.offline;
    });
  }

  // Method to check connectivity on demand
  Future<ConnectivityStatus> checkConnectivity() async {
    final results = await _connectivity.checkConnectivity();
    final result = _mapConnectivityResults(results);

    if (result == ConnectivityResult.none) {
      return ConnectivityStatus.offline;
    }

    // Check for actual internet access
    final hasInternet = await _internetChecker.hasInternetAccess;

    return hasInternet ? ConnectivityStatus.online : ConnectivityStatus.offline;
  }

  // Helper function to map a list of ConnectivityResults to a single result
  ConnectivityResult _mapConnectivityResults(List<ConnectivityResult> results) {
    if (results.contains(ConnectivityResult.none)) {
      return ConnectivityResult.none;
    } else if (results.contains(ConnectivityResult.wifi)) {
      return ConnectivityResult.wifi;
    } else if (results.contains(ConnectivityResult.mobile)) {
      return ConnectivityResult.mobile;
    }
    return ConnectivityResult.none; // Fallback
  }
}

// Enum to represent online or offline status
enum ConnectivityStatus { online, offline }
