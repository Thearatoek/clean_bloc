import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_clean_bloc_test/firebase_options.dart';

class FirebaseNotificationHandler {
// init awesome notification

  static Future<void> init() async {
    await AwesomeNotifications().initialize(
      // set the icon to null if you want to use the default app icon

      null,
      [
        NotificationChannel(
          channelGroupKey: 'basic_channel_group',
          channelKey: 'basic_channel',
          channelName: 'Basic notifications',
          channelDescription: 'Notification channel for basic tests',
          defaultColor: Colors.transparent,
          ledColor: Colors.transparent,
        )
      ],
      // Channel groups are only visual and are not required
      channelGroups: [
        NotificationChannelGroup(
          channelGroupKey: 'basic_channel_group',
          channelGroupName: 'Basic group',
        )
      ],
      debug: true,
    );
  }

  static void setupFirebaseMessaging() async {
    // set message in foreground
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
            alert: true, badge: true, sound: false);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Received a message while in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
        _showNotification(message.notification!);
      }
    });
  }

  static Future<void> onTapMessage() async {}

  // show Notification
  static Future<void> _showNotification(RemoteNotification notification) async {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: notification.hashCode,
        channelKey: 'basic_channel',
        title: notification.title,
        body: notification.body,
      ),
    );
  }

  @pragma('vm:entry-point')
  static Future<void> firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    AwesomeNotifications().createNotificationFromJsonData(message.data);
  }
}
