import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../domain/entities/attendance/attendance_model.dart';
import '../../../../../domain/entities/general_request_model.dart';
import '../../../../../domain/entities/result.dart';
import '../../../../../core/utils/date_utils.dart';
import '../../../usecases/attendance/get_data_attendance/get_data_attendance_uc_provider.dart';

part 'get_data_attendance_provider.g.dart';

@riverpod
class GetDataAttendance extends _$GetDataAttendance {
  @override
  FutureOr<List<AttendanceModel>> build() async {
    return [];
  }

  Future<void> getData() async {
    print('get data attendance');
    state = const AsyncLoading();
    final getDataUC = ref.watch(getDataAttendanceUCProvider);
    final request =
        GeneralRequestModel(date: formatDateTimeAsString(DateTime.now()));
    final result = await getDataUC(request);
    switch (result) {
      case Success(value: List<AttendanceModel> attendances):
        state = AsyncData(attendances);
        break;
      case Failed(message: String message):
        state = AsyncError(message, StackTrace.current);
    }
  }
}
