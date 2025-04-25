part of 'qr_table_provider.dart';

@freezed
class QrTableState with _$QrTableState {
  const factory QrTableState({
    GeneralRequestModel? request,
    List<TableModel>? value,
  }) = _QrTableState;
}
