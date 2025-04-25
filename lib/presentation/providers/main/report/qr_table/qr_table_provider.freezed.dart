// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qr_table_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$QrTableState {
  GeneralRequestModel? get request => throw _privateConstructorUsedError;
  List<TableModel>? get value => throw _privateConstructorUsedError;

  /// Create a copy of QrTableState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QrTableStateCopyWith<QrTableState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QrTableStateCopyWith<$Res> {
  factory $QrTableStateCopyWith(
          QrTableState value, $Res Function(QrTableState) then) =
      _$QrTableStateCopyWithImpl<$Res, QrTableState>;
  @useResult
  $Res call({GeneralRequestModel? request, List<TableModel>? value});

  $GeneralRequestModelCopyWith<$Res>? get request;
}

/// @nodoc
class _$QrTableStateCopyWithImpl<$Res, $Val extends QrTableState>
    implements $QrTableStateCopyWith<$Res> {
  _$QrTableStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QrTableState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = freezed,
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      request: freezed == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as GeneralRequestModel?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as List<TableModel>?,
    ) as $Val);
  }

  /// Create a copy of QrTableState
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
abstract class _$$QrTableStateImplCopyWith<$Res>
    implements $QrTableStateCopyWith<$Res> {
  factory _$$QrTableStateImplCopyWith(
          _$QrTableStateImpl value, $Res Function(_$QrTableStateImpl) then) =
      __$$QrTableStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({GeneralRequestModel? request, List<TableModel>? value});

  @override
  $GeneralRequestModelCopyWith<$Res>? get request;
}

/// @nodoc
class __$$QrTableStateImplCopyWithImpl<$Res>
    extends _$QrTableStateCopyWithImpl<$Res, _$QrTableStateImpl>
    implements _$$QrTableStateImplCopyWith<$Res> {
  __$$QrTableStateImplCopyWithImpl(
      _$QrTableStateImpl _value, $Res Function(_$QrTableStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of QrTableState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = freezed,
    Object? value = freezed,
  }) {
    return _then(_$QrTableStateImpl(
      request: freezed == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as GeneralRequestModel?,
      value: freezed == value
          ? _value._value
          : value // ignore: cast_nullable_to_non_nullable
              as List<TableModel>?,
    ));
  }
}

/// @nodoc

class _$QrTableStateImpl implements _QrTableState {
  const _$QrTableStateImpl({this.request, final List<TableModel>? value})
      : _value = value;

  @override
  final GeneralRequestModel? request;
  final List<TableModel>? _value;
  @override
  List<TableModel>? get value {
    final value = _value;
    if (value == null) return null;
    if (_value is EqualUnmodifiableListView) return _value;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'QrTableState(request: $request, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QrTableStateImpl &&
            (identical(other.request, request) || other.request == request) &&
            const DeepCollectionEquality().equals(other._value, _value));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, request, const DeepCollectionEquality().hash(_value));

  /// Create a copy of QrTableState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QrTableStateImplCopyWith<_$QrTableStateImpl> get copyWith =>
      __$$QrTableStateImplCopyWithImpl<_$QrTableStateImpl>(this, _$identity);
}

abstract class _QrTableState implements QrTableState {
  const factory _QrTableState(
      {final GeneralRequestModel? request,
      final List<TableModel>? value}) = _$QrTableStateImpl;

  @override
  GeneralRequestModel? get request;
  @override
  List<TableModel>? get value;

  /// Create a copy of QrTableState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QrTableStateImplCopyWith<_$QrTableStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
