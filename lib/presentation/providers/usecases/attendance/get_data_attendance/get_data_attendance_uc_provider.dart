import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../domain/usecases/attendance/get_data_attendance/get_data_attendance_uc.dart';
import '../../../repositories/attendance/attendance_repository_provider.dart';

part 'get_data_attendance_uc_provider.g.dart';

@riverpod
GetDataAttendanceUC getDataAttendanceUC(GetDataAttendanceUCRef ref) {
  return GetDataAttendanceUC(
    attendanceRepository: ref.watch(iAttendanceRepositoryProvider),
  );
}
