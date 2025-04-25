import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

import '../../domain/entities/auth/login_response_model.dart';
import '../../domain/entities/result.dart';
import '../../domain/entities/user_model.dart';
import '../repositories/i_auth_repository.dart';

class ApiAuthRepository implements IAuthRepository {
  final Dio _dio;

  ApiAuthRepository({required Dio dio}) : _dio = dio;

  @override
  Future<Result<LoginResponseModel>> login(
      {required String email,
      required String password,
      required String tokenFcm}) async {
    try {
      print('login api');
      var response = await _dio.post('/login',
          data: {'email': email, 'password': password, 'token_fcm': tokenFcm});
      print('login response $response');
      if (response.statusCode == 200) {
        print('login success');
        if (response.data['status'] == false) {
          return Result.failed(response.data['message']);
        }
        return Result.success(LoginResponseModel.fromJson(response.data));
      } else {
        print('login failed');
        return Result.failed(
            LoginResponseModel.fromJson(response.data).message ??
                'Error Login');
      }
    } catch (e) {
      if (kDebugMode) {
        print('login error $e');
      }
      return Result.failed(e.toString());
    }
  }

  // WE DONT NEED THIS NOW
  @override
  Future<Result<String>> register(
      {required String email, required String name, required String password}) {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> logout() async {
    try {
      // var response = await _dio.post(
      //     'auth/login',
      //     data: {'email': email, 'password': password});
      // if (response.statusCode == 200) {
      //   return Result.success(response.data['data']['user']['uid']);
      // } else {
      //   return Result.failed(response.data['message']);
      // }
      await Future.delayed(const Duration(seconds: 1));
      return const Result.success(null);
    } catch (e) {
      return Result.failed(e.toString());
    }
  }

  @override
  Future<Result<bool>> checkPin({required String pin}) async {
    try {
      final user = Hive.box<UserModel>('userBox').get('userBox');
      final pinBox = user?.pin;
      if (pinBox == null) {
        print('pinnya null');
        return const Result.success(true);
        // return const Result.failed('salah pin');
      } else {
        if (pinBox == pin) {
          print('pin match');
          return const Result.success(true);
        } else {
          print('pin not match');
          return const Result.failed('pin not match');
        }
      }
    } catch (e) {
      return Result.failed(e.toString());
    }
  }
}
