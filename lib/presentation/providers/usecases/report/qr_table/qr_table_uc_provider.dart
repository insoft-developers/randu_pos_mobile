import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../domain/usecases/report/qr_table/qr_table_uc.dart';
import '../../../repositories/report_repository/report_repository.dart';

part 'qr_table_uc_provider.g.dart';

@riverpod
QrTableUC qrTableUC(QrTableUCRef ref) {
  return QrTableUC(reportRepository: ref.watch(iReportRepositoryProvider));
}
