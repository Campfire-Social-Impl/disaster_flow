import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

const AndroidNotificationChannel androidChannel = AndroidNotificationChannel(
  "disaster-notify",
  "disaster",
  importance: Importance.max,
);

Future<void> firebaseMessagingConfigure() async {
  final messaging = FirebaseMessaging.instance;

  await messaging.requestPermission(
    alert: false,
    announcement: false,
    badge: false,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: false,
  );

  await messaging.setForegroundNotificationPresentationOptions(
    alert: false,
    badge: false,
    sound: false,
  );

  messaging.subscribeToTopic("disaster");

  await initializeLocalNotification();

  FirebaseMessaging.onBackgroundMessage(backgroundMessageHandler);
  FirebaseMessaging.onMessage.listen(foregroundMessageHandler);
}

Future<void> initializeLocalNotification() async {
  final notificationPlugin = FlutterLocalNotificationsPlugin();

  if (Platform.isAndroid) {
    final androidImpl =
        notificationPlugin.resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();
    await androidImpl?.createNotificationChannel(androidChannel);
    await androidImpl?.requestNotificationsPermission();
  } else if (Platform.isIOS) {}

  notificationPlugin.initialize(
    const InitializationSettings(
      android: AndroidInitializationSettings("app_icon"),
      iOS: DarwinInitializationSettings(),
    ),
    onDidReceiveBackgroundNotificationResponse: (details) {},
  );
}

Future<void> backgroundMessageHandler(RemoteMessage message) async {
  if (message.data.isEmpty) {
    return;
  }

  // TODO: add disaster details handling

  final notificationPlugin = FlutterLocalNotificationsPlugin();
  notificationPlugin.show(
    0,
    "災害発生の通知",
    "通知をタップして避難に移行する。", // TODO: add disaster description
    NotificationDetails(
      android: AndroidNotificationDetails(
        androidChannel.id,
        androidChannel.name,
        importance: Importance.max,
      ),
    ),
  );
}

void foregroundMessageHandler(RemoteMessage message) {
  if (message.data.isEmpty) {
    return;
  }

  // TODO: add disaster details handling

  final notificationPlugin = FlutterLocalNotificationsPlugin();
  notificationPlugin.show(
    0,
    "災害発生の通知",
    "通知をタップして避難に移行する。", // TODO: add disaster description
    NotificationDetails(
      android: AndroidNotificationDetails(
        androidChannel.id,
        androidChannel.name,
        importance: Importance.max,
      ),
    ),
  );
}
