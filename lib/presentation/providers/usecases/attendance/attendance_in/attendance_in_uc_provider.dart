import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../domain/usecases/attendance/attendance_in/attendance_in_uc.dart';
import '../../../cores/camera/image_picker_provider.dart';
import '../../../cores/location/location_provider.dart';
import '../../../repositories/attendance/attendance_repository_provider.dart';

part 'attendance_in_uc_provider.g.dart';

@riverpod
AttendanceInUC attendanceInUC(AttendanceInUCRef ref) {
  return AttendanceInUC(
      attendanceRepository: ref.watch(iAttendanceRepositoryProvider),
      imagePickerService: ref.watch(imagePickerServiceProvider),
      locationService: ref.watch(locationServiceProvider));
}
