// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discounts_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DiscountsRequestModelImpl _$$DiscountsRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DiscountsRequestModelImpl(
      search: json['search'] as String?,
      perPage: (json['perPage'] as num?)?.toInt(),
      groupBy: json['groupBy'] as String?,
      all: json['all'] as bool?,
    );

Map<String, dynamic> _$$DiscountsRequestModelImplToJson(
        _$DiscountsRequestModelImpl instance) =>
    <String, dynamic>{
      'search': instance.search,
      'perPage': instance.perPage,
      'groupBy': instance.groupBy,
      'all': instance.all,
    };
