import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../domain/entities/general_response.dart';
import '../../domain/entities/result.dart';
import '../../domain/entities/user_model.dart';
import '../repositories/i_user_repository.dart';

class ApiUserRepository implements IUserRepository {
  final Dio _dio;

  ApiUserRepository({required Dio dio}) : _dio = dio;

  @override
  Future<Result<UserModel>> getUser() async {
    try {
      var response = await _dio.get('/user');
      if (response.statusCode == 200) {
        GeneralResponse<UserModel> responseModel =
            GeneralResponse<UserModel>.fromJsonWithData(response.data,
                (model) => UserModel.fromJson(response.data['data']));
        return Result.success(responseModel.data!);
      } else {
        return Result.failed(response.data['message']);
      }
      // await Future.delayed(const Duration(seconds: 1));
      // return const Result.success(
      //     UserModel(username: 'Dummy', email: 'dummy@dummy.com'));
    } catch (e) {
      if (kDebugMode) {
        print('error get user ${e.toString()}');
      }
      return Result.failed(e.toString());
    }
  }

  @override
  Future<Result<UserModel>> updateUser({required UserModel user}) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }

  @override
  Future<Result<UserModel>> uploadPhotoProfile(
      {required UserModel user, required File file}) {
    // TODO: implement uploadPhotoProfile
    throw UnimplementedError();
  }
}
