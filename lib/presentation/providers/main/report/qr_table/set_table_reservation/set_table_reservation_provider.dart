import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../domain/entities/general_response.dart';
import '../../../../../../domain/entities/result.dart';
import '../../../../../../domain/usecases/report/qr_table/set_table_reservation/set_table_reservation_params.dart';
import '../../../../../../domain/usecases/report/qr_table/set_table_reservation/set_table_reservation_uc.dart';
import '../../../../usecases/report/qr_table/set_table_reservation/set_table_reservation_uc_provider.dart';

part 'set_table_reservation_provider.g.dart';

@riverpod
class SetTableReservation extends _$SetTableReservation {
  @override
  FutureOr<GeneralResponse?> build() {
    return null;
  }

  Future<void> setTableReservation(SetTableReservationParams params) async {
    state = const AsyncLoading();
    SetTableReservationUc setTableReservationUc =
        ref.read(setTableReservationUcProvider);
    final result = await setTableReservationUc(params);
    switch (result) {
      case Success():
        state = AsyncData(result.resultValue);
        break;
      case Failed(message: String message):
        state = AsyncError(message, StackTrace.current);
        break;
    }
  }

  Future<void> setTableReservedWithoutChangeState(
      SetTableReservationParams params) async {
    // state = const AsyncLoading();
    SetTableReservationUc setTableReservationUc =
        ref.read(setTableReservationUcProvider);
    final result = await setTableReservationUc(params);
    switch (result) {
      case Success():
        // state = AsyncData(result.resultValue);
        break;
      case Failed(message: String message):
        state = AsyncError(message, StackTrace.current);
        break;
    }
  }
}
