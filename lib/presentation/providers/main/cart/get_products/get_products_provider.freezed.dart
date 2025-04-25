// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_products_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GetProductsState {
  GeneralRequestModel? get request => throw _privateConstructorUsedError;
  List<ProductModel>? get value => throw _privateConstructorUsedError;
  int? get lastPage => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;

  /// Create a copy of GetProductsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetProductsStateCopyWith<GetProductsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetProductsStateCopyWith<$Res> {
  factory $GetProductsStateCopyWith(
          GetProductsState value, $Res Function(GetProductsState) then) =
      _$GetProductsStateCopyWithImpl<$Res, GetProductsState>;
  @useResult
  $Res call(
      {GeneralRequestModel? request,
      List<ProductModel>? value,
      int? lastPage,
      int page});

  $GeneralRequestModelCopyWith<$Res>? get request;
}

/// @nodoc
class _$GetProductsStateCopyWithImpl<$Res, $Val extends GetProductsState>
    implements $GetProductsStateCopyWith<$Res> {
  _$GetProductsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetProductsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = freezed,
    Object? value = freezed,
    Object? lastPage = freezed,
    Object? page = null,
  }) {
    return _then(_value.copyWith(
      request: freezed == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as GeneralRequestModel?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>?,
      lastPage: freezed == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int?,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of GetProductsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GeneralRequestModelCopyWith<$Res>? get request {
    if (_value.request == null) {
      return null;
    }

    return $GeneralRequestModelCopyWith<$Res>(_value.request!, (value) {
      return _then(_value.copyWith(request: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GetProductsStateImplCopyWith<$Res>
    implements $GetProductsStateCopyWith<$Res> {
  factory _$$GetProductsStateImplCopyWith(_$GetProductsStateImpl value,
          $Res Function(_$GetProductsStateImpl) then) =
      __$$GetProductsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {GeneralRequestModel? request,
      List<ProductModel>? value,
      int? lastPage,
      int page});

  @override
  $GeneralRequestModelCopyWith<$Res>? get request;
}

/// @nodoc
class __$$GetProductsStateImplCopyWithImpl<$Res>
    extends _$GetProductsStateCopyWithImpl<$Res, _$GetProductsStateImpl>
    implements _$$GetProductsStateImplCopyWith<$Res> {
  __$$GetProductsStateImplCopyWithImpl(_$GetProductsStateImpl _value,
      $Res Function(_$GetProductsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetProductsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = freezed,
    Object? value = freezed,
    Object? lastPage = freezed,
    Object? page = null,
  }) {
    return _then(_$GetProductsStateImpl(
      request: freezed == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as GeneralRequestModel?,
      value: freezed == value
          ? _value._value
          : value // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>?,
      lastPage: freezed == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int?,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GetProductsStateImpl extends _GetProductsState {
  const _$GetProductsStateImpl(
      {this.request,
      final List<ProductModel>? value,
      this.lastPage,
      this.page = 1})
      : _value = value,
        super._();

  @override
  final GeneralRequestModel? request;
  final List<ProductModel>? _value;
  @override
  List<ProductModel>? get value {
    final value = _value;
    if (value == null) return null;
    if (_value is EqualUnmodifiableListView) return _value;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? lastPage;
  @override
  @JsonKey()
  final int page;

  @override
  String toString() {
    return 'GetProductsState(request: $request, value: $value, lastPage: $lastPage, page: $page)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetProductsStateImpl &&
            (identical(other.request, request) || other.request == request) &&
            const DeepCollectionEquality().equals(other._value, _value) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage) &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request,
      const DeepCollectionEquality().hash(_value), lastPage, page);

  /// Create a copy of GetProductsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetProductsStateImplCopyWith<_$GetProductsStateImpl> get copyWith =>
      __$$GetProductsStateImplCopyWithImpl<_$GetProductsStateImpl>(
          this, _$identity);
}

abstract class _GetProductsState extends GetProductsState {
  const factory _GetProductsState(
      {final GeneralRequestModel? request,
      final List<ProductModel>? value,
      final int? lastPage,
      final int page}) = _$GetProductsStateImpl;
  const _GetProductsState._() : super._();

  @override
  GeneralRequestModel? get request;
  @override
  List<ProductModel>? get value;
  @override
  int? get lastPage;
  @override
  int get page;

  /// Create a copy of GetProductsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetProductsStateImplCopyWith<_$GetProductsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
