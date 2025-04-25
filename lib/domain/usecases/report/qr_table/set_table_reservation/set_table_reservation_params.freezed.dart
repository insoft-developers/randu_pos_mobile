// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'set_table_reservation_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SetTableReservationParams _$SetTableReservationParamsFromJson(
    Map<String, dynamic> json) {
  return _SetTableReservationParams.fromJson(json);
}

/// @nodoc
mixin _$SetTableReservationParams {
  List<int> get tableIds => throw _privateConstructorUsedError;
  TableStatusEnum get status => throw _privateConstructorUsedError;

  /// Serializes this SetTableReservationParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SetTableReservationParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SetTableReservationParamsCopyWith<SetTableReservationParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SetTableReservationParamsCopyWith<$Res> {
  factory $SetTableReservationParamsCopyWith(SetTableReservationParams value,
          $Res Function(SetTableReservationParams) then) =
      _$SetTableReservationParamsCopyWithImpl<$Res, SetTableReservationParams>;
  @useResult
  $Res call({List<int> tableIds, TableStatusEnum status});
}

/// @nodoc
class _$SetTableReservationParamsCopyWithImpl<$Res,
        $Val extends SetTableReservationParams>
    implements $SetTableReservationParamsCopyWith<$Res> {
  _$SetTableReservationParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SetTableReservationParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tableIds = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      tableIds: null == tableIds
          ? _value.tableIds
          : tableIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TableStatusEnum,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SetTableReservationParamsImplCopyWith<$Res>
    implements $SetTableReservationParamsCopyWith<$Res> {
  factory _$$SetTableReservationParamsImplCopyWith(
          _$SetTableReservationParamsImpl value,
          $Res Function(_$SetTableReservationParamsImpl) then) =
      __$$SetTableReservationParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<int> tableIds, TableStatusEnum status});
}

/// @nodoc
class __$$SetTableReservationParamsImplCopyWithImpl<$Res>
    extends _$SetTableReservationParamsCopyWithImpl<$Res,
        _$SetTableReservationParamsImpl>
    implements _$$SetTableReservationParamsImplCopyWith<$Res> {
  __$$SetTableReservationParamsImplCopyWithImpl(
      _$SetTableReservationParamsImpl _value,
      $Res Function(_$SetTableReservationParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of SetTableReservationParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tableIds = null,
    Object? status = null,
  }) {
    return _then(_$SetTableReservationParamsImpl(
      tableIds: null == tableIds
          ? _value._tableIds
          : tableIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TableStatusEnum,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SetTableReservationParamsImpl implements _SetTableReservationParams {
  const _$SetTableReservationParamsImpl(
      {required final List<int> tableIds, required this.status})
      : _tableIds = tableIds;

  factory _$SetTableReservationParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SetTableReservationParamsImplFromJson(json);

  final List<int> _tableIds;
  @override
  List<int> get tableIds {
    if (_tableIds is EqualUnmodifiableListView) return _tableIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tableIds);
  }

  @override
  final TableStatusEnum status;

  @override
  String toString() {
    return 'SetTableReservationParams(tableIds: $tableIds, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetTableReservationParamsImpl &&
            const DeepCollectionEquality().equals(other._tableIds, _tableIds) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_tableIds), status);

  /// Create a copy of SetTableReservationParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SetTableReservationParamsImplCopyWith<_$SetTableReservationParamsImpl>
      get copyWith => __$$SetTableReservationParamsImplCopyWithImpl<
          _$SetTableReservationParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SetTableReservationParamsImplToJson(
      this,
    );
  }
}

abstract class _SetTableReservationParams implements SetTableReservationParams {
  const factory _SetTableReservationParams(
      {required final List<int> tableIds,
      required final TableStatusEnum status}) = _$SetTableReservationParamsImpl;

  factory _SetTableReservationParams.fromJson(Map<String, dynamic> json) =
      _$SetTableReservationParamsImpl.fromJson;

  @override
  List<int> get tableIds;
  @override
  TableStatusEnum get status;

  /// Create a copy of SetTableReservationParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SetTableReservationParamsImplCopyWith<_$SetTableReservationParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
