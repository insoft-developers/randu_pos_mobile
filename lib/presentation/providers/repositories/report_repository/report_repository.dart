import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../data/remote/api_report_repository.dart';
import '../../../../data/repositories/i_report_repository.dart';
import '../../cores/http_client/dio_provider.dart';

part 'report_repository.g.dart';

@riverpod
IReportRepository iReportRepository(IReportRepositoryRef ref) {
  return ApiReportRepository(dio: ref.watch(dioProvider));
}
