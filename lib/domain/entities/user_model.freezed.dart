// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MlSettingUserModel _$MlSettingUserModelFromJson(Map<String, dynamic> json) {
  return _MlSettingUserModel.fromJson(json);
}

/// @nodoc
mixin _$MlSettingUserModel {
  @HiveField(0)
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: 'is_rounded')
  int? get rounded => throw _privateConstructorUsedError;

  /// Serializes this MlSettingUserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MlSettingUserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MlSettingUserModelCopyWith<MlSettingUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MlSettingUserModelCopyWith<$Res> {
  factory $MlSettingUserModelCopyWith(
          MlSettingUserModel value, $Res Function(MlSettingUserModel) then) =
      _$MlSettingUserModelCopyWithImpl<$Res, MlSettingUserModel>;
  @useResult
  $Res call(
      {@HiveField(0) @JsonKey(name: 'id') int? id,
      @HiveField(1) @JsonKey(name: 'is_rounded') int? rounded});
}

/// @nodoc
class _$MlSettingUserModelCopyWithImpl<$Res, $Val extends MlSettingUserModel>
    implements $MlSettingUserModelCopyWith<$Res> {
  _$MlSettingUserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MlSettingUserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? rounded = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      rounded: freezed == rounded
          ? _value.rounded
          : rounded // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MlSettingUserModelImplCopyWith<$Res>
    implements $MlSettingUserModelCopyWith<$Res> {
  factory _$$MlSettingUserModelImplCopyWith(_$MlSettingUserModelImpl value,
          $Res Function(_$MlSettingUserModelImpl) then) =
      __$$MlSettingUserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) @JsonKey(name: 'id') int? id,
      @HiveField(1) @JsonKey(name: 'is_rounded') int? rounded});
}

/// @nodoc
class __$$MlSettingUserModelImplCopyWithImpl<$Res>
    extends _$MlSettingUserModelCopyWithImpl<$Res, _$MlSettingUserModelImpl>
    implements _$$MlSettingUserModelImplCopyWith<$Res> {
  __$$MlSettingUserModelImplCopyWithImpl(_$MlSettingUserModelImpl _value,
      $Res Function(_$MlSettingUserModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MlSettingUserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? rounded = freezed,
  }) {
    return _then(_$MlSettingUserModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      rounded: freezed == rounded
          ? _value.rounded
          : rounded // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 15, adapterName: 'MlSettingUserModelAdapter')
class _$MlSettingUserModelImpl extends _MlSettingUserModel {
  const _$MlSettingUserModelImpl(
      {@HiveField(0) @JsonKey(name: 'id') this.id,
      @HiveField(1) @JsonKey(name: 'is_rounded') this.rounded})
      : super._();

  factory _$MlSettingUserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MlSettingUserModelImplFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: 'id')
  final int? id;
  @override
  @HiveField(1)
  @JsonKey(name: 'is_rounded')
  final int? rounded;

  @override
  String toString() {
    return 'MlSettingUserModel(id: $id, rounded: $rounded)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MlSettingUserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.rounded, rounded) || other.rounded == rounded));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, rounded);

  /// Create a copy of MlSettingUserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MlSettingUserModelImplCopyWith<_$MlSettingUserModelImpl> get copyWith =>
      __$$MlSettingUserModelImplCopyWithImpl<_$MlSettingUserModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MlSettingUserModelImplToJson(
      this,
    );
  }
}

abstract class _MlSettingUserModel extends MlSettingUserModel {
  const factory _MlSettingUserModel(
          {@HiveField(0) @JsonKey(name: 'id') final int? id,
          @HiveField(1) @JsonKey(name: 'is_rounded') final int? rounded}) =
      _$MlSettingUserModelImpl;
  const _MlSettingUserModel._() : super._();

  factory _MlSettingUserModel.fromJson(Map<String, dynamic> json) =
      _$MlSettingUserModelImpl.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: 'id')
  int? get id;
  @override
  @HiveField(1)
  @JsonKey(name: 'is_rounded')
  int? get rounded;

  /// Create a copy of MlSettingUserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MlSettingUserModelImplCopyWith<_$MlSettingUserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  @HiveField(0)
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: 'uuid')
  String? get uuid => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: 'email')
  String? get email => throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: 'username')
  String? get username => throw _privateConstructorUsedError;
  @HiveField(4)
  @JsonKey(name: 'fullname')
  String? get fullname => throw _privateConstructorUsedError;
  @HiveField(5)
  @JsonKey(name: 'phone')
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'roles')
  int? get roles => throw _privateConstructorUsedError;
  @JsonKey(name: 'role_code')
  String? get roleCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  int? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_upgraded')
  int? get isUpgraded => throw _privateConstructorUsedError;
  @JsonKey(name: 'upgrade_expiry')
  dynamic get upgradeExpiry => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_soft_delete')
  int? get isSoftDelete => throw _privateConstructorUsedError;
  @JsonKey(name: 'recovery_code')
  String? get recoveryCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'recovery_code_duration')
  dynamic get recoveryCodeDuration => throw _privateConstructorUsedError;
  @HiveField(6)
  @JsonKey(name: 'token')
  String? get token => throw _privateConstructorUsedError;
  @JsonKey(name: 'created')
  int? get created => throw _privateConstructorUsedError;
  @JsonKey(name: 'referal_source')
  String? get referalSource => throw _privateConstructorUsedError;
  @JsonKey(name: 'referal_code')
  String? get referalCode => throw _privateConstructorUsedError;
  @HiveField(7)
  @JsonKey(name: 'is_active')
  int? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_date')
  dynamic get startDate => throw _privateConstructorUsedError;
  @HiveField(8)
  @JsonKey(name: 'pin')
  String? get pin => throw _privateConstructorUsedError;
  @HiveField(11)
  @JsonKey(name: 'branch_id')
  int? get branchId => throw _privateConstructorUsedError;
  @JsonKey(name: 'position_id')
  dynamic get positionId => throw _privateConstructorUsedError;
  @HiveField(9)
  @JsonKey(name: 'petty_cash')
  int? get pettyCash => throw _privateConstructorUsedError;
  @HiveField(10)
  @JsonKey(name: 'status_cashier')
  int? get statusCashier => throw _privateConstructorUsedError;
  @JsonKey(name: 'tax')
  double? get tax => throw _privateConstructorUsedError;
  @JsonKey(name: 'bussines_name')
  String? get bussinessName => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_address')
  String? get bussinessAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'branch_name')
  String? get branchName => throw _privateConstructorUsedError;
  @JsonKey(name: 'printer_connection')
  String? get printerConnection =>
      throw _privateConstructorUsedError; // @JsonKey(name: 'printer_paper_size') String? printerPaperSize,
  @JsonKey(name: 'printer_custom_footer')
  String? get printerCustomFooter =>
      throw _privateConstructorUsedError; // @JsonKey(name: 'is_rounded') int? rounded,
  @HiveField(12)
  @JsonKey(name: 'ml_setting_user')
  MlSettingUserModel? get mlSettingUser => throw _privateConstructorUsedError;
  @HiveField(13)
  String? get logo => throw _privateConstructorUsedError;
  @HiveField(14)
  @JsonKey(name: 'profile_picture')
  String? get profilePicture => throw _privateConstructorUsedError;

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {@HiveField(0) @JsonKey(name: 'id') int? id,
      @HiveField(1) @JsonKey(name: 'uuid') String? uuid,
      @HiveField(2) @JsonKey(name: 'email') String? email,
      @HiveField(3) @JsonKey(name: 'username') String? username,
      @HiveField(4) @JsonKey(name: 'fullname') String? fullname,
      @HiveField(5) @JsonKey(name: 'phone') String? phone,
      @JsonKey(name: 'roles') int? roles,
      @JsonKey(name: 'role_code') String? roleCode,
      @JsonKey(name: 'status') int? status,
      @JsonKey(name: 'is_upgraded') int? isUpgraded,
      @JsonKey(name: 'upgrade_expiry') dynamic upgradeExpiry,
      @JsonKey(name: 'is_soft_delete') int? isSoftDelete,
      @JsonKey(name: 'recovery_code') String? recoveryCode,
      @JsonKey(name: 'recovery_code_duration') dynamic recoveryCodeDuration,
      @HiveField(6) @JsonKey(name: 'token') String? token,
      @JsonKey(name: 'created') int? created,
      @JsonKey(name: 'referal_source') String? referalSource,
      @JsonKey(name: 'referal_code') String? referalCode,
      @HiveField(7) @JsonKey(name: 'is_active') int? isActive,
      @JsonKey(name: 'start_date') dynamic startDate,
      @HiveField(8) @JsonKey(name: 'pin') String? pin,
      @HiveField(11) @JsonKey(name: 'branch_id') int? branchId,
      @JsonKey(name: 'position_id') dynamic positionId,
      @HiveField(9) @JsonKey(name: 'petty_cash') int? pettyCash,
      @HiveField(10) @JsonKey(name: 'status_cashier') int? statusCashier,
      @JsonKey(name: 'tax') double? tax,
      @JsonKey(name: 'bussines_name') String? bussinessName,
      @JsonKey(name: 'business_address') String? bussinessAddress,
      @JsonKey(name: 'branch_name') String? branchName,
      @JsonKey(name: 'printer_connection') String? printerConnection,
      @JsonKey(name: 'printer_custom_footer') String? printerCustomFooter,
      @HiveField(12)
      @JsonKey(name: 'ml_setting_user')
      MlSettingUserModel? mlSettingUser,
      @HiveField(13) String? logo,
      @HiveField(14) @JsonKey(name: 'profile_picture') String? profilePicture});

  $MlSettingUserModelCopyWith<$Res>? get mlSettingUser;
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? uuid = freezed,
    Object? email = freezed,
    Object? username = freezed,
    Object? fullname = freezed,
    Object? phone = freezed,
    Object? roles = freezed,
    Object? roleCode = freezed,
    Object? status = freezed,
    Object? isUpgraded = freezed,
    Object? upgradeExpiry = freezed,
    Object? isSoftDelete = freezed,
    Object? recoveryCode = freezed,
    Object? recoveryCodeDuration = freezed,
    Object? token = freezed,
    Object? created = freezed,
    Object? referalSource = freezed,
    Object? referalCode = freezed,
    Object? isActive = freezed,
    Object? startDate = freezed,
    Object? pin = freezed,
    Object? branchId = freezed,
    Object? positionId = freezed,
    Object? pettyCash = freezed,
    Object? statusCashier = freezed,
    Object? tax = freezed,
    Object? bussinessName = freezed,
    Object? bussinessAddress = freezed,
    Object? branchName = freezed,
    Object? printerConnection = freezed,
    Object? printerCustomFooter = freezed,
    Object? mlSettingUser = freezed,
    Object? logo = freezed,
    Object? profilePicture = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      fullname: freezed == fullname
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      roles: freezed == roles
          ? _value.roles
          : roles // ignore: cast_nullable_to_non_nullable
              as int?,
      roleCode: freezed == roleCode
          ? _value.roleCode
          : roleCode // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      isUpgraded: freezed == isUpgraded
          ? _value.isUpgraded
          : isUpgraded // ignore: cast_nullable_to_non_nullable
              as int?,
      upgradeExpiry: freezed == upgradeExpiry
          ? _value.upgradeExpiry
          : upgradeExpiry // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isSoftDelete: freezed == isSoftDelete
          ? _value.isSoftDelete
          : isSoftDelete // ignore: cast_nullable_to_non_nullable
              as int?,
      recoveryCode: freezed == recoveryCode
          ? _value.recoveryCode
          : recoveryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      recoveryCodeDuration: freezed == recoveryCodeDuration
          ? _value.recoveryCodeDuration
          : recoveryCodeDuration // ignore: cast_nullable_to_non_nullable
              as dynamic,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as int?,
      referalSource: freezed == referalSource
          ? _value.referalSource
          : referalSource // ignore: cast_nullable_to_non_nullable
              as String?,
      referalCode: freezed == referalCode
          ? _value.referalCode
          : referalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      pin: freezed == pin
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String?,
      branchId: freezed == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as int?,
      positionId: freezed == positionId
          ? _value.positionId
          : positionId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      pettyCash: freezed == pettyCash
          ? _value.pettyCash
          : pettyCash // ignore: cast_nullable_to_non_nullable
              as int?,
      statusCashier: freezed == statusCashier
          ? _value.statusCashier
          : statusCashier // ignore: cast_nullable_to_non_nullable
              as int?,
      tax: freezed == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double?,
      bussinessName: freezed == bussinessName
          ? _value.bussinessName
          : bussinessName // ignore: cast_nullable_to_non_nullable
              as String?,
      bussinessAddress: freezed == bussinessAddress
          ? _value.bussinessAddress
          : bussinessAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      branchName: freezed == branchName
          ? _value.branchName
          : branchName // ignore: cast_nullable_to_non_nullable
              as String?,
      printerConnection: freezed == printerConnection
          ? _value.printerConnection
          : printerConnection // ignore: cast_nullable_to_non_nullable
              as String?,
      printerCustomFooter: freezed == printerCustomFooter
          ? _value.printerCustomFooter
          : printerCustomFooter // ignore: cast_nullable_to_non_nullable
              as String?,
      mlSettingUser: freezed == mlSettingUser
          ? _value.mlSettingUser
          : mlSettingUser // ignore: cast_nullable_to_non_nullable
              as MlSettingUserModel?,
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MlSettingUserModelCopyWith<$Res>? get mlSettingUser {
    if (_value.mlSettingUser == null) {
      return null;
    }

    return $MlSettingUserModelCopyWith<$Res>(_value.mlSettingUser!, (value) {
      return _then(_value.copyWith(mlSettingUser: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) @JsonKey(name: 'id') int? id,
      @HiveField(1) @JsonKey(name: 'uuid') String? uuid,
      @HiveField(2) @JsonKey(name: 'email') String? email,
      @HiveField(3) @JsonKey(name: 'username') String? username,
      @HiveField(4) @JsonKey(name: 'fullname') String? fullname,
      @HiveField(5) @JsonKey(name: 'phone') String? phone,
      @JsonKey(name: 'roles') int? roles,
      @JsonKey(name: 'role_code') String? roleCode,
      @JsonKey(name: 'status') int? status,
      @JsonKey(name: 'is_upgraded') int? isUpgraded,
      @JsonKey(name: 'upgrade_expiry') dynamic upgradeExpiry,
      @JsonKey(name: 'is_soft_delete') int? isSoftDelete,
      @JsonKey(name: 'recovery_code') String? recoveryCode,
      @JsonKey(name: 'recovery_code_duration') dynamic recoveryCodeDuration,
      @HiveField(6) @JsonKey(name: 'token') String? token,
      @JsonKey(name: 'created') int? created,
      @JsonKey(name: 'referal_source') String? referalSource,
      @JsonKey(name: 'referal_code') String? referalCode,
      @HiveField(7) @JsonKey(name: 'is_active') int? isActive,
      @JsonKey(name: 'start_date') dynamic startDate,
      @HiveField(8) @JsonKey(name: 'pin') String? pin,
      @HiveField(11) @JsonKey(name: 'branch_id') int? branchId,
      @JsonKey(name: 'position_id') dynamic positionId,
      @HiveField(9) @JsonKey(name: 'petty_cash') int? pettyCash,
      @HiveField(10) @JsonKey(name: 'status_cashier') int? statusCashier,
      @JsonKey(name: 'tax') double? tax,
      @JsonKey(name: 'bussines_name') String? bussinessName,
      @JsonKey(name: 'business_address') String? bussinessAddress,
      @JsonKey(name: 'branch_name') String? branchName,
      @JsonKey(name: 'printer_connection') String? printerConnection,
      @JsonKey(name: 'printer_custom_footer') String? printerCustomFooter,
      @HiveField(12)
      @JsonKey(name: 'ml_setting_user')
      MlSettingUserModel? mlSettingUser,
      @HiveField(13) String? logo,
      @HiveField(14) @JsonKey(name: 'profile_picture') String? profilePicture});

  @override
  $MlSettingUserModelCopyWith<$Res>? get mlSettingUser;
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? uuid = freezed,
    Object? email = freezed,
    Object? username = freezed,
    Object? fullname = freezed,
    Object? phone = freezed,
    Object? roles = freezed,
    Object? roleCode = freezed,
    Object? status = freezed,
    Object? isUpgraded = freezed,
    Object? upgradeExpiry = freezed,
    Object? isSoftDelete = freezed,
    Object? recoveryCode = freezed,
    Object? recoveryCodeDuration = freezed,
    Object? token = freezed,
    Object? created = freezed,
    Object? referalSource = freezed,
    Object? referalCode = freezed,
    Object? isActive = freezed,
    Object? startDate = freezed,
    Object? pin = freezed,
    Object? branchId = freezed,
    Object? positionId = freezed,
    Object? pettyCash = freezed,
    Object? statusCashier = freezed,
    Object? tax = freezed,
    Object? bussinessName = freezed,
    Object? bussinessAddress = freezed,
    Object? branchName = freezed,
    Object? printerConnection = freezed,
    Object? printerCustomFooter = freezed,
    Object? mlSettingUser = freezed,
    Object? logo = freezed,
    Object? profilePicture = freezed,
  }) {
    return _then(_$UserModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      fullname: freezed == fullname
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      roles: freezed == roles
          ? _value.roles
          : roles // ignore: cast_nullable_to_non_nullable
              as int?,
      roleCode: freezed == roleCode
          ? _value.roleCode
          : roleCode // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      isUpgraded: freezed == isUpgraded
          ? _value.isUpgraded
          : isUpgraded // ignore: cast_nullable_to_non_nullable
              as int?,
      upgradeExpiry: freezed == upgradeExpiry
          ? _value.upgradeExpiry
          : upgradeExpiry // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isSoftDelete: freezed == isSoftDelete
          ? _value.isSoftDelete
          : isSoftDelete // ignore: cast_nullable_to_non_nullable
              as int?,
      recoveryCode: freezed == recoveryCode
          ? _value.recoveryCode
          : recoveryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      recoveryCodeDuration: freezed == recoveryCodeDuration
          ? _value.recoveryCodeDuration
          : recoveryCodeDuration // ignore: cast_nullable_to_non_nullable
              as dynamic,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as int?,
      referalSource: freezed == referalSource
          ? _value.referalSource
          : referalSource // ignore: cast_nullable_to_non_nullable
              as String?,
      referalCode: freezed == referalCode
          ? _value.referalCode
          : referalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      pin: freezed == pin
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String?,
      branchId: freezed == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as int?,
      positionId: freezed == positionId
          ? _value.positionId
          : positionId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      pettyCash: freezed == pettyCash
          ? _value.pettyCash
          : pettyCash // ignore: cast_nullable_to_non_nullable
              as int?,
      statusCashier: freezed == statusCashier
          ? _value.statusCashier
          : statusCashier // ignore: cast_nullable_to_non_nullable
              as int?,
      tax: freezed == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double?,
      bussinessName: freezed == bussinessName
          ? _value.bussinessName
          : bussinessName // ignore: cast_nullable_to_non_nullable
              as String?,
      bussinessAddress: freezed == bussinessAddress
          ? _value.bussinessAddress
          : bussinessAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      branchName: freezed == branchName
          ? _value.branchName
          : branchName // ignore: cast_nullable_to_non_nullable
              as String?,
      printerConnection: freezed == printerConnection
          ? _value.printerConnection
          : printerConnection // ignore: cast_nullable_to_non_nullable
              as String?,
      printerCustomFooter: freezed == printerCustomFooter
          ? _value.printerCustomFooter
          : printerCustomFooter // ignore: cast_nullable_to_non_nullable
              as String?,
      mlSettingUser: freezed == mlSettingUser
          ? _value.mlSettingUser
          : mlSettingUser // ignore: cast_nullable_to_non_nullable
              as MlSettingUserModel?,
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 1, adapterName: 'UserModelAdapter')
class _$UserModelImpl extends _UserModel {
  const _$UserModelImpl(
      {@HiveField(0) @JsonKey(name: 'id') this.id,
      @HiveField(1) @JsonKey(name: 'uuid') this.uuid,
      @HiveField(2) @JsonKey(name: 'email') this.email,
      @HiveField(3) @JsonKey(name: 'username') this.username,
      @HiveField(4) @JsonKey(name: 'fullname') this.fullname,
      @HiveField(5) @JsonKey(name: 'phone') this.phone,
      @JsonKey(name: 'roles') this.roles,
      @JsonKey(name: 'role_code') this.roleCode,
      @JsonKey(name: 'status') this.status,
      @JsonKey(name: 'is_upgraded') this.isUpgraded,
      @JsonKey(name: 'upgrade_expiry') this.upgradeExpiry,
      @JsonKey(name: 'is_soft_delete') this.isSoftDelete,
      @JsonKey(name: 'recovery_code') this.recoveryCode,
      @JsonKey(name: 'recovery_code_duration') this.recoveryCodeDuration,
      @HiveField(6) @JsonKey(name: 'token') this.token,
      @JsonKey(name: 'created') this.created,
      @JsonKey(name: 'referal_source') this.referalSource,
      @JsonKey(name: 'referal_code') this.referalCode,
      @HiveField(7) @JsonKey(name: 'is_active') this.isActive,
      @JsonKey(name: 'start_date') this.startDate,
      @HiveField(8) @JsonKey(name: 'pin') this.pin,
      @HiveField(11) @JsonKey(name: 'branch_id') this.branchId,
      @JsonKey(name: 'position_id') this.positionId,
      @HiveField(9) @JsonKey(name: 'petty_cash') this.pettyCash,
      @HiveField(10) @JsonKey(name: 'status_cashier') this.statusCashier,
      @JsonKey(name: 'tax') this.tax,
      @JsonKey(name: 'bussines_name') this.bussinessName,
      @JsonKey(name: 'business_address') this.bussinessAddress,
      @JsonKey(name: 'branch_name') this.branchName,
      @JsonKey(name: 'printer_connection') this.printerConnection,
      @JsonKey(name: 'printer_custom_footer') this.printerCustomFooter,
      @HiveField(12) @JsonKey(name: 'ml_setting_user') this.mlSettingUser,
      @HiveField(13) this.logo,
      @HiveField(14) @JsonKey(name: 'profile_picture') this.profilePicture})
      : super._();

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: 'id')
  final int? id;
  @override
  @HiveField(1)
  @JsonKey(name: 'uuid')
  final String? uuid;
  @override
  @HiveField(2)
  @JsonKey(name: 'email')
  final String? email;
  @override
  @HiveField(3)
  @JsonKey(name: 'username')
  final String? username;
  @override
  @HiveField(4)
  @JsonKey(name: 'fullname')
  final String? fullname;
  @override
  @HiveField(5)
  @JsonKey(name: 'phone')
  final String? phone;
  @override
  @JsonKey(name: 'roles')
  final int? roles;
  @override
  @JsonKey(name: 'role_code')
  final String? roleCode;
  @override
  @JsonKey(name: 'status')
  final int? status;
  @override
  @JsonKey(name: 'is_upgraded')
  final int? isUpgraded;
  @override
  @JsonKey(name: 'upgrade_expiry')
  final dynamic upgradeExpiry;
  @override
  @JsonKey(name: 'is_soft_delete')
  final int? isSoftDelete;
  @override
  @JsonKey(name: 'recovery_code')
  final String? recoveryCode;
  @override
  @JsonKey(name: 'recovery_code_duration')
  final dynamic recoveryCodeDuration;
  @override
  @HiveField(6)
  @JsonKey(name: 'token')
  final String? token;
  @override
  @JsonKey(name: 'created')
  final int? created;
  @override
  @JsonKey(name: 'referal_source')
  final String? referalSource;
  @override
  @JsonKey(name: 'referal_code')
  final String? referalCode;
  @override
  @HiveField(7)
  @JsonKey(name: 'is_active')
  final int? isActive;
  @override
  @JsonKey(name: 'start_date')
  final dynamic startDate;
  @override
  @HiveField(8)
  @JsonKey(name: 'pin')
  final String? pin;
  @override
  @HiveField(11)
  @JsonKey(name: 'branch_id')
  final int? branchId;
  @override
  @JsonKey(name: 'position_id')
  final dynamic positionId;
  @override
  @HiveField(9)
  @JsonKey(name: 'petty_cash')
  final int? pettyCash;
  @override
  @HiveField(10)
  @JsonKey(name: 'status_cashier')
  final int? statusCashier;
  @override
  @JsonKey(name: 'tax')
  final double? tax;
  @override
  @JsonKey(name: 'bussines_name')
  final String? bussinessName;
  @override
  @JsonKey(name: 'business_address')
  final String? bussinessAddress;
  @override
  @JsonKey(name: 'branch_name')
  final String? branchName;
  @override
  @JsonKey(name: 'printer_connection')
  final String? printerConnection;
// @JsonKey(name: 'printer_paper_size') String? printerPaperSize,
  @override
  @JsonKey(name: 'printer_custom_footer')
  final String? printerCustomFooter;
// @JsonKey(name: 'is_rounded') int? rounded,
  @override
  @HiveField(12)
  @JsonKey(name: 'ml_setting_user')
  final MlSettingUserModel? mlSettingUser;
  @override
  @HiveField(13)
  final String? logo;
  @override
  @HiveField(14)
  @JsonKey(name: 'profile_picture')
  final String? profilePicture;

  @override
  String toString() {
    return 'UserModel(id: $id, uuid: $uuid, email: $email, username: $username, fullname: $fullname, phone: $phone, roles: $roles, roleCode: $roleCode, status: $status, isUpgraded: $isUpgraded, upgradeExpiry: $upgradeExpiry, isSoftDelete: $isSoftDelete, recoveryCode: $recoveryCode, recoveryCodeDuration: $recoveryCodeDuration, token: $token, created: $created, referalSource: $referalSource, referalCode: $referalCode, isActive: $isActive, startDate: $startDate, pin: $pin, branchId: $branchId, positionId: $positionId, pettyCash: $pettyCash, statusCashier: $statusCashier, tax: $tax, bussinessName: $bussinessName, bussinessAddress: $bussinessAddress, branchName: $branchName, printerConnection: $printerConnection, printerCustomFooter: $printerCustomFooter, mlSettingUser: $mlSettingUser, logo: $logo, profilePicture: $profilePicture)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.fullname, fullname) ||
                other.fullname == fullname) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.roles, roles) || other.roles == roles) &&
            (identical(other.roleCode, roleCode) ||
                other.roleCode == roleCode) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isUpgraded, isUpgraded) ||
                other.isUpgraded == isUpgraded) &&
            const DeepCollectionEquality()
                .equals(other.upgradeExpiry, upgradeExpiry) &&
            (identical(other.isSoftDelete, isSoftDelete) ||
                other.isSoftDelete == isSoftDelete) &&
            (identical(other.recoveryCode, recoveryCode) ||
                other.recoveryCode == recoveryCode) &&
            const DeepCollectionEquality()
                .equals(other.recoveryCodeDuration, recoveryCodeDuration) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.referalSource, referalSource) ||
                other.referalSource == referalSource) &&
            (identical(other.referalCode, referalCode) ||
                other.referalCode == referalCode) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            const DeepCollectionEquality().equals(other.startDate, startDate) &&
            (identical(other.pin, pin) || other.pin == pin) &&
            (identical(other.branchId, branchId) ||
                other.branchId == branchId) &&
            const DeepCollectionEquality()
                .equals(other.positionId, positionId) &&
            (identical(other.pettyCash, pettyCash) ||
                other.pettyCash == pettyCash) &&
            (identical(other.statusCashier, statusCashier) ||
                other.statusCashier == statusCashier) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.bussinessName, bussinessName) ||
                other.bussinessName == bussinessName) &&
            (identical(other.bussinessAddress, bussinessAddress) ||
                other.bussinessAddress == bussinessAddress) &&
            (identical(other.branchName, branchName) ||
                other.branchName == branchName) &&
            (identical(other.printerConnection, printerConnection) ||
                other.printerConnection == printerConnection) &&
            (identical(other.printerCustomFooter, printerCustomFooter) ||
                other.printerCustomFooter == printerCustomFooter) &&
            (identical(other.mlSettingUser, mlSettingUser) ||
                other.mlSettingUser == mlSettingUser) &&
            (identical(other.logo, logo) || other.logo == logo) &&
            (identical(other.profilePicture, profilePicture) ||
                other.profilePicture == profilePicture));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        uuid,
        email,
        username,
        fullname,
        phone,
        roles,
        roleCode,
        status,
        isUpgraded,
        const DeepCollectionEquality().hash(upgradeExpiry),
        isSoftDelete,
        recoveryCode,
        const DeepCollectionEquality().hash(recoveryCodeDuration),
        token,
        created,
        referalSource,
        referalCode,
        isActive,
        const DeepCollectionEquality().hash(startDate),
        pin,
        branchId,
        const DeepCollectionEquality().hash(positionId),
        pettyCash,
        statusCashier,
        tax,
        bussinessName,
        bussinessAddress,
        branchName,
        printerConnection,
        printerCustomFooter,
        mlSettingUser,
        logo,
        profilePicture
      ]);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel extends UserModel {
  const factory _UserModel(
      {@HiveField(0) @JsonKey(name: 'id') final int? id,
      @HiveField(1) @JsonKey(name: 'uuid') final String? uuid,
      @HiveField(2) @JsonKey(name: 'email') final String? email,
      @HiveField(3) @JsonKey(name: 'username') final String? username,
      @HiveField(4) @JsonKey(name: 'fullname') final String? fullname,
      @HiveField(5) @JsonKey(name: 'phone') final String? phone,
      @JsonKey(name: 'roles') final int? roles,
      @JsonKey(name: 'role_code') final String? roleCode,
      @JsonKey(name: 'status') final int? status,
      @JsonKey(name: 'is_upgraded') final int? isUpgraded,
      @JsonKey(name: 'upgrade_expiry') final dynamic upgradeExpiry,
      @JsonKey(name: 'is_soft_delete') final int? isSoftDelete,
      @JsonKey(name: 'recovery_code') final String? recoveryCode,
      @JsonKey(name: 'recovery_code_duration')
      final dynamic recoveryCodeDuration,
      @HiveField(6) @JsonKey(name: 'token') final String? token,
      @JsonKey(name: 'created') final int? created,
      @JsonKey(name: 'referal_source') final String? referalSource,
      @JsonKey(name: 'referal_code') final String? referalCode,
      @HiveField(7) @JsonKey(name: 'is_active') final int? isActive,
      @JsonKey(name: 'start_date') final dynamic startDate,
      @HiveField(8) @JsonKey(name: 'pin') final String? pin,
      @HiveField(11) @JsonKey(name: 'branch_id') final int? branchId,
      @JsonKey(name: 'position_id') final dynamic positionId,
      @HiveField(9) @JsonKey(name: 'petty_cash') final int? pettyCash,
      @HiveField(10) @JsonKey(name: 'status_cashier') final int? statusCashier,
      @JsonKey(name: 'tax') final double? tax,
      @JsonKey(name: 'bussines_name') final String? bussinessName,
      @JsonKey(name: 'business_address') final String? bussinessAddress,
      @JsonKey(name: 'branch_name') final String? branchName,
      @JsonKey(name: 'printer_connection') final String? printerConnection,
      @JsonKey(name: 'printer_custom_footer') final String? printerCustomFooter,
      @HiveField(12)
      @JsonKey(name: 'ml_setting_user')
      final MlSettingUserModel? mlSettingUser,
      @HiveField(13) final String? logo,
      @HiveField(14)
      @JsonKey(name: 'profile_picture')
      final String? profilePicture}) = _$UserModelImpl;
  const _UserModel._() : super._();

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: 'id')
  int? get id;
  @override
  @HiveField(1)
  @JsonKey(name: 'uuid')
  String? get uuid;
  @override
  @HiveField(2)
  @JsonKey(name: 'email')
  String? get email;
  @override
  @HiveField(3)
  @JsonKey(name: 'username')
  String? get username;
  @override
  @HiveField(4)
  @JsonKey(name: 'fullname')
  String? get fullname;
  @override
  @HiveField(5)
  @JsonKey(name: 'phone')
  String? get phone;
  @override
  @JsonKey(name: 'roles')
  int? get roles;
  @override
  @JsonKey(name: 'role_code')
  String? get roleCode;
  @override
  @JsonKey(name: 'status')
  int? get status;
  @override
  @JsonKey(name: 'is_upgraded')
  int? get isUpgraded;
  @override
  @JsonKey(name: 'upgrade_expiry')
  dynamic get upgradeExpiry;
  @override
  @JsonKey(name: 'is_soft_delete')
  int? get isSoftDelete;
  @override
  @JsonKey(name: 'recovery_code')
  String? get recoveryCode;
  @override
  @JsonKey(name: 'recovery_code_duration')
  dynamic get recoveryCodeDuration;
  @override
  @HiveField(6)
  @JsonKey(name: 'token')
  String? get token;
  @override
  @JsonKey(name: 'created')
  int? get created;
  @override
  @JsonKey(name: 'referal_source')
  String? get referalSource;
  @override
  @JsonKey(name: 'referal_code')
  String? get referalCode;
  @override
  @HiveField(7)
  @JsonKey(name: 'is_active')
  int? get isActive;
  @override
  @JsonKey(name: 'start_date')
  dynamic get startDate;
  @override
  @HiveField(8)
  @JsonKey(name: 'pin')
  String? get pin;
  @override
  @HiveField(11)
  @JsonKey(name: 'branch_id')
  int? get branchId;
  @override
  @JsonKey(name: 'position_id')
  dynamic get positionId;
  @override
  @HiveField(9)
  @JsonKey(name: 'petty_cash')
  int? get pettyCash;
  @override
  @HiveField(10)
  @JsonKey(name: 'status_cashier')
  int? get statusCashier;
  @override
  @JsonKey(name: 'tax')
  double? get tax;
  @override
  @JsonKey(name: 'bussines_name')
  String? get bussinessName;
  @override
  @JsonKey(name: 'business_address')
  String? get bussinessAddress;
  @override
  @JsonKey(name: 'branch_name')
  String? get branchName;
  @override
  @JsonKey(name: 'printer_connection')
  String?
      get printerConnection; // @JsonKey(name: 'printer_paper_size') String? printerPaperSize,
  @override
  @JsonKey(name: 'printer_custom_footer')
  String? get printerCustomFooter; // @JsonKey(name: 'is_rounded') int? rounded,
  @override
  @HiveField(12)
  @JsonKey(name: 'ml_setting_user')
  MlSettingUserModel? get mlSettingUser;
  @override
  @HiveField(13)
  String? get logo;
  @override
  @HiveField(14)
  @JsonKey(name: 'profile_picture')
  String? get profilePicture;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
