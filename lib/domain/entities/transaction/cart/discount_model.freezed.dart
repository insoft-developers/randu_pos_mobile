// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'discount_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DiscountModel _$DiscountModelFromJson(Map<String, dynamic> json) {
  return _DiscountModel.fromJson(json);
}

/// @nodoc
mixin _$DiscountModel {
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get name => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get code => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get type => throw _privateConstructorUsedError;
  @HiveField(4)
  int? get value => throw _privateConstructorUsedError;
  @HiveField(5)
  @JsonKey(name: 'expired_at')
  String? get expiredAt => throw _privateConstructorUsedError;
  @HiveField(6)
  @JsonKey(name: 'min_order')
  int? get minOrder => throw _privateConstructorUsedError;
  @HiveField(7)
  @JsonKey(name: 'account_id')
  int? get accountId => throw _privateConstructorUsedError;
  @HiveField(8)
  @JsonKey(name: 'max_use')
  int? get maxUse => throw _privateConstructorUsedError;
  @HiveField(9)
  @JsonKey(name: 'allowed_multiple_use')
  int? get allowedMultipleUse => throw _privateConstructorUsedError;
  @HiveField(10)
  @JsonKey(name: 'discount_use')
  int? get discountUse => throw _privateConstructorUsedError;
  @HiveField(11)
  @JsonKey(name: 'discount_allowed_use')
  int? get discountAllowedUse => throw _privateConstructorUsedError;

  /// Serializes this DiscountModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DiscountModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DiscountModelCopyWith<DiscountModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiscountModelCopyWith<$Res> {
  factory $DiscountModelCopyWith(
          DiscountModel value, $Res Function(DiscountModel) then) =
      _$DiscountModelCopyWithImpl<$Res, DiscountModel>;
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String? name,
      @HiveField(2) String? code,
      @HiveField(3) String? type,
      @HiveField(4) int? value,
      @HiveField(5) @JsonKey(name: 'expired_at') String? expiredAt,
      @HiveField(6) @JsonKey(name: 'min_order') int? minOrder,
      @HiveField(7) @JsonKey(name: 'account_id') int? accountId,
      @HiveField(8) @JsonKey(name: 'max_use') int? maxUse,
      @HiveField(9)
      @JsonKey(name: 'allowed_multiple_use')
      int? allowedMultipleUse,
      @HiveField(10) @JsonKey(name: 'discount_use') int? discountUse,
      @HiveField(11)
      @JsonKey(name: 'discount_allowed_use')
      int? discountAllowedUse});
}

/// @nodoc
class _$DiscountModelCopyWithImpl<$Res, $Val extends DiscountModel>
    implements $DiscountModelCopyWith<$Res> {
  _$DiscountModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DiscountModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? code = freezed,
    Object? type = freezed,
    Object? value = freezed,
    Object? expiredAt = freezed,
    Object? minOrder = freezed,
    Object? accountId = freezed,
    Object? maxUse = freezed,
    Object? allowedMultipleUse = freezed,
    Object? discountUse = freezed,
    Object? discountAllowedUse = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int?,
      expiredAt: freezed == expiredAt
          ? _value.expiredAt
          : expiredAt // ignore: cast_nullable_to_non_nullable
              as String?,
      minOrder: freezed == minOrder
          ? _value.minOrder
          : minOrder // ignore: cast_nullable_to_non_nullable
              as int?,
      accountId: freezed == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as int?,
      maxUse: freezed == maxUse
          ? _value.maxUse
          : maxUse // ignore: cast_nullable_to_non_nullable
              as int?,
      allowedMultipleUse: freezed == allowedMultipleUse
          ? _value.allowedMultipleUse
          : allowedMultipleUse // ignore: cast_nullable_to_non_nullable
              as int?,
      discountUse: freezed == discountUse
          ? _value.discountUse
          : discountUse // ignore: cast_nullable_to_non_nullable
              as int?,
      discountAllowedUse: freezed == discountAllowedUse
          ? _value.discountAllowedUse
          : discountAllowedUse // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DiscountModelImplCopyWith<$Res>
    implements $DiscountModelCopyWith<$Res> {
  factory _$$DiscountModelImplCopyWith(
          _$DiscountModelImpl value, $Res Function(_$DiscountModelImpl) then) =
      __$$DiscountModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String? name,
      @HiveField(2) String? code,
      @HiveField(3) String? type,
      @HiveField(4) int? value,
      @HiveField(5) @JsonKey(name: 'expired_at') String? expiredAt,
      @HiveField(6) @JsonKey(name: 'min_order') int? minOrder,
      @HiveField(7) @JsonKey(name: 'account_id') int? accountId,
      @HiveField(8) @JsonKey(name: 'max_use') int? maxUse,
      @HiveField(9)
      @JsonKey(name: 'allowed_multiple_use')
      int? allowedMultipleUse,
      @HiveField(10) @JsonKey(name: 'discount_use') int? discountUse,
      @HiveField(11)
      @JsonKey(name: 'discount_allowed_use')
      int? discountAllowedUse});
}

/// @nodoc
class __$$DiscountModelImplCopyWithImpl<$Res>
    extends _$DiscountModelCopyWithImpl<$Res, _$DiscountModelImpl>
    implements _$$DiscountModelImplCopyWith<$Res> {
  __$$DiscountModelImplCopyWithImpl(
      _$DiscountModelImpl _value, $Res Function(_$DiscountModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiscountModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? code = freezed,
    Object? type = freezed,
    Object? value = freezed,
    Object? expiredAt = freezed,
    Object? minOrder = freezed,
    Object? accountId = freezed,
    Object? maxUse = freezed,
    Object? allowedMultipleUse = freezed,
    Object? discountUse = freezed,
    Object? discountAllowedUse = freezed,
  }) {
    return _then(_$DiscountModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int?,
      expiredAt: freezed == expiredAt
          ? _value.expiredAt
          : expiredAt // ignore: cast_nullable_to_non_nullable
              as String?,
      minOrder: freezed == minOrder
          ? _value.minOrder
          : minOrder // ignore: cast_nullable_to_non_nullable
              as int?,
      accountId: freezed == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as int?,
      maxUse: freezed == maxUse
          ? _value.maxUse
          : maxUse // ignore: cast_nullable_to_non_nullable
              as int?,
      allowedMultipleUse: freezed == allowedMultipleUse
          ? _value.allowedMultipleUse
          : allowedMultipleUse // ignore: cast_nullable_to_non_nullable
              as int?,
      discountUse: freezed == discountUse
          ? _value.discountUse
          : discountUse // ignore: cast_nullable_to_non_nullable
              as int?,
      discountAllowedUse: freezed == discountAllowedUse
          ? _value.discountAllowedUse
          : discountAllowedUse // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 8, adapterName: 'DiscountModelAdapter')
class _$DiscountModelImpl implements _DiscountModel {
  const _$DiscountModelImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) this.name,
      @HiveField(2) this.code,
      @HiveField(3) this.type,
      @HiveField(4) this.value,
      @HiveField(5) @JsonKey(name: 'expired_at') this.expiredAt,
      @HiveField(6) @JsonKey(name: 'min_order') this.minOrder,
      @HiveField(7) @JsonKey(name: 'account_id') this.accountId,
      @HiveField(8) @JsonKey(name: 'max_use') this.maxUse,
      @HiveField(9)
      @JsonKey(name: 'allowed_multiple_use')
      this.allowedMultipleUse,
      @HiveField(10) @JsonKey(name: 'discount_use') this.discountUse,
      @HiveField(11)
      @JsonKey(name: 'discount_allowed_use')
      this.discountAllowedUse});

  factory _$DiscountModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DiscountModelImplFromJson(json);

  @override
  @HiveField(0)
  final int id;
  @override
  @HiveField(1)
  final String? name;
  @override
  @HiveField(2)
  final String? code;
  @override
  @HiveField(3)
  final String? type;
  @override
  @HiveField(4)
  final int? value;
  @override
  @HiveField(5)
  @JsonKey(name: 'expired_at')
  final String? expiredAt;
  @override
  @HiveField(6)
  @JsonKey(name: 'min_order')
  final int? minOrder;
  @override
  @HiveField(7)
  @JsonKey(name: 'account_id')
  final int? accountId;
  @override
  @HiveField(8)
  @JsonKey(name: 'max_use')
  final int? maxUse;
  @override
  @HiveField(9)
  @JsonKey(name: 'allowed_multiple_use')
  final int? allowedMultipleUse;
  @override
  @HiveField(10)
  @JsonKey(name: 'discount_use')
  final int? discountUse;
  @override
  @HiveField(11)
  @JsonKey(name: 'discount_allowed_use')
  final int? discountAllowedUse;

  @override
  String toString() {
    return 'DiscountModel(id: $id, name: $name, code: $code, type: $type, value: $value, expiredAt: $expiredAt, minOrder: $minOrder, accountId: $accountId, maxUse: $maxUse, allowedMultipleUse: $allowedMultipleUse, discountUse: $discountUse, discountAllowedUse: $discountAllowedUse)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiscountModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.expiredAt, expiredAt) ||
                other.expiredAt == expiredAt) &&
            (identical(other.minOrder, minOrder) ||
                other.minOrder == minOrder) &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.maxUse, maxUse) || other.maxUse == maxUse) &&
            (identical(other.allowedMultipleUse, allowedMultipleUse) ||
                other.allowedMultipleUse == allowedMultipleUse) &&
            (identical(other.discountUse, discountUse) ||
                other.discountUse == discountUse) &&
            (identical(other.discountAllowedUse, discountAllowedUse) ||
                other.discountAllowedUse == discountAllowedUse));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      code,
      type,
      value,
      expiredAt,
      minOrder,
      accountId,
      maxUse,
      allowedMultipleUse,
      discountUse,
      discountAllowedUse);

  /// Create a copy of DiscountModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DiscountModelImplCopyWith<_$DiscountModelImpl> get copyWith =>
      __$$DiscountModelImplCopyWithImpl<_$DiscountModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DiscountModelImplToJson(
      this,
    );
  }
}

abstract class _DiscountModel implements DiscountModel {
  const factory _DiscountModel(
      {@HiveField(0) required final int id,
      @HiveField(1) final String? name,
      @HiveField(2) final String? code,
      @HiveField(3) final String? type,
      @HiveField(4) final int? value,
      @HiveField(5) @JsonKey(name: 'expired_at') final String? expiredAt,
      @HiveField(6) @JsonKey(name: 'min_order') final int? minOrder,
      @HiveField(7) @JsonKey(name: 'account_id') final int? accountId,
      @HiveField(8) @JsonKey(name: 'max_use') final int? maxUse,
      @HiveField(9)
      @JsonKey(name: 'allowed_multiple_use')
      final int? allowedMultipleUse,
      @HiveField(10) @JsonKey(name: 'discount_use') final int? discountUse,
      @HiveField(11)
      @JsonKey(name: 'discount_allowed_use')
      final int? discountAllowedUse}) = _$DiscountModelImpl;

  factory _DiscountModel.fromJson(Map<String, dynamic> json) =
      _$DiscountModelImpl.fromJson;

  @override
  @HiveField(0)
  int get id;
  @override
  @HiveField(1)
  String? get name;
  @override
  @HiveField(2)
  String? get code;
  @override
  @HiveField(3)
  String? get type;
  @override
  @HiveField(4)
  int? get value;
  @override
  @HiveField(5)
  @JsonKey(name: 'expired_at')
  String? get expiredAt;
  @override
  @HiveField(6)
  @JsonKey(name: 'min_order')
  int? get minOrder;
  @override
  @HiveField(7)
  @JsonKey(name: 'account_id')
  int? get accountId;
  @override
  @HiveField(8)
  @JsonKey(name: 'max_use')
  int? get maxUse;
  @override
  @HiveField(9)
  @JsonKey(name: 'allowed_multiple_use')
  int? get allowedMultipleUse;
  @override
  @HiveField(10)
  @JsonKey(name: 'discount_use')
  int? get discountUse;
  @override
  @HiveField(11)
  @JsonKey(name: 'discount_allowed_use')
  int? get discountAllowedUse;

  /// Create a copy of DiscountModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DiscountModelImplCopyWith<_$DiscountModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
