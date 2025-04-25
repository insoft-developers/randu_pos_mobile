import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../core/const/constant.dart';
import '../../domain/entities/general_response.dart';
import '../../domain/entities/result.dart';
import '../repositories/i_settings_repository.dart';

class ApiSettingsRepository implements ISettingsRepository {
  final Dio _dio;

  ApiSettingsRepository({required Dio dio}) : _dio = dio;

  @override
  Future<Result<GeneralResponse>> checkVersionApp() async {
    try {
      final response =
          await _dio.get('/check-version-mobile', queryParameters: {
        'version': versionCode,
      });
      if (response.statusCode == 200) {
        print('check version app success');
        print(response.data);
        return Result.success(GeneralResponse.fromJson(response.data));
      } else {
        return Result.failed(response.data['message']);
      }
    } catch (e) {
      if (kDebugMode) {
        print('error check version app $e');
      }
      return Result.failed(e.toString());
    }
  }
}
