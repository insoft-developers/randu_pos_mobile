// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_table_reservation_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SetTableReservationParamsImpl _$$SetTableReservationParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$SetTableReservationParamsImpl(
      tableIds: (json['tableIds'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      status: $enumDecode(_$TableStatusEnumEnumMap, json['status']),
    );

Map<String, dynamic> _$$SetTableReservationParamsImplToJson(
        _$SetTableReservationParamsImpl instance) =>
    <String, dynamic>{
      'tableIds': instance.tableIds,
      'status': _$TableStatusEnumEnumMap[instance.status]!,
    };

const _$TableStatusEnumEnumMap = {
  TableStatusEnum.available: 'available',
  TableStatusEnum.reserved: 'reserved',
};
