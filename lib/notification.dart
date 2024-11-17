import 'dart:io';

import 'package:disaster_flow/database.dart';
import 'package:disaster_flow/utils/distance.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:location/location.dart';

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

  // filter disaster
  final disaster = DisasterMessageData.fromMap(message.data);
  if (disaster.type == "earthquake") {
    final data = EarthquakeData.fromMap(message.data);
    debugPrint("Earthquake: ${data.place}");
    notifyEarthquake(message.data);
  } else if (disaster.type == "rain") {
    final data = RainData.fromMap(message.data);
    debugPrint("Rain: ${data.place}");
    notifyRain(message.data);
  } else {
    debugPrint("Unknown disaster type: ${disaster.type}");
    return;
  }
}

void foregroundMessageHandler(RemoteMessage message) {
  debugMessageHandler(message);

  if (message.data.isEmpty) {
    return;
  }

  // filter disaster
  final disaster = DisasterMessageData.fromMap(message.data);

  if (disaster.type == "earthquake") {
    final data = EarthquakeData.fromMap(message.data);
    debugPrint("Earthquake: ${data.place}");
    notifyEarthquake(message.data);
  } else if (disaster.type == "rain") {
    final data = RainData.fromMap(message.data);
    debugPrint("Rain: ${data.place}");
    notifyRain(message.data);
  } else {
    debugPrint("Unknown disaster type: ${disaster.type}");
    return;
  }
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

void notifyEarthquake(
  dynamic data,
) {
  final notificationPlugin = FlutterLocalNotificationsPlugin();

  final earthquake = EarthquakeData.fromMap(data);
  final location = Location();

  debugPrint("get location");
  location.getLocation().then((value) async {
    debugPrint("get location: $value");

    if (value.latitude == null || value.longitude == null) {
      notificationPlugin.show(
        0,
        "位置情報の権限",
        "位置情報の権限が許可されていません。",
        NotificationDetails(
          android: AndroidNotificationDetails(
            androidChannel.id,
            androidChannel.name,
            importance: Importance.max,
          ),
        ),
      );
      return;
    }

    await database.into(database.notifyRaw).insert(
          NotifyRawCompanion.insert(
            disaster: "地震",
            description: "発生地点: ${earthquake.place}\n"
                "マグニチュード: ${earthquake.magnitude}\n"
                "震源の深さ: ${earthquake.depth}\n"
                "最大震度: ${earthquake.maxScale}",
            longitute: earthquake.longitude,
            latitude: earthquake.latitude,
            radius: earthquake.radius,
            time: earthquake.time,
          ),
        );

    if (isInArea(
      value.latitude!,
      value.longitude!,
      earthquake.latitude,
      earthquake.longitude,
      earthquake.radius,
    )) {
      notificationPlugin.show(
        0,
        "災害発生の通知",
        "地震が発生しました: ${earthquake.place}\n"
            " マグニチュード: ${earthquake.magnitude}"
            " 震源の深さ: ${earthquake.depth}"
            " 最大震度: ${earthquake.maxScale}"
            " 発生時刻: ${earthquake.time}",
        NotificationDetails(
          android: AndroidNotificationDetails(
            androidChannel.id,
            androidChannel.name,
            importance: Importance.max,
          ),
        ),
      );
    }
  }).onError((error, stackTrace) {
    debugPrint("Location Error: $error");
  });
}

void notifyRain(
  dynamic data,
) {
  final notificationPlugin = FlutterLocalNotificationsPlugin();

  final rain = RainData.fromMap(data);
  final location = Location();

  location.getLocation().then((value) async {
    if (value.latitude == null || value.longitude == null) {
      notificationPlugin.show(
        0,
        "位置情報の権限",
        "位置情報の権限が許可されていません。",
        NotificationDetails(
          android: AndroidNotificationDetails(
            androidChannel.id,
            androidChannel.name,
            importance: Importance.max,
          ),
        ),
      );
      return;
    }

    await database.into(database.notifyRaw).insert(
          NotifyRawCompanion.insert(
            disaster: "大雨",
            description: "発生地点: ${rain.place}",
            longitute: rain.longitude,
            latitude: rain.latitude,
            radius: rain.radius,
            time: rain.time,
          ),
        );

    if (isInArea(
      value.latitude!,
      value.longitude!,
      rain.latitude,
      rain.longitude,
      rain.radius,
    )) {
      notificationPlugin.show(
        0,
        "災害発生の通知",
        "大雨に伴う災害に警戒して下さい: ${rain.place}\n"
            "発表時刻: ${rain.time}",
        NotificationDetails(
          android: AndroidNotificationDetails(
            androidChannel.id,
            androidChannel.name,
            importance: Importance.max,
          ),
        ),
      );
    }
  }).onError((error, stackTrace) {
    debugPrint("Location Error: $error");
  });
}

class DisasterMessageData {
  final String id;
  final String type;

  DisasterMessageData({
    required this.id,
    required this.type,
  });

  factory DisasterMessageData.fromMap(Map<String, dynamic> map) {
    return DisasterMessageData(
      id: map["id"],
      type: map["type"],
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
