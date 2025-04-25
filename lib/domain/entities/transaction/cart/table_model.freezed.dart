// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'table_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TableModel _$TableModelFromJson(Map<String, dynamic> json) {
  return _TableModel.fromJson(json);
}

/// @nodoc
mixin _$TableModel {
  @HiveField(0)
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int? get userId => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: 'no_meja')
  String? get noMeja => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: 'qr_id')
  String? get qrId => throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: 'qr_link')
  String? get qrLink => throw _privateConstructorUsedError;
  @HiveField(4)
  @JsonKey(name: 'availability')
  String? get availability => throw _privateConstructorUsedError;
  @JsonKey(name: 'branch_id')
  int? get branchId => throw _privateConstructorUsedError;
  @JsonKey(name: 'branch_name')
  String? get branchName => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this TableModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TableModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TableModelCopyWith<TableModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TableModelCopyWith<$Res> {
  factory $TableModelCopyWith(
          TableModel value, $Res Function(TableModel) then) =
      _$TableModelCopyWithImpl<$Res, TableModel>;
  @useResult
  $Res call(
      {@HiveField(0) @JsonKey(name: 'id') int? id,
      @JsonKey(name: 'user_id') int? userId,
      @HiveField(1) @JsonKey(name: 'no_meja') String? noMeja,
      @HiveField(2) @JsonKey(name: 'qr_id') String? qrId,
      @HiveField(3) @JsonKey(name: 'qr_link') String? qrLink,
      @HiveField(4) @JsonKey(name: 'availability') String? availability,
      @JsonKey(name: 'branch_id') int? branchId,
      @JsonKey(name: 'branch_name') String? branchName,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class _$TableModelCopyWithImpl<$Res, $Val extends TableModel>
    implements $TableModelCopyWith<$Res> {
  _$TableModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TableModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? noMeja = freezed,
    Object? qrId = freezed,
    Object? qrLink = freezed,
    Object? availability = freezed,
    Object? branchId = freezed,
    Object? branchName = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      noMeja: freezed == noMeja
          ? _value.noMeja
          : noMeja // ignore: cast_nullable_to_non_nullable
              as String?,
      qrId: freezed == qrId
          ? _value.qrId
          : qrId // ignore: cast_nullable_to_non_nullable
              as String?,
      qrLink: freezed == qrLink
          ? _value.qrLink
          : qrLink // ignore: cast_nullable_to_non_nullable
              as String?,
      availability: freezed == availability
          ? _value.availability
          : availability // ignore: cast_nullable_to_non_nullable
              as String?,
      branchId: freezed == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as int?,
      branchName: freezed == branchName
          ? _value.branchName
          : branchName // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TableModelImplCopyWith<$Res>
    implements $TableModelCopyWith<$Res> {
  factory _$$TableModelImplCopyWith(
          _$TableModelImpl value, $Res Function(_$TableModelImpl) then) =
      __$$TableModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) @JsonKey(name: 'id') int? id,
      @JsonKey(name: 'user_id') int? userId,
      @HiveField(1) @JsonKey(name: 'no_meja') String? noMeja,
      @HiveField(2) @JsonKey(name: 'qr_id') String? qrId,
      @HiveField(3) @JsonKey(name: 'qr_link') String? qrLink,
      @HiveField(4) @JsonKey(name: 'availability') String? availability,
      @JsonKey(name: 'branch_id') int? branchId,
      @JsonKey(name: 'branch_name') String? branchName,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class __$$TableModelImplCopyWithImpl<$Res>
    extends _$TableModelCopyWithImpl<$Res, _$TableModelImpl>
    implements _$$TableModelImplCopyWith<$Res> {
  __$$TableModelImplCopyWithImpl(
      _$TableModelImpl _value, $Res Function(_$TableModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TableModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? noMeja = freezed,
    Object? qrId = freezed,
    Object? qrLink = freezed,
    Object? availability = freezed,
    Object? branchId = freezed,
    Object? branchName = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$TableModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      noMeja: freezed == noMeja
          ? _value.noMeja
          : noMeja // ignore: cast_nullable_to_non_nullable
              as String?,
      qrId: freezed == qrId
          ? _value.qrId
          : qrId // ignore: cast_nullable_to_non_nullable
              as String?,
      qrLink: freezed == qrLink
          ? _value.qrLink
          : qrLink // ignore: cast_nullable_to_non_nullable
              as String?,
      availability: freezed == availability
          ? _value.availability
          : availability // ignore: cast_nullable_to_non_nullable
              as String?,
      branchId: freezed == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as int?,
      branchName: freezed == branchName
          ? _value.branchName
          : branchName // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 10, adapterName: 'TableModelAdapter')
class _$TableModelImpl extends _TableModel {
  const _$TableModelImpl(
      {@HiveField(0) @JsonKey(name: 'id') this.id,
      @JsonKey(name: 'user_id') this.userId,
      @HiveField(1) @JsonKey(name: 'no_meja') this.noMeja,
      @HiveField(2) @JsonKey(name: 'qr_id') this.qrId,
      @HiveField(3) @JsonKey(name: 'qr_link') this.qrLink,
      @HiveField(4) @JsonKey(name: 'availability') this.availability,
      @JsonKey(name: 'branch_id') this.branchId,
      @JsonKey(name: 'branch_name') this.branchName,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt})
      : super._();

  factory _$TableModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TableModelImplFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'user_id')
  final int? userId;
  @override
  @HiveField(1)
  @JsonKey(name: 'no_meja')
  final String? noMeja;
  @override
  @HiveField(2)
  @JsonKey(name: 'qr_id')
  final String? qrId;
  @override
  @HiveField(3)
  @JsonKey(name: 'qr_link')
  final String? qrLink;
  @override
  @HiveField(4)
  @JsonKey(name: 'availability')
  final String? availability;
  @override
  @JsonKey(name: 'branch_id')
  final int? branchId;
  @override
  @JsonKey(name: 'branch_name')
  final String? branchName;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'TableModel(id: $id, userId: $userId, noMeja: $noMeja, qrId: $qrId, qrLink: $qrLink, availability: $availability, branchId: $branchId, branchName: $branchName, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TableModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.noMeja, noMeja) || other.noMeja == noMeja) &&
            (identical(other.qrId, qrId) || other.qrId == qrId) &&
            (identical(other.qrLink, qrLink) || other.qrLink == qrLink) &&
            (identical(other.availability, availability) ||
                other.availability == availability) &&
            (identical(other.branchId, branchId) ||
                other.branchId == branchId) &&
            (identical(other.branchName, branchName) ||
                other.branchName == branchName) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, noMeja, qrId, qrLink,
      availability, branchId, branchName, createdAt, updatedAt);

  /// Create a copy of TableModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TableModelImplCopyWith<_$TableModelImpl> get copyWith =>
      __$$TableModelImplCopyWithImpl<_$TableModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TableModelImplToJson(
      this,
    );
  }
}

abstract class _TableModel extends TableModel {
  const factory _TableModel(
      {@HiveField(0) @JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'user_id') final int? userId,
      @HiveField(1) @JsonKey(name: 'no_meja') final String? noMeja,
      @HiveField(2) @JsonKey(name: 'qr_id') final String? qrId,
      @HiveField(3) @JsonKey(name: 'qr_link') final String? qrLink,
      @HiveField(4) @JsonKey(name: 'availability') final String? availability,
      @JsonKey(name: 'branch_id') final int? branchId,
      @JsonKey(name: 'branch_name') final String? branchName,
      @JsonKey(name: 'created_at') final DateTime? createdAt,
      @JsonKey(name: 'updated_at')
      final DateTime? updatedAt}) = _$TableModelImpl;
  const _TableModel._() : super._();

  factory _TableModel.fromJson(Map<String, dynamic> json) =
      _$TableModelImpl.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'user_id')
  int? get userId;
  @override
  @HiveField(1)
  @JsonKey(name: 'no_meja')
  String? get noMeja;
  @override
  @HiveField(2)
  @JsonKey(name: 'qr_id')
  String? get qrId;
  @override
  @HiveField(3)
  @JsonKey(name: 'qr_link')
  String? get qrLink;
  @override
  @HiveField(4)
  @JsonKey(name: 'availability')
  String? get availability;
  @override
  @JsonKey(name: 'branch_id')
  int? get branchId;
  @override
  @JsonKey(name: 'branch_name')
  String? get branchName;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;

  /// Create a copy of TableModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TableModelImplCopyWith<_$TableModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
