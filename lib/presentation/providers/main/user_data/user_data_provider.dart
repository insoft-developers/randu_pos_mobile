import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/scheduler.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/const/constant.dart';
import '../../../../domain/entities/result.dart';
import '../../../../domain/entities/user_model.dart';
import '../../../../domain/usecases/auth/check_pin/check_pin_uc.dart';
import '../../../../domain/usecases/auth/get_logged_in_user/get_logged_in_user_uc.dart';
import '../../../../domain/usecases/auth/login/login_uc.dart';
import '../../../../domain/usecases/auth/logout/logout_uc.dart';
import '../../cores/connectivity_service/check_connectivity_provider.dart';
import '../../cores/connectivity_service/connectivity_service.dart';
import '../../usecases/auth/check_pin/check_pin_uc_provider.dart';
import '../../usecases/auth/get_logged_in_user/get_logged_in_user_uc_provider.dart';
import '../../usecases/auth/login/login_uc_provider.dart';
import '../../usecases/auth/logout/logout_uc_provider.dart';
import '../cart/cart_provider.dart';
import '../cart/get_category_product/category_product_provider.dart';
import '../cart/get_products/get_products_provider.dart';
import '../dialog_petty_cach_provider.dart';

part 'user_data_provider.freezed.dart';
part 'user_data_provider.g.dart';
part 'user_data_state.dart';

@Riverpod(keepAlive: true)
class UserData extends _$UserData {
  @override
  FutureOr<UserDataState?> build() async {
    return null;
  }

  Future<void> login({required String email, required String password}) async {
    state = const AsyncLoading();
    print('login user data');
    LoginUC loginUser = ref.read(loginUCProvider);
    String? token = '';
    // if (Platform.isAndroid) {
    token = await FirebaseMessaging.instance.getToken();
    // } else {
    //   token = '';
    // }
    // final String?
    String device = Platform.isAndroid ? 'android' : 'ios';
    var result = await loginUser(LoginParams(
        email: email,
        password: password,
        device: device,
        tokenFcm: token,
        versionApp: versionApp));
    Hive.box<bool>(isOnlineData).put(isOnlineData, true);
    switch (result) {
      case Success(value: UserModel user):
        // checkStatusCashier();
        state = AsyncData(UserDataState(user: user));
      case Failed(message: String message):
        state = AsyncError(message, StackTrace.current);
        state = const AsyncData(null);
    }
  }

  Future<void> logout() async {
    print('logout');
    state = const AsyncLoading();
    LogoutUC logout = ref.read(logoutUCProvider);
    var result = await logout(null);
    if (result is Success) {
      ref.invalidate(cartProvider);
      ref.invalidate(categoryProductProvider);
      ref.invalidate(getProductsProvider);
      state = const AsyncData(null);
    } else {
      state = AsyncError(result.errorMessage!, StackTrace.current);
      state = AsyncData(state.valueOrNull);
    }
  }

  Future<void> checkPin({required String pin}) async {
    state = const AsyncLoading();
    CheckPinUC checkPinUC = ref.read(checkPinUCProvider);
    print('check pin');
    var result = await checkPinUC(pin);
    if (result is Success) {
      print('success');
      state = AsyncData(state.valueOrNull);
    } else {
      print('failed');
      state = AsyncError(result.errorMessage!, StackTrace.current);
    }
  }

  FutureOr<void> refreshUser() async {
    state = const AsyncLoading();
    GetLoggedInUserUC getLoggedInUserUC = ref.read(getLoggedInUserUCProvider);
    final userResult = await getLoggedInUserUC(null);
    final user = userResult.resultValue;
    final box = Hive.box<UserModel>('userBox');
    final isPettyCashEnabledBox = Hive.box<bool>(isPettyCashEnabledData);
    final isCashierOpenBox = Hive.box<bool>(isCashierOpenData);
    state = const AsyncData(null);
    if (user != null) {
      box.put('userBox', user);
      isPettyCashEnabledBox.put(
          isPettyCashEnabledData, user.isPettyCashEnabled);
      isCashierOpenBox.put(isCashierOpenData, user.isCashierOpen);
    }
    final newState = UserDataState(
        isCashierOpen: user?.isCashierOpen,
        user: user,
        isPettyCashEnabled: user?.isPettyCashEnabled);
    state = AsyncData(newState);
    return null;
  }

  Future<void> getUser() async {
    final box = Hive.box<UserModel>('userBox');
    state = const AsyncLoading();
    // if (box.isNotEmpty) {
    final checkConnection = ref.watch(connectionStatusProvider);
    late final Result<UserModel> getUser;
    if (checkConnection == ConnectivityStatus.online) {
      GetLoggedInUserUC getLoggedInUserUC = ref.read(getLoggedInUserUCProvider);
      getUser = await getLoggedInUserUC(null);
    } else {
      final userData = box.get('userBox');
      if (userData == null) {
        getUser = const Result.failed('User not found');
      } else {
        getUser = Result.success(userData);
      }
    }
    if (getUser.isSuccess) {
      box.clear();
      await Future.delayed(const Duration(milliseconds: 100));
      box.put('userBox', getUser.resultValue!);
      final isPettyCashEnabledBox = Hive.box<bool>(isPettyCashEnabledData);
      final isCashierOpenBox = Hive.box<bool>(isCashierOpenData);
      isPettyCashEnabledBox.put(
          isPettyCashEnabledData, getUser.resultValue!.isPettyCashEnabled);
      isCashierOpenBox.put(
          isCashierOpenData, getUser.resultValue!.isCashierOpen);
      final isPettyCashEnabled =
          getUser.resultValue?.isPettyCashEnabled ?? false;
      final isCashierOpen = getUser.resultValue?.isCashierOpen ?? false;

      // Use postFrameCallback to defer the modification
      SchedulerBinding.instance.addPostFrameCallback((_) {
        ref
            .read(dialogPettyCachProvider.notifier)
            .setDialogPettyCash(isPettyCashEnabled, !isCashierOpen);
        ref.read(cartProvider.notifier).setUser(getUser.resultValue!);
        ref.read(cartProvider.notifier).setTax(getUser.resultValue!.tax ?? 0);
      });

      final userDataState = UserDataState(
        user: getUser.resultValue,
        isCashierOpen: isCashierOpen,
        isPettyCashEnabled: isPettyCashEnabled,
      );
      state = AsyncData(userDataState);
    } else {
      state = AsyncError('Error', StackTrace.current);
    }
  }
}
