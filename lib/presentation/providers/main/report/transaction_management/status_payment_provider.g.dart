// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_payment_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$statusPaymentHash() => r'd05e87a8ec99885a175ff69c9a59beb88503a5d4';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$StatusPayment
    extends BuildlessAutoDisposeAsyncNotifier<StatusPaymentEnum> {
  late final StatusPaymentEnum initialStatus;

  FutureOr<StatusPaymentEnum> build(
    StatusPaymentEnum initialStatus,
  );
}

/// See also [StatusPayment].
@ProviderFor(StatusPayment)
const statusPaymentProvider = StatusPaymentFamily();

/// See also [StatusPayment].
class StatusPaymentFamily extends Family<AsyncValue<StatusPaymentEnum>> {
  /// See also [StatusPayment].
  const StatusPaymentFamily();

  /// See also [StatusPayment].
  StatusPaymentProvider call(
    StatusPaymentEnum initialStatus,
  ) {
    return StatusPaymentProvider(
      initialStatus,
    );
  }

  @override
  StatusPaymentProvider getProviderOverride(
    covariant StatusPaymentProvider provider,
  ) {
    return call(
      provider.initialStatus,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'statusPaymentProvider';
}

/// See also [StatusPayment].
class StatusPaymentProvider extends AutoDisposeAsyncNotifierProviderImpl<
    StatusPayment, StatusPaymentEnum> {
  /// See also [StatusPayment].
  StatusPaymentProvider(
    StatusPaymentEnum initialStatus,
  ) : this._internal(
          () => StatusPayment()..initialStatus = initialStatus,
          from: statusPaymentProvider,
          name: r'statusPaymentProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$statusPaymentHash,
          dependencies: StatusPaymentFamily._dependencies,
          allTransitiveDependencies:
              StatusPaymentFamily._allTransitiveDependencies,
          initialStatus: initialStatus,
        );

  StatusPaymentProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.initialStatus,
  }) : super.internal();

  final StatusPaymentEnum initialStatus;

  @override
  FutureOr<StatusPaymentEnum> runNotifierBuild(
    covariant StatusPayment notifier,
  ) {
    return notifier.build(
      initialStatus,
    );
  }

  @override
  Override overrideWith(StatusPayment Function() create) {
    return ProviderOverride(
      origin: this,
      override: StatusPaymentProvider._internal(
        () => create()..initialStatus = initialStatus,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        initialStatus: initialStatus,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<StatusPayment, StatusPaymentEnum>
      createElement() {
    return _StatusPaymentProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is StatusPaymentProvider &&
        other.initialStatus == initialStatus;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, initialStatus.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin StatusPaymentRef
    on AutoDisposeAsyncNotifierProviderRef<StatusPaymentEnum> {
  /// The parameter `initialStatus` of this provider.
  StatusPaymentEnum get initialStatus;
}

class _StatusPaymentProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<StatusPayment,
        StatusPaymentEnum> with StatusPaymentRef {
  _StatusPaymentProviderElement(super.provider);

  @override
  StatusPaymentEnum get initialStatus =>
      (origin as StatusPaymentProvider).initialStatus;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
