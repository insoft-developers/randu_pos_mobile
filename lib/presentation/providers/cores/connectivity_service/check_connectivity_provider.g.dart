// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_connectivity_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$connectivityStatusHash() =>
    r'd4408c1d9aefe63c43edbed4289a889c6f46acd0';

/// See also [connectivityStatus].
@ProviderFor(connectivityStatus)
final connectivityStatusProvider =
    AutoDisposeStreamProvider<ConnectivityStatus>.internal(
  connectivityStatus,
  name: r'connectivityStatusProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$connectivityStatusHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ConnectivityStatusRef
    = AutoDisposeStreamProviderRef<ConnectivityStatus>;
String _$checkConnectivityHash() => r'14319503d4adb2ac128b73cad8d5e9da3c78d5e3';

/// See also [checkConnectivity].
@ProviderFor(checkConnectivity)
final checkConnectivityProvider =
    AutoDisposeFutureProvider<ConnectivityStatus>.internal(
  checkConnectivity,
  name: r'checkConnectivityProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$checkConnectivityHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CheckConnectivityRef = AutoDisposeFutureProviderRef<ConnectivityStatus>;
String _$connectionStatusHash() => r'712bb2845d7dd69a9e38e3cefc863632e8e47100';

/// See also [ConnectionStatus].
@ProviderFor(ConnectionStatus)
final connectionStatusProvider =
    NotifierProvider<ConnectionStatus, ConnectivityStatus?>.internal(
  ConnectionStatus.new,
  name: r'connectionStatusProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$connectionStatusHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ConnectionStatus = Notifier<ConnectivityStatus?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
