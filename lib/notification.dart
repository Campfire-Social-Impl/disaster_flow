import 'dart:io';

import 'package:flutter/material.dart';
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
  messaging.getToken().then((value) => debugPrint("Token: $value"));

  await initializeLocalNotification();

  FirebaseMessaging.onBackgroundMessage(backgroundMessageHandler);
  FirebaseMessaging.onMessage.listen(foregroundMessageHandler);
}

Future<void> initializeLocalNotification() async {
  final notificationPlugin = FlutterLocalNotificationsPlugin();

  notificationPlugin.initialize(
    const InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/ic_launcher"),
      iOS: DarwinInitializationSettings(),
    ),
  );

  if (Platform.isAndroid) {
    final androidImpl =
        notificationPlugin.resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();
    await androidImpl?.createNotificationChannel(androidChannel);
    await androidImpl?.requestNotificationsPermission();
  } else if (Platform.isIOS) {}
}

Future<void> backgroundMessageHandler(RemoteMessage message) async {
  debugMessageHandler(message);

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
  debugMessageHandler(message);

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

void debugMessageHandler(RemoteMessage message) {
  debugPrint("Message ID: ${message.messageId}");
  debugPrint("Message Type: ${message.messageType}");
  debugPrint("Message Notification: ${message.notification}");
  debugPrint("Message Title: ${message.notification?.title}");
  debugPrint("Message Body: ${message.notification?.body}");
  debugPrint("Message Data: ${message.data}");
  debugPrint("Message Sent Time: ${message.sentTime}");

  if (message.notification != null) {
    final notificationPlugin = FlutterLocalNotificationsPlugin();
    notificationPlugin.show(
      0,
      message.notification?.title,
      message.notification?.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          androidChannel.id,
          androidChannel.name,
          importance: Importance.max,
        ),
      ),
    );
  }
}

class DisasterMessageData {
  final String id;
  final String type;
  final dynamic data;

  DisasterMessageData({
    required this.id,
    required this.type,
    required this.data,
  });

  factory DisasterMessageData.fromMap(Map<String, dynamic> map) {
    return DisasterMessageData(
      id: map["id"],
      type: map["type"],
      data: map["data"],
    );
  }
}

class EarthquakeData {
  final double latitude;
  final double longitude;
  final double radius;
  final double magnitude;
  final double depth;
  final double maxScale;
  final String place;
  final DateTime time;

  EarthquakeData({
    required this.latitude,
    required this.longitude,
    required this.radius,
    required this.magnitude,
    required this.depth,
    required this.maxScale,
    required this.place,
    required this.time,
  });

  factory EarthquakeData.fromMap(Map<String, dynamic> map) {
    return EarthquakeData(
      latitude: double.parse(map["latitude"]),
      longitude: double.parse(map["longitude"]),
      radius: double.parse(map["radius"]),
      magnitude: double.parse(map["magnitude"]),
      depth: double.parse(map["depth"]),
      maxScale: double.parse(map["max_scale"]),
      place: map["place"],
      time: DateTime.parse(map["time"]),
    );
  }
}

class RainData {
  final double latitude;
  final double longitude;
  final double radius;
  final String place;
  final DateTime time;

  RainData({
    required this.latitude,
    required this.longitude,
    required this.radius,
    required this.place,
    required this.time,
  });

  factory RainData.fromMap(Map<String, dynamic> map) {
    return RainData(
      latitude: double.parse(map["latitude"]),
      longitude: double.parse(map["longitude"]),
      radius: double.parse(map["radius"]),
      place: map["place"],
      time: DateTime.parse(map["time"]),
    );
  }
}
