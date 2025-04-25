import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../domain/entities/general_response.dart';
import '../../../../../domain/entities/result.dart';
import '../../../usecases/attendance/attendance_in/attendance_in_uc_provider.dart';
import '../get_data_attendance_provider/get_data_attendance_provider.dart';

part 'attendance_provider.g.dart';

@riverpod
class Attendance extends _$Attendance {
  @override
  FutureOr<GeneralResponse?> build() async {
    return null;
  }

  Future<void> attendanceIn(XFile image) async {
    state = const AsyncLoading();
    final attendanceInUC = ref.watch(attendanceInUCProvider);
    final result = await attendanceInUC(image);
    // final result = Result.success(
    //     GeneralResponse(status: true, message: 'success attendance'));
    switch (result) {
      case Success(value: GeneralResponse response):
        ref.read(getDataAttendanceProvider.notifier).getData();
        state = AsyncData(response);
        break;
      case Failed(message: String message):
        state = AsyncError(message, StackTrace.current);
    }
  }
}
