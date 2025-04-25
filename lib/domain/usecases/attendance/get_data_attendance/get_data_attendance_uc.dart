import '../../../../data/repositories/i_attendance_repository.dart';
import '../../../entities/attendance/attendance_model.dart';
import '../../../entities/general_request_model.dart';
import '../../../entities/result.dart';
import '../../usecase.dart';

class GetDataAttendanceUC
    implements UseCase<Result<List<AttendanceModel>>, GeneralRequestModel> {
  final IAttendanceRepository attendanceRepository;

  GetDataAttendanceUC({required this.attendanceRepository});
  @override
  Future<Result<List<AttendanceModel>>> call(GeneralRequestModel param) async {
    return attendanceRepository.attendanceList(param);
  }
}
