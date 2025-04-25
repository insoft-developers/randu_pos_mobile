import 'package:hive_ce_flutter/hive_flutter.dart';

import '../../../../core/const/constant.dart';
import '../../../../data/repositories/i_cart_repository.dart';
import '../../../entities/result.dart';
import '../../../entities/transaction/cart/table_model.dart';
import '../../../entities/user_model.dart';
import '../../usecase.dart';
import 'get_tables_param.dart';

class GetTablesUC
    implements UseCase<Result<List<TableModel>>, GetTablesParams> {
  final ICartRepository _cartRepository;

  GetTablesUC({required ICartRepository cartRepository})
      : _cartRepository = cartRepository;

  @override
  Future<Result<List<TableModel>>> call(GetTablesParams params) async {
    final tableBox = Hive.box<TableModel>(tableData);

    if (tableBox.isNotEmpty && !params.refresh) {
      if (params.query != null) {
        return Success(tableBox.values
            .where((element) => element.noMeja!.contains(params.query!))
            .toList());
      } else {
        return Success(tableBox.values.toList());
      }
    } else {
      tableBox.clear();
      var tableResponse = await _cartRepository.getTables(params.query);
      switch (tableResponse) {
        case Success(value: final tables):
          final user = Hive.box<UserModel>('userBox').get('userBox');
          final branchId = user?.branchId;

          List<TableModel> tablesFiltered = tables
              .where((element) {
                return element.branchId != null &&
                        element.branchId == branchId ||
                    branchId == null;
              })
              .toList()
              .reversed
              .toList();
          Map<String, TableModel> tableMap = {
            for (var table in tablesFiltered) table.id.toString(): table,
          };
          await tableBox.clear();
          await tableBox.putAll(tableMap);
          return Success(tablesFiltered);
        case Failed(message: _):
          return tableResponse;
      }
    }
  }
}
