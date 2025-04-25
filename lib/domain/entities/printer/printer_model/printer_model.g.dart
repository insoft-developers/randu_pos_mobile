// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'printer_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PrinterModelAdapter extends TypeAdapter<_$PrinterModelImpl> {
  @override
  final int typeId = 17;

  @override
  _$PrinterModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$PrinterModelImpl(
      id: fields[0] as String?,
      name: fields[1] as String,
      macAddress: fields[2] as String,
      type: fields[3] == null ? 0 : (fields[3] as num).toInt(),
      paperSize: fields[4] as PaperSizeModel?,
      isSelected: fields[5] == null ? false : fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, _$PrinterModelImpl obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.macAddress)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.paperSize)
      ..writeByte(5)
      ..write(obj.isSelected);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PrinterModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PrinterModelImpl _$$PrinterModelImplFromJson(Map<String, dynamic> json) =>
    _$PrinterModelImpl(
      id: json['id'] as String?,
      name: json['name'] as String,
      macAddress: json['macAddress'] as String,
      deviceId: (json['deviceId'] as num?)?.toInt(),
      vendorId: (json['vendorId'] as num?)?.toInt(),
      productId: (json['productId'] as num?)?.toInt(),
      type: (json['type'] as num?)?.toInt() ?? 0,
      paperSize: json['paperSize'] == null
          ? null
          : PaperSizeModel.fromJson(json['paperSize'] as Map<String, dynamic>),
      isSelected: json['isSelected'] as bool? ?? false,
    );

Map<String, dynamic> _$$PrinterModelImplToJson(_$PrinterModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'macAddress': instance.macAddress,
      'deviceId': instance.deviceId,
      'vendorId': instance.vendorId,
      'productId': instance.productId,
      'type': instance.type,
      'paperSize': instance.paperSize,
      'isSelected': instance.isSelected,
    };
