// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_saved_transactions_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GetSavedTransactionsState {
  List<CartState>? get value => throw _privateConstructorUsedError;

  /// Create a copy of GetSavedTransactionsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetSavedTransactionsStateCopyWith<GetSavedTransactionsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetSavedTransactionsStateCopyWith<$Res> {
  factory $GetSavedTransactionsStateCopyWith(GetSavedTransactionsState value,
          $Res Function(GetSavedTransactionsState) then) =
      _$GetSavedTransactionsStateCopyWithImpl<$Res, GetSavedTransactionsState>;
  @useResult
  $Res call({List<CartState>? value});
}

/// @nodoc
class _$GetSavedTransactionsStateCopyWithImpl<$Res,
        $Val extends GetSavedTransactionsState>
    implements $GetSavedTransactionsStateCopyWith<$Res> {
  _$GetSavedTransactionsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetSavedTransactionsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as List<CartState>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetSavedTransactionsStateImplCopyWith<$Res>
    implements $GetSavedTransactionsStateCopyWith<$Res> {
  factory _$$GetSavedTransactionsStateImplCopyWith(
          _$GetSavedTransactionsStateImpl value,
          $Res Function(_$GetSavedTransactionsStateImpl) then) =
      __$$GetSavedTransactionsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CartState>? value});
}

/// @nodoc
class __$$GetSavedTransactionsStateImplCopyWithImpl<$Res>
    extends _$GetSavedTransactionsStateCopyWithImpl<$Res,
        _$GetSavedTransactionsStateImpl>
    implements _$$GetSavedTransactionsStateImplCopyWith<$Res> {
  __$$GetSavedTransactionsStateImplCopyWithImpl(
      _$GetSavedTransactionsStateImpl _value,
      $Res Function(_$GetSavedTransactionsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetSavedTransactionsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_$GetSavedTransactionsStateImpl(
      value: freezed == value
          ? _value._value
          : value // ignore: cast_nullable_to_non_nullable
              as List<CartState>?,
    ));
  }
}

/// @nodoc

class _$GetSavedTransactionsStateImpl implements _GetSavedTransactionsState {
  const _$GetSavedTransactionsStateImpl({final List<CartState>? value})
      : _value = value;

  final List<CartState>? _value;
  @override
  List<CartState>? get value {
    final value = _value;
    if (value == null) return null;
    if (_value is EqualUnmodifiableListView) return _value;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'GetSavedTransactionsState(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetSavedTransactionsStateImpl &&
            const DeepCollectionEquality().equals(other._value, _value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_value));

  /// Create a copy of GetSavedTransactionsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetSavedTransactionsStateImplCopyWith<_$GetSavedTransactionsStateImpl>
      get copyWith => __$$GetSavedTransactionsStateImplCopyWithImpl<
          _$GetSavedTransactionsStateImpl>(this, _$identity);
}

abstract class _GetSavedTransactionsState implements GetSavedTransactionsState {
  const factory _GetSavedTransactionsState({final List<CartState>? value}) =
      _$GetSavedTransactionsStateImpl;

  @override
  List<CartState>? get value;

  /// Create a copy of GetSavedTransactionsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetSavedTransactionsStateImplCopyWith<_$GetSavedTransactionsStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
