part of 'login_uc.dart';

class LoginParams {
  final String email;
  final String password;
  final String? tokenFcm;
  final String? versionApp;
  final String device;

  LoginParams(
      {required this.email,
      required this.password,
      this.tokenFcm,
      this.versionApp,
      required this.device});
}
