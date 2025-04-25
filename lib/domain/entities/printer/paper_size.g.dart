// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paper_size.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PaperSizeModelAdapter extends TypeAdapter<_$PaperSizeModelImpl> {
  @override
  final int typeId = 16;

  @override
  _$PaperSizeModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$PaperSizeModelImpl(
      id: fields[0] as String,
      name: fields[1] as String,
      width: (fields[2] as num).toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, _$PaperSizeModelImpl obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.width);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PaperSizeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaperSizeModelImpl _$$PaperSizeModelImplFromJson(Map<String, dynamic> json) =>
    _$PaperSizeModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      width: (json['width'] as num).toInt(),
    );

Map<String, dynamic> _$$PaperSizeModelImplToJson(
        _$PaperSizeModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'width': instance.width,
    };
