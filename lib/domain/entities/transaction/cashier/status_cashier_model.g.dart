// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_cashier_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StatusCashierModelImpl _$$StatusCashierModelImplFromJson(
        Map<String, dynamic> json) =>
    _$StatusCashierModelImpl(
      statusCashier: json['status_cashier'] as String?,
      openCashierAt: json['open_cashier_at'] == null
          ? null
          : DateTime.parse(json['open_cashier_at'] as String),
    );

Map<String, dynamic> _$$StatusCashierModelImplToJson(
        _$StatusCashierModelImpl instance) =>
    <String, dynamic>{
      'status_cashier': instance.statusCashier,
      'open_cashier_at': instance.openCashierAt?.toIso8601String(),
    };
