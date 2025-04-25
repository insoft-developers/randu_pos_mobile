// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoryModelAdapter extends TypeAdapter<_$CategoryModelImpl> {
  @override
  final int typeId = 5;

  @override
  _$CategoryModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$CategoryModelImpl(
      id: (fields[0] as num).toInt(),
      code: fields[1] as String?,
      name: fields[2] as String?,
      userId: (fields[3] as num).toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, _$CategoryModelImpl obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.code)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.userId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryModelImpl _$$CategoryModelImplFromJson(Map<String, dynamic> json) =>
    _$CategoryModelImpl(
      id: (json['id'] as num).toInt(),
      code: json['code'] as String?,
      name: json['name'] as String?,
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
      userId: (json['user_id'] as num).toInt(),
      image: json['image'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$CategoryModelImplToJson(_$CategoryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'created': instance.created?.toIso8601String(),
      'user_id': instance.userId,
      'image': instance.image,
      'description': instance.description,
    };
