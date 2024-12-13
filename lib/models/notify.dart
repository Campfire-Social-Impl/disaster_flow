import 'package:disaster_flow/database.dart';
import 'package:drift/drift.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Notify {
  final String disaster;
  final String description;
  final double longitute;
  final double latitude;
  final double radius;
  final DateTime time;
  final bool addressed;

  Notify({
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
    return await fetch();
  }

  Future<List<Notify>> fetch() async {
    final notifies = await database.select(database.notifyRaw).get();
    return notifies
        .map((e) => Notify(
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
