import 'package:flutter/foundation.dart';
import 'package:location/location.dart';

class LocationService {
  final Location _location;

  LocationService({required Location location}) : _location = location;

  /// Check if location service is enabled.
  Future<bool> isLocationServiceEnabled() async {
    try {
      final bool isEnabled = await _location.serviceEnabled();
      if (!isEnabled) {
        // Request to enable the location service
        final bool serviceRequestedResult = await _location.requestService();
        return serviceRequestedResult;
      }
      return isEnabled;
    } catch (e) {
      print('Failed to check location service: $e');
      return false;
    }
  }

  /// Request permission to access location.
  Future<PermissionStatus> requestLocationPermission() async {
    try {
      final PermissionStatus permissionStatus = await _location.hasPermission();
      if (permissionStatus == PermissionStatus.denied) {
        final PermissionStatus requestedPermission =
            await _location.requestPermission();
        return requestedPermission;
      }
      return permissionStatus;
    } catch (e) {
      print('Failed to request location permission: $e');
      return PermissionStatus.denied;
    }
  }

  /// Get the current location of the device.
  Future<LocationData?> getCurrentLocation() async {
    try {
      if (!await isLocationServiceEnabled()) {
        print('Location services are disabled.');
        return null;
      }

      if (await requestLocationPermission() != PermissionStatus.granted) {
        print('Location permission denied.');
        return null;
      }

      final LocationData locationData = await _location.getLocation();
      if (kDebugMode) {
        print('latitude : ${locationData.latitude}');
        print('longitude : ${locationData.longitude}');
      }
      return locationData;
    } catch (e) {
      print('Failed to get current location: $e');
      return null;
    }
  }

  /// Listen to location updates.
  Stream<LocationData> onLocationChanged() {
    return _location.onLocationChanged;
  }

  String convertLocationToString(LocationData locationData) {
    // return '${locationData.latitude}, ${locationData.longitude}';
    return 'https://www.google.com/maps/search/?api=1&query=${locationData.latitude},${locationData.longitude}';
  }
}
