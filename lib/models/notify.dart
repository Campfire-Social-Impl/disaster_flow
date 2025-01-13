import 'package:disaster_flow/database.dart';
import 'package:disaster_flow/notification.dart';
import 'package:disaster_flow/utils/distance.dart';
import 'package:drift/drift.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:location/location.dart';

class Notify {
  final int id;
  final String disaster;
  final String description;
  final double longitute;
  final double latitude;
  final double radius;
  final DateTime time;
  final bool addressed;

  Notify({
    required this.id,
    required this.disaster,
    required this.description,
    required this.longitute,
    required this.latitude,
    required this.radius,
    required this.time,
    required this.addressed,
  });
}

class NotifyListNotifier extends AsyncNotifier<List<Notify>> {
  NotifyListNotifier() : super();

  @override
  Future<List<Notify>> build() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      await listenMessage(message);
    });

    return await fetch();
  }

  Future<void> listenMessage(RemoteMessage message) async {
    debugMessageHandler(message);

    if (message.data.isEmpty) {
      return;
    }

    final notificationPlugin = FlutterLocalNotificationsPlugin();
    final location = Location();
    final position = await location.getLocation();
    debugPrint("get location: $position");

    if (position.latitude == null || position.longitude == null) {
      await notificationPlugin.show(
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

    // filter disaster
    final disaster = DisasterMessageData.fromMap(message.data);
    if (disaster.type == "earthquake") {
      final earthquake = EarthquakeData.fromMap(message.data);
      debugPrint("Earthquake: ${earthquake.place}");

      if (!isInArea(
        position.longitude!,
        position.latitude!,
        earthquake.longitude,
        earthquake.latitude,
        earthquake.radius,
      )) {
        return;
      }
      await notifyEarthquake(message.data);
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
      await get();
    } else if (disaster.type == "rain") {
      final rain = RainData.fromMap(message.data);
      debugPrint("Rain: ${rain.place}");
      if (!isInArea(
        position.longitude!,
        position.latitude!,
        rain.longitude,
        rain.latitude,
        rain.radius,
      )) {
        return;
      }
      await notifyRain(message.data);
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
      await get();
    } else {
      debugPrint("Unknown disaster type: ${disaster.type}");
      return;
    }
  }

  Future<List<Notify>> fetch() async {
    final notifies = await database.select(database.notifyRaw).get();
    return notifies
        .map((e) => Notify(
              id: e.id,
              disaster: e.disaster,
              description: e.description,
              longitute: e.longitute,
              latitude: e.latitude,
              radius: e.radius,
              time: e.time,
              addressed: e.addressed,
            ))
        .toList();
  }

  Future<void> get() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return await fetch();
    });
  }

  Future<int> create(
    String disaster,
    String description,
    double longitute,
    double latitude,
    double radius,
    DateTime time,
  ) async {
    state = const AsyncValue.loading();
    final row = await database.into(database.notifyRaw).insertReturning(
          NotifyRawCompanion.insert(
            disaster: disaster,
            description: description,
            longitute: longitute,
            latitude: latitude,
            radius: radius,
            time: time,
            addressed: const Value(false),
          ),
        );
    state = await AsyncValue.guard(() async {
      return await fetch();
    });
    return row.id;
  }

  Future<void> addressed(int id) async {
    state = const AsyncValue.loading();
    await (database.update(database.notifyRaw)
          ..where((tbl) => tbl.id.equals(id)))
        .write(
      const NotifyRawCompanion(
        addressed: Value(true),
      ),
    );
    state = await AsyncValue.guard(() async {
      return await fetch();
    });
  }

  Future<void> rewrite(
    int id,
    String disaster,
    String description,
    double longitute,
    double latitude,
    double radius,
    DateTime time,
    bool addressed,
  ) async {
    state = const AsyncValue.loading();
    await (database.update(database.notifyRaw)
          ..where((tbl) => tbl.id.equals(id)))
        .write(
      NotifyRawCompanion(
        disaster: Value(disaster),
        description: Value(description),
        longitute: Value(longitute),
        latitude: Value(latitude),
        radius: Value(radius),
        time: Value(time),
        addressed: Value(addressed),
      ),
    );
    state = await AsyncValue.guard(() async {
      return await fetch();
    });
  }

  Future<void> delete(int id) async {
    state = const AsyncValue.loading();
    await (database.delete(database.notifyRaw)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
    state = await AsyncValue.guard(() async {
      return await fetch();
    });
  }
}

final notifyListProvider =
    AsyncNotifierProvider<NotifyListNotifier, List<Notify>>(
  () {
    return NotifyListNotifier();
  },
);
