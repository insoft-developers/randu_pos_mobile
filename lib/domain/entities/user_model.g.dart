// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MlSettingUserModelAdapter extends TypeAdapter<_$MlSettingUserModelImpl> {
  @override
  final int typeId = 15;

  @override
  _$MlSettingUserModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$MlSettingUserModelImpl(
      id: (fields[0] as num?)?.toInt(),
      rounded: (fields[1] as num?)?.toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, _$MlSettingUserModelImpl obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.rounded);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MlSettingUserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserModelAdapter extends TypeAdapter<_$UserModelImpl> {
  @override
  final int typeId = 1;

  @override
  _$UserModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$UserModelImpl(
      id: (fields[0] as num?)?.toInt(),
      uuid: fields[1] as String?,
      email: fields[2] as String?,
      username: fields[3] as String?,
      fullname: fields[4] as String?,
      phone: fields[5] as String?,
      token: fields[6] as String?,
      isActive: (fields[7] as num?)?.toInt(),
      pin: fields[8] as String?,
      branchId: (fields[11] as num?)?.toInt(),
      pettyCash: (fields[9] as num?)?.toInt(),
      statusCashier: (fields[10] as num?)?.toInt(),
      mlSettingUser: fields[12] as MlSettingUserModel?,
      logo: fields[13] as String?,
      profilePicture: fields[14] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, _$UserModelImpl obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.uuid)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.username)
      ..writeByte(4)
      ..write(obj.fullname)
      ..writeByte(5)
      ..write(obj.phone)
      ..writeByte(6)
      ..write(obj.token)
      ..writeByte(7)
      ..write(obj.isActive)
      ..writeByte(8)
      ..write(obj.pin)
      ..writeByte(9)
      ..write(obj.pettyCash)
      ..writeByte(10)
      ..write(obj.statusCashier)
      ..writeByte(11)
      ..write(obj.branchId)
      ..writeByte(12)
      ..write(obj.mlSettingUser)
      ..writeByte(13)
      ..write(obj.logo)
      ..writeByte(14)
      ..write(obj.profilePicture);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MlSettingUserModelImpl _$$MlSettingUserModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MlSettingUserModelImpl(
      id: (json['id'] as num?)?.toInt(),
      rounded: (json['is_rounded'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$MlSettingUserModelImplToJson(
        _$MlSettingUserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'is_rounded': instance.rounded,
    };

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: (json['id'] as num?)?.toInt(),
      uuid: json['uuid'] as String?,
      email: json['email'] as String?,
      username: json['username'] as String?,
      fullname: json['fullname'] as String?,
      phone: json['phone'] as String?,
      roles: (json['roles'] as num?)?.toInt(),
      roleCode: json['role_code'] as String?,
      status: (json['status'] as num?)?.toInt(),
      isUpgraded: (json['is_upgraded'] as num?)?.toInt(),
      upgradeExpiry: json['upgrade_expiry'],
      isSoftDelete: (json['is_soft_delete'] as num?)?.toInt(),
      recoveryCode: json['recovery_code'] as String?,
      recoveryCodeDuration: json['recovery_code_duration'],
      token: json['token'] as String?,
      created: (json['created'] as num?)?.toInt(),
      referalSource: json['referal_source'] as String?,
      referalCode: json['referal_code'] as String?,
      isActive: (json['is_active'] as num?)?.toInt(),
      startDate: json['start_date'],
      pin: json['pin'] as String?,
      branchId: (json['branch_id'] as num?)?.toInt(),
      positionId: json['position_id'],
      pettyCash: (json['petty_cash'] as num?)?.toInt(),
      statusCashier: (json['status_cashier'] as num?)?.toInt(),
      tax: (json['tax'] as num?)?.toDouble(),
      bussinessName: json['bussines_name'] as String?,
      bussinessAddress: json['business_address'] as String?,
      branchName: json['branch_name'] as String?,
      printerConnection: json['printer_connection'] as String?,
      printerCustomFooter: json['printer_custom_footer'] as String?,
      mlSettingUser: json['ml_setting_user'] == null
          ? null
          : MlSettingUserModel.fromJson(
              json['ml_setting_user'] as Map<String, dynamic>),
      logo: json['logo'] as String?,
      profilePicture: json['profile_picture'] as String?,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uuid': instance.uuid,
      'email': instance.email,
      'username': instance.username,
      'fullname': instance.fullname,
      'phone': instance.phone,
      'roles': instance.roles,
      'role_code': instance.roleCode,
      'status': instance.status,
      'is_upgraded': instance.isUpgraded,
      'upgrade_expiry': instance.upgradeExpiry,
      'is_soft_delete': instance.isSoftDelete,
      'recovery_code': instance.recoveryCode,
      'recovery_code_duration': instance.recoveryCodeDuration,
      'token': instance.token,
      'created': instance.created,
      'referal_source': instance.referalSource,
      'referal_code': instance.referalCode,
      'is_active': instance.isActive,
      'start_date': instance.startDate,
      'pin': instance.pin,
      'branch_id': instance.branchId,
      'position_id': instance.positionId,
      'petty_cash': instance.pettyCash,
      'status_cashier': instance.statusCashier,
      'tax': instance.tax,
      'bussines_name': instance.bussinessName,
      'business_address': instance.bussinessAddress,
      'branch_name': instance.branchName,
      'printer_connection': instance.printerConnection,
      'printer_custom_footer': instance.printerCustomFooter,
      'ml_setting_user': instance.mlSettingUser,
      'logo': instance.logo,
      'profile_picture': instance.profilePicture,
    };
