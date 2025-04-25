import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../domain/entities/attendance/attendance_model.dart';
import '../../domain/entities/general_request_model.dart';
import '../../domain/entities/general_response.dart';
import '../../domain/entities/result.dart';
import '../../domain/usecases/attendance/attendance_param.dart';
import '../repositories/i_attendance_repository.dart';

class ApiAttendanceRepository implements IAttendanceRepository {
  final Dio _dio;
  ApiAttendanceRepository({required Dio dio}) : _dio = dio;
  @override
  Future<Result<GeneralResponse>> attendanceIn(AttendanceParam param) async {
    try {
      final formData = await param.toFormData();
      final response = await _dio.post('/attendance', data: formData);
      if (response.statusCode == 200) {
        return Result.success(GeneralResponse.fromJson(response.data));
      } else {
        return Result.failed(response.data['message']);
      }
    } catch (e) {
      return Result.failed(e.toString());
    }
  }

  @override
  Future<Result<GeneralResponse>> attendanceOut(AttendanceParam param) async {
    try {
      final formData = await param.toFormData();
      final response = await _dio.post('/attendance', data: formData);
      if (response.statusCode == 200) {
        return Result.success(GeneralResponse.fromJson(response.data));
      } else {
        return Result.failed(response.data['message']);
      }
    } catch (e) {
      return Result.failed(e.toString());
    }
  }

  @override
  Future<Result<List<AttendanceModel>>> attendanceList(
      GeneralRequestModel param) async {
    try {
      var response = await _dio.get(
        '/attendance',
        queryParameters: param.toJson(),
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> parsedJson =
            json.decode(json.encode(response.data));
        final List<dynamic> attendanceJsonList = parsedJson['data']['data'];
        final List<AttendanceModel> attendances = attendanceJsonList
            .map((json) =>
                AttendanceModel.fromJson(json as Map<String, dynamic>))
            .toList();

        return Result.success(attendances);
      } else {
        return Result.failed(response.data['message']);
      }
    } catch (e) {
      if (kDebugMode) {
        print('error get attendance list ${e.toString()}');
      }
      return Result.failed(e.toString());
    }
  }
}
