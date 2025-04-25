import 'package:dio/dio.dart';

import '../../domain/entities/general_response.dart';
import '../../domain/entities/result.dart';
import '../repositories/i_log_repository.dart';

class ApiLogRepository implements ILogRepository {
  final Dio _dio;

  ApiLogRepository({required Dio dio}) : _dio = dio;

  @override
  Future<Result<GeneralResponse>> logPageVisited(String page) async {
    try {
      final response = await _dio
          .post('/user-log-activity', data: {'page': page, 'app': 'pos'});
      return Result.success(GeneralResponse.fromJson(response.data));
      // return Result.success(GeneralResponse(status: true, message: 'success'));
    } catch (e) {
      return Result.failed('error : $e');
    }
  }
}
