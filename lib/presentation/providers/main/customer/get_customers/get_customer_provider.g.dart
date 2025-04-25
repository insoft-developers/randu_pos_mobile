// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_customer_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getCustomersHash() => r'672d676026463cd03f24b89357ecf60713d3bf50';

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

/// See also [getCustomers].
@ProviderFor(getCustomers)
const getCustomersProvider = GetCustomersFamily();

/// See also [getCustomers].
class GetCustomersFamily extends Family<AsyncValue<List<CustomerModel>>> {
  /// See also [getCustomers].
  const GetCustomersFamily();

  /// See also [getCustomers].
  GetCustomersProvider call({
    required GetCustomerRequestModel request,
  }) {
    return GetCustomersProvider(
      request: request,
    );
  }

  @override
  GetCustomersProvider getProviderOverride(
    covariant GetCustomersProvider provider,
  ) {
    return call(
      request: provider.request,
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
  String? get name => r'getCustomersProvider';
}

/// See also [getCustomers].
class GetCustomersProvider
    extends AutoDisposeFutureProvider<List<CustomerModel>> {
  /// See also [getCustomers].
  GetCustomersProvider({
    required GetCustomerRequestModel request,
  }) : this._internal(
          (ref) => getCustomers(
            ref as GetCustomersRef,
            request: request,
          ),
          from: getCustomersProvider,
          name: r'getCustomersProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getCustomersHash,
          dependencies: GetCustomersFamily._dependencies,
          allTransitiveDependencies:
              GetCustomersFamily._allTransitiveDependencies,
          request: request,
        );

  GetCustomersProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.request,
  }) : super.internal();

  final GetCustomerRequestModel request;

  @override
  Override overrideWith(
    FutureOr<List<CustomerModel>> Function(GetCustomersRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetCustomersProvider._internal(
        (ref) => create(ref as GetCustomersRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        request: request,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<CustomerModel>> createElement() {
    return _GetCustomersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetCustomersProvider && other.request == request;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, request.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetCustomersRef on AutoDisposeFutureProviderRef<List<CustomerModel>> {
  /// The parameter `request` of this provider.
  GetCustomerRequestModel get request;
}

class _GetCustomersProviderElement
    extends AutoDisposeFutureProviderElement<List<CustomerModel>>
    with GetCustomersRef {
  _GetCustomersProviderElement(super.provider);

  @override
  GetCustomerRequestModel get request =>
      (origin as GetCustomersProvider).request;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
