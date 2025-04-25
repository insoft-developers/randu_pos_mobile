import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../domain/entities/result.dart';
import '../../../../../domain/entities/transaction/cart/table_model.dart';
import '../../../../../domain/entities/transaction/sale_type/sale_type_enum.dart';
import '../../../../../domain/usecases/cart/get_tables/get_tables_param.dart';
import '../../../../../domain/usecases/cart/get_tables/get_tables_uc.dart';
import '../../../usecases/cart/get_tables/get_tables_uc_provider.dart';

part 'get_tables_provider.freezed.dart';
part 'get_tables_provider.g.dart';
part 'get_tables_state.dart';

@Riverpod(keepAlive: true)
class GetTables extends _$GetTables {
  @override
  FutureOr<GetTableState> build() =>
      const GetTableState(tables: [], chosenTable: null);

  Future<void> fetchTables({String? query, bool refresh = false}) async {
    state = const AsyncLoading();
    GetTablesUC getTablesUC = ref.read(getTablesUCProvider);
    GetTablesParams getTablesParams =
        GetTablesParams(query: query, refresh: refresh);
    var result = await getTablesUC(getTablesParams);
    switch (result) {
      case Success(value: final tables):
        state = AsyncData(state.value?.copyWith(tables: tables) ??
            GetTableState(tables: tables));
      case Failed(message: _):
        state = const AsyncData(GetTableState(tables: []));
    }
  }

  void setChosenTable(TableModel? table) {
    if (state.value == null) return;
    state = AsyncData(state.value!.copyWith(chosenTable: table));
  }

  void setSaleType(SaleTypeEnum? saleType) {
    if (state.value == null) return;
    state = AsyncData(
        state.value!.copyWith(saleType: saleType ?? SaleTypeEnum.dineIn));
  }

  void reset() {
    state = AsyncData(state.value!
        .copyWith(saleType: SaleTypeEnum.dineIn, chosenTable: null));
  }
}
