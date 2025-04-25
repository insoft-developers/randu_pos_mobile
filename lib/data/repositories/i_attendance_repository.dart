import '../../domain/entities/attendance/attendance_model.dart';
import '../../domain/entities/general_request_model.dart';
import '../../domain/entities/general_response.dart';
import '../../domain/entities/result.dart';
import '../../domain/usecases/attendance/attendance_param.dart';

abstract class IAttendanceRepository {
  Future<Result<GeneralResponse>> attendanceIn(AttendanceParam param);
  Future<Result<GeneralResponse>> attendanceOut(AttendanceParam param);
  Future<Result<List<AttendanceModel>>> attendanceList(
      GeneralRequestModel param);
}
