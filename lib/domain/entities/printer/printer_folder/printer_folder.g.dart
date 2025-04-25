// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'printer_folder.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PrinterFolderAdapter extends TypeAdapter<_$PrinterFolderImpl> {
  @override
  final int typeId = 18;

  @override
  _$PrinterFolderImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$PrinterFolderImpl(
      id: fields[0] as String,
      name: fields[1] as String,
      printer: (fields[2] as List).cast<PrinterModel>(),
      typeString: fields[3] as String,
      isReceipt: fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, _$PrinterFolderImpl obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.printer)
      ..writeByte(3)
      ..write(obj.typeString)
      ..writeByte(4)
      ..write(obj.isReceipt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PrinterFolderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PrinterFolderImpl _$$PrinterFolderImplFromJson(Map<String, dynamic> json) =>
    _$PrinterFolderImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      printer: (json['printer'] as List<dynamic>)
          .map((e) => PrinterModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      typeString: json['typeString'] as String,
      isReceipt: json['isReceipt'] as bool,
    );

Map<String, dynamic> _$$PrinterFolderImplToJson(_$PrinterFolderImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'printer': instance.printer,
      'typeString': instance.typeString,
      'isReceipt': instance.isReceipt,
    };
