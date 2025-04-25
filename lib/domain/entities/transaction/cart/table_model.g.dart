// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TableModelAdapter extends TypeAdapter<_$TableModelImpl> {
  @override
  final int typeId = 10;

  @override
  _$TableModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$TableModelImpl(
      id: (fields[0] as num?)?.toInt(),
      noMeja: fields[1] as String?,
      qrId: fields[2] as String?,
      qrLink: fields[3] as String?,
      availability: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, _$TableModelImpl obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.noMeja)
      ..writeByte(2)
      ..write(obj.qrId)
      ..writeByte(3)
      ..write(obj.qrLink)
      ..writeByte(4)
      ..write(obj.availability);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TableModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TableModelImpl _$$TableModelImplFromJson(Map<String, dynamic> json) =>
    _$TableModelImpl(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      noMeja: json['no_meja'] as String?,
      qrId: json['qr_id'] as String?,
      qrLink: json['qr_link'] as String?,
      availability: json['availability'] as String?,
      branchId: (json['branch_id'] as num?)?.toInt(),
      branchName: json['branch_name'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$TableModelImplToJson(_$TableModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'no_meja': instance.noMeja,
      'qr_id': instance.qrId,
      'qr_link': instance.qrLink,
      'availability': instance.availability,
      'branch_id': instance.branchId,
      'branch_name': instance.branchName,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
