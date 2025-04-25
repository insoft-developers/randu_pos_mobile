// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'send_payment_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SendPaymentState {
  GeneralResponse<PaymentResponseData>? get response =>
      throw _privateConstructorUsedError;

  /// Create a copy of SendPaymentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SendPaymentStateCopyWith<SendPaymentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendPaymentStateCopyWith<$Res> {
  factory $SendPaymentStateCopyWith(
          SendPaymentState value, $Res Function(SendPaymentState) then) =
      _$SendPaymentStateCopyWithImpl<$Res, SendPaymentState>;
  @useResult
  $Res call({GeneralResponse<PaymentResponseData>? response});

  $GeneralResponseCopyWith<PaymentResponseData, $Res>? get response;
}

/// @nodoc
class _$SendPaymentStateCopyWithImpl<$Res, $Val extends SendPaymentState>
    implements $SendPaymentStateCopyWith<$Res> {
  _$SendPaymentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SendPaymentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = freezed,
  }) {
    return _then(_value.copyWith(
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as GeneralResponse<PaymentResponseData>?,
    ) as $Val);
  }

  /// Create a copy of SendPaymentState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GeneralResponseCopyWith<PaymentResponseData, $Res>? get response {
    if (_value.response == null) {
      return null;
    }

    return $GeneralResponseCopyWith<PaymentResponseData, $Res>(_value.response!,
        (value) {
      return _then(_value.copyWith(response: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SendPaymentStateImplCopyWith<$Res>
    implements $SendPaymentStateCopyWith<$Res> {
  factory _$$SendPaymentStateImplCopyWith(_$SendPaymentStateImpl value,
          $Res Function(_$SendPaymentStateImpl) then) =
      __$$SendPaymentStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({GeneralResponse<PaymentResponseData>? response});

  @override
  $GeneralResponseCopyWith<PaymentResponseData, $Res>? get response;
}

/// @nodoc
class __$$SendPaymentStateImplCopyWithImpl<$Res>
    extends _$SendPaymentStateCopyWithImpl<$Res, _$SendPaymentStateImpl>
    implements _$$SendPaymentStateImplCopyWith<$Res> {
  __$$SendPaymentStateImplCopyWithImpl(_$SendPaymentStateImpl _value,
      $Res Function(_$SendPaymentStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SendPaymentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = freezed,
  }) {
    return _then(_$SendPaymentStateImpl(
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as GeneralResponse<PaymentResponseData>?,
    ));
  }
}

/// @nodoc

class _$SendPaymentStateImpl implements _SendPaymentState {
  const _$SendPaymentStateImpl({this.response});

  @override
  final GeneralResponse<PaymentResponseData>? response;

  @override
  String toString() {
    return 'SendPaymentState(response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendPaymentStateImpl &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @override
  int get hashCode => Object.hash(runtimeType, response);

  /// Create a copy of SendPaymentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendPaymentStateImplCopyWith<_$SendPaymentStateImpl> get copyWith =>
      __$$SendPaymentStateImplCopyWithImpl<_$SendPaymentStateImpl>(
          this, _$identity);
}

abstract class _SendPaymentState implements SendPaymentState {
  const factory _SendPaymentState(
          {final GeneralResponse<PaymentResponseData>? response}) =
      _$SendPaymentStateImpl;

  @override
  GeneralResponse<PaymentResponseData>? get response;

  /// Create a copy of SendPaymentState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendPaymentStateImplCopyWith<_$SendPaymentStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
