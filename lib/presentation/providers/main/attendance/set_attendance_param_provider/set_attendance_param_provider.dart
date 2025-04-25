import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core/enum/response_state.dart';
import '../../../cores/camera/image_picker_provider.dart';

part 'attendance_param_state.dart';
part 'set_attendance_param_provider.freezed.dart';
part 'set_attendance_param_provider.g.dart';

@riverpod
class SetAttendanceParam extends _$SetAttendanceParam {
  @override
  AttendanceParamState build() {
    return const AttendanceParamState();
  }

  Future<void> pickImage(String type) async {
    state = state.copyWith(statePhoto: ResponseState.loading, type: type);
    final result =
        await ref.read(imagePickerServiceProvider).pickImageFromCamera();
    if (result != null) {
      state = state.copyWith(statePhoto: ResponseState.ok, attachment: result);
    }
  }

  void setLocation(String location) {
    state = state.copyWith(location: location);
  }
}
