import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/const/colors.dart';

class NotificationService {
  late Map<String, dynamic> notificationPayload;

  void onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) async {
    // display a dialog with the notification details, tap ok to go to another page
    ///TODO DO SOMETHING ON CLICK
  }

  void onDidReceiveNotificationResponse(
      NotificationResponse notificationResponse) async {
    ///CLICK LOCAL NOTIFICATION ON FOREGROUND (APP IS IN OPEN)
    handleNotificationTap(notificationResponse.payload);
    // navigateOnNotificationClick(notificationPayload['slug'],
    //     url: notificationPayload['url'],
    //     id: int.parse(notificationPayload['id']));
  }

  void handleNotificationTap(String? payload) async {
    if (payload != null && payload.isNotEmpty) {
      final Uri url = Uri.parse(payload);
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        print('Could not launch $url');
      }
    }
  }

  Future<PermissionStatus> checkNotificationPermission() async {
    PermissionStatus notificationPermission =
        await Permission.notification.status;
    if (notificationPermission == PermissionStatus.denied) {
      PermissionStatus notificationPermissionStatus =
          await Permission.notification.request();

      return notificationPermissionStatus;
    } else {
      return notificationPermission;
    }
  }

  Future<void> initialize() async {
    try {
      if (await checkNotificationPermission() == PermissionStatus.granted) {
        final String? token = await FirebaseMessaging.instance.getToken();
        print('token fcm $token');

        const AndroidNotificationChannel channel = AndroidNotificationChannel(
            'high_importance_channel', // id
            'High Importance Notifications', // title// description
            importance: Importance.high,
            playSound: true);

        final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
            FlutterLocalNotificationsPlugin();

        await flutterLocalNotificationsPlugin
            .resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin>()
            ?.createNotificationChannel(channel);

        const AndroidInitializationSettings initializationSettingsAndroid =
            AndroidInitializationSettings('@drawable/launcher_icon_no_bg');
        final DarwinInitializationSettings initializationSettingsDarwin =
            DarwinInitializationSettings(
                onDidReceiveLocalNotification: onDidReceiveLocalNotification);
        const DarwinNotificationDetails iOSPlatformChannelSpecifics =
            DarwinNotificationDetails();

        const LinuxInitializationSettings initializationSettingsLinux =
            LinuxInitializationSettings(defaultActionName: 'Open notification');

        final InitializationSettings initializationSettings =
            InitializationSettings(
                android: initializationSettingsAndroid,
                iOS: initializationSettingsDarwin,
                macOS: initializationSettingsDarwin,
                linux: initializationSettingsLinux);
        flutterLocalNotificationsPlugin.initialize(initializationSettings,
            onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);

        FirebaseMessaging.onBackgroundMessage(
            _firebaseMessagingBackgroundHandler);
        subscribeToTopic('all');
        FirebaseMessaging.onMessage.listen((message) async {
          try {
            notificationPayload = message.data;
            String link = notificationPayload['link'];
            RemoteNotification? notification = message.notification;
            AndroidNotification? android = message.notification?.android;
            if (notification != null && android != null) {
              print('link $link');
              String? imageUrl = android.imageUrl;
              print('Received image URL: $imageUrl');
              BigPictureStyleInformation? bigPictureStyleInformation;
              try {
                final response = await Dio().get(
                  imageUrl!,
                  options: Options(responseType: ResponseType.bytes),
                );
                if (response.statusCode == 200) {
                  final bytes = response.data as List<int>;
                  final base64Image = base64Encode(bytes);
                  bigPictureStyleInformation = BigPictureStyleInformation(
                    ByteArrayAndroidBitmap.fromBase64String(base64Image),
                    largeIcon:
                        ByteArrayAndroidBitmap.fromBase64String(base64Image),
                  );
                }
              } catch (e) {
                print('Error downloading image: $e');
              }
              flutterLocalNotificationsPlugin.show(
                  notification.hashCode,
                  notification.title,
                  notification.body,
                  NotificationDetails(
                      android: AndroidNotificationDetails(
                        priority: Priority.defaultPriority,
                        channel.id,
                        channel.name,
                        color: CustomColors.primaryColor,
                        playSound: true,
                        icon: '@drawable/launcher_icon_no_bg',
                        styleInformation: bigPictureStyleInformation,
                      ),
                      iOS: iOSPlatformChannelSpecifics),
                  payload: link);
            }
          } catch (e) {
            if (kDebugMode) {
              print('error notif $e');
            }
          }
        });
        FirebaseMessaging.onMessageOpenedApp
            .listen((RemoteMessage message) async {
          /// OPEN APP FROM BACKGROUND STATE WHEN CLICK ON NOTIFICATION
          if (message.data['link'] != null) {
            handleNotificationTap(message.data['link']);
          }
        });
      }
    } catch (e) {
      if (kDebugMode) {
        print('error initialize notification service $e');
      }
    }
  }

  void subscribeToTopic(String topic) async {
    await FirebaseMessaging.instance.subscribeToTopic(topic);
    print('Subscribed to $topic');
  }

  void unsubscribeFromTopic(String topic) async {
    await FirebaseMessaging.instance.unsubscribeFromTopic(topic);
    print('Unsubscribed from $topic');
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  if (kDebugMode) {
    print('Handling a background message: ${message.data}');
  }
  // if ( message.data['link'] != null) {
  //   String payload = message.data['link'];
  //   final Uri url = Uri.parse(payload);
  //   if (await canLaunchUrl(url)) {
  //     print('launch url $url');
  //     await launchUrl(url, mode: LaunchMode.externalApplication);
  //   } else {
  //     print('Could not launch $url');
  //   }
  // }
}
