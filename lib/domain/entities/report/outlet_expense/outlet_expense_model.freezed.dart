// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'outlet_expense_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OutletExpenseModel _$OutletExpenseModelFromJson(Map<String, dynamic> json) {
  return _OutletExpenseModel.fromJson(json);
}

/// @nodoc
mixin _$OutletExpenseModel {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'amount')
  int? get amount =>
      throw _privateConstructorUsedError; // TODO : Make sure sync status data type
  @JsonKey(name: 'sync_status')
  dynamic get syncStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this OutletExpenseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OutletExpenseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OutletExpenseModelCopyWith<OutletExpenseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OutletExpenseModelCopyWith<$Res> {
  factory $OutletExpenseModelCopyWith(
          OutletExpenseModel value, $Res Function(OutletExpenseModel) then) =
      _$OutletExpenseModelCopyWithImpl<$Res, OutletExpenseModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'amount') int? amount,
      @JsonKey(name: 'sync_status') dynamic syncStatus,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class _$OutletExpenseModelCopyWithImpl<$Res, $Val extends OutletExpenseModel>
    implements $OutletExpenseModelCopyWith<$Res> {
  _$OutletExpenseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OutletExpenseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? name = freezed,
    Object? amount = freezed,
    Object? syncStatus = freezed,
    Object? createdAt = freezed,
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
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      syncStatus: freezed == syncStatus
          ? _value.syncStatus
          : syncStatus // ignore: cast_nullable_to_non_nullable
              as dynamic,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OutletExpenseModelImplCopyWith<$Res>
    implements $OutletExpenseModelCopyWith<$Res> {
  factory _$$OutletExpenseModelImplCopyWith(_$OutletExpenseModelImpl value,
          $Res Function(_$OutletExpenseModelImpl) then) =
      __$$OutletExpenseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'amount') int? amount,
      @JsonKey(name: 'sync_status') dynamic syncStatus,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class __$$OutletExpenseModelImplCopyWithImpl<$Res>
    extends _$OutletExpenseModelCopyWithImpl<$Res, _$OutletExpenseModelImpl>
    implements _$$OutletExpenseModelImplCopyWith<$Res> {
  __$$OutletExpenseModelImplCopyWithImpl(_$OutletExpenseModelImpl _value,
      $Res Function(_$OutletExpenseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of OutletExpenseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? name = freezed,
    Object? amount = freezed,
    Object? syncStatus = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$OutletExpenseModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      syncStatus: freezed == syncStatus
          ? _value.syncStatus
          : syncStatus // ignore: cast_nullable_to_non_nullable
              as dynamic,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OutletExpenseModelImpl implements _OutletExpenseModel {
  _$OutletExpenseModelImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'amount') this.amount,
      @JsonKey(name: 'sync_status') this.syncStatus,
      @JsonKey(name: 'created_at') this.createdAt});

  factory _$OutletExpenseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OutletExpenseModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'user_id')
  final int? userId;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'amount')
  final int? amount;
// TODO : Make sure sync status data type
  @override
  @JsonKey(name: 'sync_status')
  final dynamic syncStatus;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @override
  String toString() {
    return 'OutletExpenseModel(id: $id, userId: $userId, name: $name, amount: $amount, syncStatus: $syncStatus, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OutletExpenseModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            const DeepCollectionEquality()
                .equals(other.syncStatus, syncStatus) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, name, amount,
      const DeepCollectionEquality().hash(syncStatus), createdAt);

  /// Create a copy of OutletExpenseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OutletExpenseModelImplCopyWith<_$OutletExpenseModelImpl> get copyWith =>
      __$$OutletExpenseModelImplCopyWithImpl<_$OutletExpenseModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OutletExpenseModelImplToJson(
      this,
    );
  }
}

abstract class _OutletExpenseModel implements OutletExpenseModel {
  factory _OutletExpenseModel(
          {@JsonKey(name: 'id') final int? id,
          @JsonKey(name: 'user_id') final int? userId,
          @JsonKey(name: 'name') final String? name,
          @JsonKey(name: 'amount') final int? amount,
          @JsonKey(name: 'sync_status') final dynamic syncStatus,
          @JsonKey(name: 'created_at') final DateTime? createdAt}) =
      _$OutletExpenseModelImpl;

  factory _OutletExpenseModel.fromJson(Map<String, dynamic> json) =
      _$OutletExpenseModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'user_id')
  int? get userId;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'amount')
  int? get amount; // TODO : Make sure sync status data type
  @override
  @JsonKey(name: 'sync_status')
  dynamic get syncStatus;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;

  /// Create a copy of OutletExpenseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OutletExpenseModelImplCopyWith<_$OutletExpenseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
