// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_customer_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetCustomerRequestModelImpl _$$GetCustomerRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$GetCustomerRequestModelImpl(
      search: json['search'] as String?,
      page: (json['page'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$GetCustomerRequestModelImplToJson(
        _$GetCustomerRequestModelImpl instance) =>
    <String, dynamic>{
      'search': instance.search,
      'page': instance.page,
      'limit': instance.limit,
    };
