import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../domain/usecases/cart/get_tables/get_tables_uc.dart';
import '../../../repositories/cart_repository/cart_repository.dart';

part 'get_tables_uc_provider.g.dart';

@riverpod
GetTablesUC getTablesUC(GetTablesUCRef ref) {
  return GetTablesUC(cartRepository: ref.watch(iCartRepositoryProvider));
}
