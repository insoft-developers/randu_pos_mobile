// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductsRequestModelImpl _$$ProductsRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductsRequestModelImpl(
      search: json['search'] as String?,
      perPage: (json['per_page'] as num?)?.toInt(),
      page: (json['page'] as num?)?.toInt(),
      groupBy: json['group_by'] as String?,
      all: json['all'] as bool?,
      categoryId: (json['category_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ProductsRequestModelImplToJson(
        _$ProductsRequestModelImpl instance) =>
    <String, dynamic>{
      'search': instance.search,
      'per_page': instance.perPage,
      'page': instance.page,
      'group_by': instance.groupBy,
      'all': instance.all,
      'category_id': instance.categoryId,
    };
