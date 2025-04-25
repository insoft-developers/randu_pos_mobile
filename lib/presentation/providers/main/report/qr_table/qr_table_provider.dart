import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../domain/entities/general_request_model.dart';
import '../../../../../domain/entities/result.dart';
import '../../../../../domain/entities/transaction/cart/table_model.dart';
import '../../../../../domain/usecases/report/qr_table/qr_table_uc.dart';
import '../../../usecases/report/qr_table/qr_table_uc_provider.dart';

part 'qr_table_provider.freezed.dart';
part 'qr_table_provider.g.dart';
part 'qr_table_state.dart';

@riverpod
class QrTable extends _$QrTable {
  @override
  FutureOr<QrTableState> build() => const QrTableState();

  Future<void> fetchTables(String? query) async {
    state = const AsyncLoading();
    QrTableUC qrTableUC = ref.read(qrTableUCProvider);
    final request = GeneralRequestModel(search: query, all: true);
    var result = await qrTableUC(request);
    switch (result) {
      case Success(value: final generalResponse):
        state = AsyncData(state.value!.copyWith(value: generalResponse));
      case Failed(message: _):
        state = const AsyncData(QrTableState());
    }
  }
}
