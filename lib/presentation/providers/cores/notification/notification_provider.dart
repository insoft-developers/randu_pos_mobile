import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'notification_service.dart';

part 'notification_provider.g.dart';

@riverpod
NotificationService notificationService(NotificationServiceRef ref) {
  return NotificationService();
}
