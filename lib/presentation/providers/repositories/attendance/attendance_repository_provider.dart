import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../data/remote/api_attendance_repository.dart';
import '../../../../data/repositories/i_attendance_repository.dart';
import '../../cores/http_client/dio_provider.dart';

part 'attendance_repository_provider.g.dart';

@riverpod
IAttendanceRepository iAttendanceRepository(IAttendanceRepositoryRef ref) =>
    ApiAttendanceRepository(dio: ref.watch(dioProvider));
