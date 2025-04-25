import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../../core/const/constant.dart';
import '../../main/cart/cart_provider.dart';
import '../../main/user_data/user_data_provider.dart';
import '../router/go_router_provider.dart';
import 'dio_provider.dart';

class DioService {
  static Dio getDio(DioRef ref) {
    final dio = Dio(
      BaseOptions(
        baseUrl: endpointApi,
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json'
        },
      ),
    )
      ..transformer = BackgroundTransformer()
      ..options.validateStatus = (int? status) => true;

    if (kDebugMode) {
      final logger = PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 180,
      );
      dio.interceptors.add(logger);
    }
    dio.interceptors.add(_HandleBearerAuthRequest());
    dio.interceptors.add(UnauthenticatedInterceptor(ref));
    return dio;
  }
}

class _HandleBearerAuthRequest extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final box = Hive.box<String>('token');
    if (box.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer ${box.get('token')}';
      return handler.next(options);
    }

    return handler.next(options);
  }
}

class UnauthenticatedInterceptor extends InterceptorsWrapper {
  final DioRef ref;

  UnauthenticatedInterceptor(this.ref);

  @override
  void onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) {
    if (response.statusCode == 401) {
      // Handle the logout using ref
      _handleLogout();
    }
    handler.next(response); // Pass
  }

  void _handleLogout() {
    ref.read(userDataProvider.notifier).logout().then((value) {
      if (kDebugMode) {
        print('successfully logout');
      }
      ref.read(routerProvider).goNamed('login');
      ref.invalidate(userDataProvider);
      ref.invalidate(cartProvider);
    });
  }
}
