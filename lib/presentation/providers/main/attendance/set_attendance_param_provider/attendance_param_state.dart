part of 'set_attendance_param_provider.dart';

@freezed
class AttendanceParamState with _$AttendanceParamState {
  const factory AttendanceParamState({
    String? type,
    ResponseState? statePhoto,
    XFile? attachment,
    ResponseState? stateLocation,
    String? location,
  }) = _AttendanceParamState;
}
