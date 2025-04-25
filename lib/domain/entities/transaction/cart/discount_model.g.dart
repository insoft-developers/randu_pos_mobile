// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discount_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DiscountModelAdapter extends TypeAdapter<_$DiscountModelImpl> {
  @override
  final int typeId = 8;

  @override
  _$DiscountModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$DiscountModelImpl(
      id: (fields[0] as num).toInt(),
      name: fields[1] as String?,
      code: fields[2] as String?,
      type: fields[3] as String?,
      value: (fields[4] as num?)?.toInt(),
      expiredAt: fields[5] as String?,
      minOrder: (fields[6] as num?)?.toInt(),
      accountId: (fields[7] as num?)?.toInt(),
      maxUse: (fields[8] as num?)?.toInt(),
      allowedMultipleUse: (fields[9] as num?)?.toInt(),
      discountUse: (fields[10] as num?)?.toInt(),
      discountAllowedUse: (fields[11] as num?)?.toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, _$DiscountModelImpl obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.code)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.value)
      ..writeByte(5)
      ..write(obj.expiredAt)
      ..writeByte(6)
      ..write(obj.minOrder)
      ..writeByte(7)
      ..write(obj.accountId)
      ..writeByte(8)
      ..write(obj.maxUse)
      ..writeByte(9)
      ..write(obj.allowedMultipleUse)
      ..writeByte(10)
      ..write(obj.discountUse)
      ..writeByte(11)
      ..write(obj.discountAllowedUse);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DiscountModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DiscountModelImpl _$$DiscountModelImplFromJson(Map<String, dynamic> json) =>
    _$DiscountModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      code: json['code'] as String?,
      type: json['type'] as String?,
      value: (json['value'] as num?)?.toInt(),
      expiredAt: json['expired_at'] as String?,
      minOrder: (json['min_order'] as num?)?.toInt(),
      accountId: (json['account_id'] as num?)?.toInt(),
      maxUse: (json['max_use'] as num?)?.toInt(),
      allowedMultipleUse: (json['allowed_multiple_use'] as num?)?.toInt(),
      discountUse: (json['discount_use'] as num?)?.toInt(),
      discountAllowedUse: (json['discount_allowed_use'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$DiscountModelImplToJson(_$DiscountModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'type': instance.type,
      'value': instance.value,
      'expired_at': instance.expiredAt,
      'min_order': instance.minOrder,
      'account_id': instance.accountId,
      'max_use': instance.maxUse,
      'allowed_multiple_use': instance.allowedMultipleUse,
      'discount_use': instance.discountUse,
      'discount_allowed_use': instance.discountAllowedUse,
    };
