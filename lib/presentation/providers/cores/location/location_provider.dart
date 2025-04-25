
import 'package:location/location.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'location_service.dart';

part 'location_provider.g.dart';

@riverpod
Location location(LocationRef ref) {
  return Location();
}

@riverpod
LocationService locationService(LocationServiceRef ref) {
  return LocationService(location: ref.watch(locationProvider));
}
