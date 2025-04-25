// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'check_payment_status_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CheckPaymentStatusState {
  GeneralResponse<dynamic>? get response => throw _privateConstructorUsedError;
  bool get isExpired => throw _privateConstructorUsedError;

  /// Create a copy of CheckPaymentStatusState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CheckPaymentStatusStateCopyWith<CheckPaymentStatusState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckPaymentStatusStateCopyWith<$Res> {
  factory $CheckPaymentStatusStateCopyWith(CheckPaymentStatusState value,
          $Res Function(CheckPaymentStatusState) then) =
      _$CheckPaymentStatusStateCopyWithImpl<$Res, CheckPaymentStatusState>;
  @useResult
  $Res call({GeneralResponse<dynamic>? response, bool isExpired});

  $GeneralResponseCopyWith<dynamic, $Res>? get response;
}

/// @nodoc
class _$CheckPaymentStatusStateCopyWithImpl<$Res,
        $Val extends CheckPaymentStatusState>
    implements $CheckPaymentStatusStateCopyWith<$Res> {
  _$CheckPaymentStatusStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckPaymentStatusState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = freezed,
    Object? isExpired = null,
  }) {
    return _then(_value.copyWith(
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as GeneralResponse<dynamic>?,
      isExpired: null == isExpired
          ? _value.isExpired
          : isExpired // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of CheckPaymentStatusState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GeneralResponseCopyWith<dynamic, $Res>? get response {
    if (_value.response == null) {
      return null;
    }

    return $GeneralResponseCopyWith<dynamic, $Res>(_value.response!, (value) {
      return _then(_value.copyWith(response: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CheckPaymentStatusStateImplCopyWith<$Res>
    implements $CheckPaymentStatusStateCopyWith<$Res> {
  factory _$$CheckPaymentStatusStateImplCopyWith(
          _$CheckPaymentStatusStateImpl value,
          $Res Function(_$CheckPaymentStatusStateImpl) then) =
      __$$CheckPaymentStatusStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({GeneralResponse<dynamic>? response, bool isExpired});

  @override
  $GeneralResponseCopyWith<dynamic, $Res>? get response;
}

/// @nodoc
class __$$CheckPaymentStatusStateImplCopyWithImpl<$Res>
    extends _$CheckPaymentStatusStateCopyWithImpl<$Res,
        _$CheckPaymentStatusStateImpl>
    implements _$$CheckPaymentStatusStateImplCopyWith<$Res> {
  __$$CheckPaymentStatusStateImplCopyWithImpl(
      _$CheckPaymentStatusStateImpl _value,
      $Res Function(_$CheckPaymentStatusStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CheckPaymentStatusState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = freezed,
    Object? isExpired = null,
  }) {
    return _then(_$CheckPaymentStatusStateImpl(
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as GeneralResponse<dynamic>?,
      isExpired: null == isExpired
          ? _value.isExpired
          : isExpired // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CheckPaymentStatusStateImpl implements _CheckPaymentStatusState {
  const _$CheckPaymentStatusStateImpl({this.response, this.isExpired = false});

  @override
  final GeneralResponse<dynamic>? response;
  @override
  @JsonKey()
  final bool isExpired;

  @override
  String toString() {
    return 'CheckPaymentStatusState(response: $response, isExpired: $isExpired)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckPaymentStatusStateImpl &&
            (identical(other.response, response) ||
                other.response == response) &&
            (identical(other.isExpired, isExpired) ||
                other.isExpired == isExpired));
  }

  @override
  int get hashCode => Object.hash(runtimeType, response, isExpired);

  /// Create a copy of CheckPaymentStatusState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckPaymentStatusStateImplCopyWith<_$CheckPaymentStatusStateImpl>
      get copyWith => __$$CheckPaymentStatusStateImplCopyWithImpl<
          _$CheckPaymentStatusStateImpl>(this, _$identity);
}

abstract class _CheckPaymentStatusState implements CheckPaymentStatusState {
  const factory _CheckPaymentStatusState(
      {final GeneralResponse<dynamic>? response,
      final bool isExpired}) = _$CheckPaymentStatusStateImpl;

  @override
  GeneralResponse<dynamic>? get response;
  @override
  bool get isExpired;

  /// Create a copy of CheckPaymentStatusState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckPaymentStatusStateImplCopyWith<_$CheckPaymentStatusStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
