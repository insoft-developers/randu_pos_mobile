import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';

import '../../core/const/constant.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class MlSettingUserModel with _$MlSettingUserModel {
  const MlSettingUserModel._();

  @HiveType(typeId: 15, adapterName: 'MlSettingUserModelAdapter')
  const factory MlSettingUserModel({
    @HiveField(0) @JsonKey(name: 'id') int? id,
    @HiveField(1) @JsonKey(name: 'is_rounded') int? rounded,
  }) = _MlSettingUserModel;

  bool get isRounded => rounded == 1;

  factory MlSettingUserModel.fromJson(Map<String, dynamic> json) =>
      _$MlSettingUserModelFromJson(json);
}

@freezed
class UserModel with _$UserModel {
  const UserModel._();

  @HiveType(typeId: 1, adapterName: 'UserModelAdapter')
  const factory UserModel({
    @HiveField(0) @JsonKey(name: 'id') int? id,
    @HiveField(1) @JsonKey(name: 'uuid') String? uuid,
    @HiveField(2) @JsonKey(name: 'email') String? email,
    @HiveField(3) @JsonKey(name: 'username') String? username,
    @HiveField(4) @JsonKey(name: 'fullname') String? fullname,
    @HiveField(5) @JsonKey(name: 'phone') String? phone,
    @JsonKey(name: 'roles') int? roles,
    @JsonKey(name: 'role_code') String? roleCode,
    @JsonKey(name: 'status') int? status,
    @JsonKey(name: 'is_upgraded') int? isUpgraded,
    @JsonKey(name: 'upgrade_expiry') dynamic upgradeExpiry,
    @JsonKey(name: 'is_soft_delete') int? isSoftDelete,
    @JsonKey(name: 'recovery_code') String? recoveryCode,
    @JsonKey(name: 'recovery_code_duration') dynamic recoveryCodeDuration,
    @HiveField(6) @JsonKey(name: 'token') String? token,
    @JsonKey(name: 'created') int? created,
    @JsonKey(name: 'referal_source') String? referalSource,
    @JsonKey(name: 'referal_code') String? referalCode,
    @HiveField(7) @JsonKey(name: 'is_active') int? isActive,
    @JsonKey(name: 'start_date') dynamic startDate,
    @HiveField(8) @JsonKey(name: 'pin') String? pin,
    @HiveField(11) @JsonKey(name: 'branch_id') int? branchId,
    @JsonKey(name: 'position_id') dynamic positionId,
    @HiveField(9) @JsonKey(name: 'petty_cash') int? pettyCash,
    @HiveField(10) @JsonKey(name: 'status_cashier') int? statusCashier,
    @JsonKey(name: 'tax') double? tax,
    @JsonKey(name: 'bussines_name') String? bussinessName,
    @JsonKey(name: 'business_address') String? bussinessAddress,
    @JsonKey(name: 'branch_name') String? branchName,
    @JsonKey(name: 'printer_connection') String? printerConnection,
    // @JsonKey(name: 'printer_paper_size') String? printerPaperSize,
    @JsonKey(name: 'printer_custom_footer') String? printerCustomFooter,
    // @JsonKey(name: 'is_rounded') int? rounded,
    @HiveField(12)
    @JsonKey(name: 'ml_setting_user')
    MlSettingUserModel? mlSettingUser,
    @HiveField(13) String? logo,
    @HiveField(14) @JsonKey(name: 'profile_picture') String? profilePicture,
  }) = _UserModel;

  bool get isPettyCashEnabled => pettyCash == 1;

  bool get isCashierOpen => statusCashier == 1;

  bool get isUser => roleCode == 'general_member';

  // PaperSize get paperSize {
  //   return printerPaperSize == null
  //       ? PaperSize.mm80
  //       : printerPaperSize == '5.8'
  //           ? PaperSize.mm58
  //           : PaperSize.mm80;
  // }

  String get footerReceipt {
    return printerCustomFooter == null
        ? ''
        : printerCustomFooter!.replaceAll('<p>', '').replaceAll('</p>', '');
  }

  bool get isRounded => mlSettingUser?.isRounded ?? false;

  bool get isPremium => isUpgraded == 1;

  String get photoLogo {
    if (logo == null) return '';
    return '$endpointStorage$logo';
  }

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
