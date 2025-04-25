import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../domain/usecases/report/daily_recap/daily_recap_uc.dart';
import '../../../repositories/report_repository/report_repository.dart';

part 'daily_recap_uc_provider.g.dart';

@riverpod
DailyRecapUC dailyRecapUC(DailyRecapUCRef ref) {
  return DailyRecapUC(reportRepository: ref.watch(iReportRepositoryProvider));
}
