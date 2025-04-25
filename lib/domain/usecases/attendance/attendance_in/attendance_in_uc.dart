import 'package:image_picker/image_picker.dart';

import '../../../../data/repositories/i_attendance_repository.dart';
import '../../../../presentation/providers/cores/camera/image_picker_service.dart';
import '../../../../presentation/providers/cores/location/location_service.dart';
import '../../../entities/general_response.dart';
import '../../../entities/result.dart';
import '../../usecase.dart';
import '../attendance_param.dart';

class AttendanceInUC implements UseCase<Result<GeneralResponse>, XFile> {
  final IAttendanceRepository attendanceRepository;
  final ImagePickerService imagePickerService;
  final LocationService locationService;

  AttendanceInUC({
    required this.attendanceRepository,
    required this.imagePickerService,
    required this.locationService,
  });

  @override
  Future<Result<GeneralResponse>> call(XFile image) async {
    AttendanceParam params =
        AttendanceParam(type: '', location: '', attachment: image);
    final locationData = await locationService.getCurrentLocation();
    if (locationData == null) {
      return const Result.failed('Location data is null');
    }
    params = params.copyWith(
        location: locationService.convertLocationToString(locationData));
    final response = await attendanceRepository.attendanceIn(params);
    return response;
  }
}
