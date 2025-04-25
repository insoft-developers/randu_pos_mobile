// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_transaction_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$statusTransactionHash() => r'9f90b62001d9f8b3ae0d6c90af8f7d036fb7dd2b';

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

abstract class _$StatusTransaction
    extends BuildlessAutoDisposeAsyncNotifier<StatusTransactionEnum> {
  late final StatusTransactionEnum initialStatus;

  FutureOr<StatusTransactionEnum> build(
    StatusTransactionEnum initialStatus,
  );
}

/// See also [StatusTransaction].
@ProviderFor(StatusTransaction)
const statusTransactionProvider = StatusTransactionFamily();

/// See also [StatusTransaction].
class StatusTransactionFamily
    extends Family<AsyncValue<StatusTransactionEnum>> {
  /// See also [StatusTransaction].
  const StatusTransactionFamily();

  /// See also [StatusTransaction].
  StatusTransactionProvider call(
    StatusTransactionEnum initialStatus,
  ) {
    return StatusTransactionProvider(
      initialStatus,
    );
  }

  @override
  StatusTransactionProvider getProviderOverride(
    covariant StatusTransactionProvider provider,
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
  String? get name => r'statusTransactionProvider';
}

/// See also [StatusTransaction].
class StatusTransactionProvider extends AutoDisposeAsyncNotifierProviderImpl<
    StatusTransaction, StatusTransactionEnum> {
  /// See also [StatusTransaction].
  StatusTransactionProvider(
    StatusTransactionEnum initialStatus,
  ) : this._internal(
          () => StatusTransaction()..initialStatus = initialStatus,
          from: statusTransactionProvider,
          name: r'statusTransactionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$statusTransactionHash,
          dependencies: StatusTransactionFamily._dependencies,
          allTransitiveDependencies:
              StatusTransactionFamily._allTransitiveDependencies,
          initialStatus: initialStatus,
        );

  StatusTransactionProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.initialStatus,
  }) : super.internal();

  final StatusTransactionEnum initialStatus;

  @override
  FutureOr<StatusTransactionEnum> runNotifierBuild(
    covariant StatusTransaction notifier,
  ) {
    return notifier.build(
      initialStatus,
    );
  }

  @override
  Override overrideWith(StatusTransaction Function() create) {
    return ProviderOverride(
      origin: this,
      override: StatusTransactionProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<StatusTransaction,
      StatusTransactionEnum> createElement() {
    return _StatusTransactionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is StatusTransactionProvider &&
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
mixin StatusTransactionRef
    on AutoDisposeAsyncNotifierProviderRef<StatusTransactionEnum> {
  /// The parameter `initialStatus` of this provider.
  StatusTransactionEnum get initialStatus;
}

class _StatusTransactionProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<StatusTransaction,
        StatusTransactionEnum> with StatusTransactionRef {
  _StatusTransactionProviderElement(super.provider);

  @override
  StatusTransactionEnum get initialStatus =>
      (origin as StatusTransactionProvider).initialStatus;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
