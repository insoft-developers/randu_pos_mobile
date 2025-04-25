// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'master_data_offline_payment_methods_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MasterDataOfflinePaymentMethodsState {
  List<PaymentMethodModel>? get paymentMethods =>
      throw _privateConstructorUsedError;
  String? get saveMessage => throw _privateConstructorUsedError;

  /// Create a copy of MasterDataOfflinePaymentMethodsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MasterDataOfflinePaymentMethodsStateCopyWith<
          MasterDataOfflinePaymentMethodsState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MasterDataOfflinePaymentMethodsStateCopyWith<$Res> {
  factory $MasterDataOfflinePaymentMethodsStateCopyWith(
          MasterDataOfflinePaymentMethodsState value,
          $Res Function(MasterDataOfflinePaymentMethodsState) then) =
      _$MasterDataOfflinePaymentMethodsStateCopyWithImpl<$Res,
          MasterDataOfflinePaymentMethodsState>;
  @useResult
  $Res call({List<PaymentMethodModel>? paymentMethods, String? saveMessage});
}

/// @nodoc
class _$MasterDataOfflinePaymentMethodsStateCopyWithImpl<$Res,
        $Val extends MasterDataOfflinePaymentMethodsState>
    implements $MasterDataOfflinePaymentMethodsStateCopyWith<$Res> {
  _$MasterDataOfflinePaymentMethodsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MasterDataOfflinePaymentMethodsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentMethods = freezed,
    Object? saveMessage = freezed,
  }) {
    return _then(_value.copyWith(
      paymentMethods: freezed == paymentMethods
          ? _value.paymentMethods
          : paymentMethods // ignore: cast_nullable_to_non_nullable
              as List<PaymentMethodModel>?,
      saveMessage: freezed == saveMessage
          ? _value.saveMessage
          : saveMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MasterDataOfflinePaymentMethodsStateImplCopyWith<$Res>
    implements $MasterDataOfflinePaymentMethodsStateCopyWith<$Res> {
  factory _$$MasterDataOfflinePaymentMethodsStateImplCopyWith(
          _$MasterDataOfflinePaymentMethodsStateImpl value,
          $Res Function(_$MasterDataOfflinePaymentMethodsStateImpl) then) =
      __$$MasterDataOfflinePaymentMethodsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<PaymentMethodModel>? paymentMethods, String? saveMessage});
}

/// @nodoc
class __$$MasterDataOfflinePaymentMethodsStateImplCopyWithImpl<$Res>
    extends _$MasterDataOfflinePaymentMethodsStateCopyWithImpl<$Res,
        _$MasterDataOfflinePaymentMethodsStateImpl>
    implements _$$MasterDataOfflinePaymentMethodsStateImplCopyWith<$Res> {
  __$$MasterDataOfflinePaymentMethodsStateImplCopyWithImpl(
      _$MasterDataOfflinePaymentMethodsStateImpl _value,
      $Res Function(_$MasterDataOfflinePaymentMethodsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MasterDataOfflinePaymentMethodsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentMethods = freezed,
    Object? saveMessage = freezed,
  }) {
    return _then(_$MasterDataOfflinePaymentMethodsStateImpl(
      paymentMethods: freezed == paymentMethods
          ? _value._paymentMethods
          : paymentMethods // ignore: cast_nullable_to_non_nullable
              as List<PaymentMethodModel>?,
      saveMessage: freezed == saveMessage
          ? _value.saveMessage
          : saveMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$MasterDataOfflinePaymentMethodsStateImpl
    implements _MasterDataOfflinePaymentMethodsState {
  const _$MasterDataOfflinePaymentMethodsStateImpl(
      {final List<PaymentMethodModel>? paymentMethods, this.saveMessage})
      : _paymentMethods = paymentMethods;

  final List<PaymentMethodModel>? _paymentMethods;
  @override
  List<PaymentMethodModel>? get paymentMethods {
    final value = _paymentMethods;
    if (value == null) return null;
    if (_paymentMethods is EqualUnmodifiableListView) return _paymentMethods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? saveMessage;

  @override
  String toString() {
    return 'MasterDataOfflinePaymentMethodsState(paymentMethods: $paymentMethods, saveMessage: $saveMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MasterDataOfflinePaymentMethodsStateImpl &&
            const DeepCollectionEquality()
                .equals(other._paymentMethods, _paymentMethods) &&
            (identical(other.saveMessage, saveMessage) ||
                other.saveMessage == saveMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_paymentMethods), saveMessage);

  /// Create a copy of MasterDataOfflinePaymentMethodsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MasterDataOfflinePaymentMethodsStateImplCopyWith<
          _$MasterDataOfflinePaymentMethodsStateImpl>
      get copyWith => __$$MasterDataOfflinePaymentMethodsStateImplCopyWithImpl<
          _$MasterDataOfflinePaymentMethodsStateImpl>(this, _$identity);
}

abstract class _MasterDataOfflinePaymentMethodsState
    implements MasterDataOfflinePaymentMethodsState {
  const factory _MasterDataOfflinePaymentMethodsState(
      {final List<PaymentMethodModel>? paymentMethods,
      final String? saveMessage}) = _$MasterDataOfflinePaymentMethodsStateImpl;

  @override
  List<PaymentMethodModel>? get paymentMethods;
  @override
  String? get saveMessage;

  /// Create a copy of MasterDataOfflinePaymentMethodsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MasterDataOfflinePaymentMethodsStateImplCopyWith<
          _$MasterDataOfflinePaymentMethodsStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
