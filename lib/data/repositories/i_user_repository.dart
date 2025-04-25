import 'dart:io';

import '../../domain/entities/result.dart';
import '../../domain/entities/user_model.dart';

abstract interface class IUserRepository {
  // GET USER BY UID
  Future<Result<UserModel>> getUser();

  // UPDATE USER
  Future<Result<UserModel>> updateUser({required UserModel user});

  // UPLOAD PHOTO PROFILE
  Future<Result<UserModel>> uploadPhotoProfile(
      {required UserModel user, required File file});
}
