import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../domain/usecases/report/qr_table/set_table_reservation/set_table_reservation_uc.dart';
import '../../../../repositories/report_repository/report_repository.dart';

part 'set_table_reservation_uc_provider.g.dart';

@riverpod
SetTableReservationUc setTableReservationUc(SetTableReservationUcRef ref) {
  return SetTableReservationUc(reportRepository: ref.watch(iReportRepositoryProvider));
}