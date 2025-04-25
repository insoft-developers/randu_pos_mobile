// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_method_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PaymentMethodModelAdapter extends TypeAdapter<_$PaymentMethodModelImpl> {
  @override
  final int typeId = 11;

  @override
  _$PaymentMethodModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$PaymentMethodModelImpl();
  }

  @override
  void write(BinaryWriter writer, _$PaymentMethodModelImpl obj) {
    writer.writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PaymentMethodModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BankModelAdapter extends TypeAdapter<_$BankModelImpl> {
  @override
  final int typeId = 12;

  @override
  _$BankModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$BankModelImpl();
  }

  @override
  void write(BinaryWriter writer, _$BankModelImpl obj) {
    writer.writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BankModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FlagModelAdapter extends TypeAdapter<_$FlagModelImpl> {
  @override
  final int typeId = 13;

  @override
  _$FlagModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$FlagModelImpl();
  }

  @override
  void write(BinaryWriter writer, _$FlagModelImpl obj) {
    writer.writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FlagModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentMethodModelImpl _$$PaymentMethodModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentMethodModelImpl(
      id: (json['id'] as num?)?.toInt(),
      method: json['method'] as String?,
      selected: json['selected'] as bool?,
      code: json['code'] as String?,
      description: json['description'] as String?,
      bankModel: (json['items'] as List<dynamic>?)
          ?.map((e) => BankModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PaymentMethodModelImplToJson(
        _$PaymentMethodModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'method': instance.method,
      'selected': instance.selected,
      'code': instance.code,
      'description': instance.description,
      'items': instance.bankModel,
    };

_$BankModelImpl _$$BankModelImplFromJson(Map<String, dynamic> json) =>
    _$BankModelImpl(
      id: (json['id'] as num?)?.toInt(),
      code: json['code'] as String?,
      flagModel: (json['flag'] as List<dynamic>?)
          ?.map((e) => FlagModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      method: json['method'] as String?,
      selected: json['selected'] as bool?,
      bankOwner: json['bankOwner'] as String?,
      bankAccountNumber: json['bankAccountNumber'] as String?,
    );

Map<String, dynamic> _$$BankModelImplToJson(_$BankModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'flag': instance.flagModel,
      'method': instance.method,
      'selected': instance.selected,
      'bankOwner': instance.bankOwner,
      'bankAccountNumber': instance.bankAccountNumber,
    };

_$FlagModelImpl _$$FlagModelImplFromJson(Map<String, dynamic> json) =>
    _$FlagModelImpl(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      group: json['group'] as String?,
      paymentMethod: json['payment_method'] as String?,
      flag: json['flag'] as String?,
    );

Map<String, dynamic> _$$FlagModelImplToJson(_$FlagModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'group': instance.group,
      'payment_method': instance.paymentMethod,
      'flag': instance.flag,
    };
