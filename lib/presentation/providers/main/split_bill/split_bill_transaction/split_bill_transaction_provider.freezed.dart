// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'split_bill_transaction_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SplitBillTransactionState {
  bool? get status => throw _privateConstructorUsedError;
  CartState? get originalCart => throw _privateConstructorUsedError;
  CartState? get splitCart => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of SplitBillTransactionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SplitBillTransactionStateCopyWith<SplitBillTransactionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplitBillTransactionStateCopyWith<$Res> {
  factory $SplitBillTransactionStateCopyWith(SplitBillTransactionState value,
          $Res Function(SplitBillTransactionState) then) =
      _$SplitBillTransactionStateCopyWithImpl<$Res, SplitBillTransactionState>;
  @useResult
  $Res call(
      {bool? status,
      CartState? originalCart,
      CartState? splitCart,
      String? errorMessage});

  $CartStateCopyWith<$Res>? get originalCart;
  $CartStateCopyWith<$Res>? get splitCart;
}

/// @nodoc
class _$SplitBillTransactionStateCopyWithImpl<$Res,
        $Val extends SplitBillTransactionState>
    implements $SplitBillTransactionStateCopyWith<$Res> {
  _$SplitBillTransactionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SplitBillTransactionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? originalCart = freezed,
    Object? splitCart = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      originalCart: freezed == originalCart
          ? _value.originalCart
          : originalCart // ignore: cast_nullable_to_non_nullable
              as CartState?,
      splitCart: freezed == splitCart
          ? _value.splitCart
          : splitCart // ignore: cast_nullable_to_non_nullable
              as CartState?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of SplitBillTransactionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CartStateCopyWith<$Res>? get originalCart {
    if (_value.originalCart == null) {
      return null;
    }

    return $CartStateCopyWith<$Res>(_value.originalCart!, (value) {
      return _then(_value.copyWith(originalCart: value) as $Val);
    });
  }

  /// Create a copy of SplitBillTransactionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CartStateCopyWith<$Res>? get splitCart {
    if (_value.splitCart == null) {
      return null;
    }

    return $CartStateCopyWith<$Res>(_value.splitCart!, (value) {
      return _then(_value.copyWith(splitCart: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SplitBillTransactionStateImplCopyWith<$Res>
    implements $SplitBillTransactionStateCopyWith<$Res> {
  factory _$$SplitBillTransactionStateImplCopyWith(
          _$SplitBillTransactionStateImpl value,
          $Res Function(_$SplitBillTransactionStateImpl) then) =
      __$$SplitBillTransactionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? status,
      CartState? originalCart,
      CartState? splitCart,
      String? errorMessage});

  @override
  $CartStateCopyWith<$Res>? get originalCart;
  @override
  $CartStateCopyWith<$Res>? get splitCart;
}

/// @nodoc
class __$$SplitBillTransactionStateImplCopyWithImpl<$Res>
    extends _$SplitBillTransactionStateCopyWithImpl<$Res,
        _$SplitBillTransactionStateImpl>
    implements _$$SplitBillTransactionStateImplCopyWith<$Res> {
  __$$SplitBillTransactionStateImplCopyWithImpl(
      _$SplitBillTransactionStateImpl _value,
      $Res Function(_$SplitBillTransactionStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SplitBillTransactionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? originalCart = freezed,
    Object? splitCart = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$SplitBillTransactionStateImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      originalCart: freezed == originalCart
          ? _value.originalCart
          : originalCart // ignore: cast_nullable_to_non_nullable
              as CartState?,
      splitCart: freezed == splitCart
          ? _value.splitCart
          : splitCart // ignore: cast_nullable_to_non_nullable
              as CartState?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SplitBillTransactionStateImpl implements _SplitBillTransactionState {
  const _$SplitBillTransactionStateImpl(
      {this.status, this.originalCart, this.splitCart, this.errorMessage});

  @override
  final bool? status;
  @override
  final CartState? originalCart;
  @override
  final CartState? splitCart;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'SplitBillTransactionState(status: $status, originalCart: $originalCart, splitCart: $splitCart, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SplitBillTransactionStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.originalCart, originalCart) ||
                other.originalCart == originalCart) &&
            (identical(other.splitCart, splitCart) ||
                other.splitCart == splitCart) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, originalCart, splitCart, errorMessage);

  /// Create a copy of SplitBillTransactionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SplitBillTransactionStateImplCopyWith<_$SplitBillTransactionStateImpl>
      get copyWith => __$$SplitBillTransactionStateImplCopyWithImpl<
          _$SplitBillTransactionStateImpl>(this, _$identity);
}

abstract class _SplitBillTransactionState implements SplitBillTransactionState {
  const factory _SplitBillTransactionState(
      {final bool? status,
      final CartState? originalCart,
      final CartState? splitCart,
      final String? errorMessage}) = _$SplitBillTransactionStateImpl;

  @override
  bool? get status;
  @override
  CartState? get originalCart;
  @override
  CartState? get splitCart;
  @override
  String? get errorMessage;

  /// Create a copy of SplitBillTransactionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SplitBillTransactionStateImplCopyWith<_$SplitBillTransactionStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
