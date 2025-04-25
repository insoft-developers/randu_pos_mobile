// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_category_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EditCategoryParamsImpl _$$EditCategoryParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$EditCategoryParamsImpl(
      id: (json['id'] as num).toInt(),
      request: CreateCategoryProductRequestModel.fromJson(
          json['request'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$EditCategoryParamsImplToJson(
        _$EditCategoryParamsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'request': instance.request,
    };
