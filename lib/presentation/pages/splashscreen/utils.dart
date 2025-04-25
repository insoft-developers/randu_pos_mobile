import 'package:flutter/foundation.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

import '../../../domain/entities/user_model.dart';

Future<String> getRoute() async {
  final user = Hive.box<UserModel>('userBox');
  if (user.isNotEmpty) {
    if (kDebugMode) {
      print('redirect to dashboard');
    }
    final isLocked = Hive.box<bool>('is_locked');
    print(isLocked.get('is_locked'));
    if (isLocked.isNotEmpty && isLocked.get('is_locked') == true) {
      return '/pin';
    }

    return '/dashboard';
  }
  return '/login';
}
