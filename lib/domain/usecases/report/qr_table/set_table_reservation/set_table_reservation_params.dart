import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../entities/report/qr_table/table_status_enum.dart';

part 'set_table_reservation_params.freezed.dart';
part 'set_table_reservation_params.g.dart';

@freezed
class SetTableReservationParams with _$SetTableReservationParams {
  const factory SetTableReservationParams({
    required List<int> tableIds,
    required TableStatusEnum status,
}) = _SetTableReservationParams;

  factory SetTableReservationParams.fromJson(Map<String, dynamic> json) =>
      _$SetTableReservationParamsFromJson(json);
}
