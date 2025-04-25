// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outlet_expense_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OutletExpenseModelImpl _$$OutletExpenseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OutletExpenseModelImpl(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      name: json['name'] as String?,
      amount: (json['amount'] as num?)?.toInt(),
      syncStatus: json['sync_status'],
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$OutletExpenseModelImplToJson(
        _$OutletExpenseModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'name': instance.name,
      'amount': instance.amount,
      'sync_status': instance.syncStatus,
      'created_at': instance.createdAt?.toIso8601String(),
    };
