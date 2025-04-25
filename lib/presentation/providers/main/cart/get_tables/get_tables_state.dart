part of 'get_tables_provider.dart';

@freezed
class GetTableState with _$GetTableState {
  @override
  const GetTableState._();

  const factory GetTableState({
    List<TableModel>? tables,
    TableModel? chosenTable,
    @Default(SaleTypeEnum.dineIn) SaleTypeEnum saleType,
  }) = _GetTableState;
}
