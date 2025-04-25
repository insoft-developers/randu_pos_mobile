import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'connectivity_service.dart';
import 'connectivity_service_provider.dart';

part 'check_connectivity_provider.g.dart';

// StreamProvider for listening to connectivity status
@riverpod
Stream<ConnectivityStatus> connectivityStatus(ConnectivityStatusRef ref) {
  final connectivityService = ref.watch(connectivityServiceProvider);
  return connectivityService.connectivityStream;
}

// FutureProvider for checking connectivity status on demand
@riverpod
Future<ConnectivityStatus> checkConnectivity(CheckConnectivityRef ref) {
  final connectivityService = ref.watch(connectivityServiceProvider);
  return connectivityService.checkConnectivity();
}

@Riverpod(keepAlive: true)
class ConnectionStatus extends _$ConnectionStatus {
  @override
  ConnectivityStatus? build() {
    return null;
  }

  Future<ConnectivityStatus> checkConnection() async {
    final connectivityService = ref.read(connectivityServiceProvider);
    final status = await connectivityService.checkConnectivity();
    print('checkConnection status : $status');
    state = status;
    return status;
  }
}
