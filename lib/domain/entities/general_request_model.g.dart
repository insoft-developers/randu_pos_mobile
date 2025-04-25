// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GeneralRequestModelImpl _$$GeneralRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$GeneralRequestModelImpl(
      search: json['search'] as String?,
      perPage: (json['per_page'] as num?)?.toInt(),
      groupBy: json['group_by'] as String?,
      all: json['all'] as bool?,
      page: (json['page'] as num?)?.toInt(),
      date: json['date'] as String?,
      bulan: json['bulan'] as String?,
      tahun: json['tahun'] as String?,
      selectedRange: json['selected_range'] as String?,
      endDate: json['endDate'] as String?,
      startDate: json['startDate'] as String?,
      transactionStatus: (json['transaction_status'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$GeneralRequestModelImplToJson(
        _$GeneralRequestModelImpl instance) =>
    <String, dynamic>{
      if (instance.search case final value?) 'search': value,
      if (instance.perPage case final value?) 'per_page': value,
      if (instance.groupBy case final value?) 'group_by': value,
      if (instance.all case final value?) 'all': value,
      if (instance.page case final value?) 'page': value,
      if (instance.date case final value?) 'date': value,
      if (instance.bulan case final value?) 'bulan': value,
      if (instance.tahun case final value?) 'tahun': value,
      if (instance.selectedRange case final value?) 'selected_range': value,
      if (instance.endDate case final value?) 'endDate': value,
      if (instance.startDate case final value?) 'startDate': value,
      if (instance.transactionStatus case final value?)
        'transaction_status': value,
    };
