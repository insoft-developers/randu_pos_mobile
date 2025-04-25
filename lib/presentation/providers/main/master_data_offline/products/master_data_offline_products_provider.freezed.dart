// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'master_data_offline_products_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MasterDataOfflineProductsState {
  String? get message => throw _privateConstructorUsedError;
  List<ProductModel> get values => throw _privateConstructorUsedError;

  /// Create a copy of MasterDataOfflineProductsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MasterDataOfflineProductsStateCopyWith<MasterDataOfflineProductsState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MasterDataOfflineProductsStateCopyWith<$Res> {
  factory $MasterDataOfflineProductsStateCopyWith(
          MasterDataOfflineProductsState value,
          $Res Function(MasterDataOfflineProductsState) then) =
      _$MasterDataOfflineProductsStateCopyWithImpl<$Res,
          MasterDataOfflineProductsState>;
  @useResult
  $Res call({String? message, List<ProductModel> values});
}

/// @nodoc
class _$MasterDataOfflineProductsStateCopyWithImpl<$Res,
        $Val extends MasterDataOfflineProductsState>
    implements $MasterDataOfflineProductsStateCopyWith<$Res> {
  _$MasterDataOfflineProductsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MasterDataOfflineProductsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? values = null,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      values: null == values
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MasterDataOfflineProductsStateImplCopyWith<$Res>
    implements $MasterDataOfflineProductsStateCopyWith<$Res> {
  factory _$$MasterDataOfflineProductsStateImplCopyWith(
          _$MasterDataOfflineProductsStateImpl value,
          $Res Function(_$MasterDataOfflineProductsStateImpl) then) =
      __$$MasterDataOfflineProductsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, List<ProductModel> values});
}

/// @nodoc
class __$$MasterDataOfflineProductsStateImplCopyWithImpl<$Res>
    extends _$MasterDataOfflineProductsStateCopyWithImpl<$Res,
        _$MasterDataOfflineProductsStateImpl>
    implements _$$MasterDataOfflineProductsStateImplCopyWith<$Res> {
  __$$MasterDataOfflineProductsStateImplCopyWithImpl(
      _$MasterDataOfflineProductsStateImpl _value,
      $Res Function(_$MasterDataOfflineProductsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MasterDataOfflineProductsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? values = null,
  }) {
    return _then(_$MasterDataOfflineProductsStateImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      values: null == values
          ? _value._values
          : values // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
    ));
  }
}

/// @nodoc

class _$MasterDataOfflineProductsStateImpl
    implements _MasterDataOfflineProductsState {
  const _$MasterDataOfflineProductsStateImpl(
      {this.message = '', final List<ProductModel> values = const []})
      : _values = values;

  @override
  @JsonKey()
  final String? message;
  final List<ProductModel> _values;
  @override
  @JsonKey()
  List<ProductModel> get values {
    if (_values is EqualUnmodifiableListView) return _values;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_values);
  }

  @override
  String toString() {
    return 'MasterDataOfflineProductsState(message: $message, values: $values)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MasterDataOfflineProductsStateImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._values, _values));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, message, const DeepCollectionEquality().hash(_values));

  /// Create a copy of MasterDataOfflineProductsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MasterDataOfflineProductsStateImplCopyWith<
          _$MasterDataOfflineProductsStateImpl>
      get copyWith => __$$MasterDataOfflineProductsStateImplCopyWithImpl<
          _$MasterDataOfflineProductsStateImpl>(this, _$identity);
}

abstract class _MasterDataOfflineProductsState
    implements MasterDataOfflineProductsState {
  const factory _MasterDataOfflineProductsState(
      {final String? message,
      final List<ProductModel> values}) = _$MasterDataOfflineProductsStateImpl;

  @override
  String? get message;
  @override
  List<ProductModel> get values;

  /// Create a copy of MasterDataOfflineProductsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MasterDataOfflineProductsStateImplCopyWith<
          _$MasterDataOfflineProductsStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
