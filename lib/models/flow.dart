import 'dart:async';

import 'package:disaster_flow/database.dart';
import 'package:drift/drift.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Flow {
  final int id;
  final String title;
  final String disaster;

  Flow({
    required this.id,
    required this.title,
    required this.disaster,
  });
}

class FlowListNotifier extends AsyncNotifier<List<Flow>> {
  final LocalDatabase database;

  FlowListNotifier({
    required this.database,
  }) : super();

  @override
  Future<List<Flow>> build() async {
    return [];
  }

  Future<List<Flow>> fetch() async {
    final flows = await database.select(database.flowRaw).get();
    return flows
        .map((e) => Flow(
              id: e.id,
              title: e.title,
              disaster: e.disaster,
            ))
        .toList();
  }

  Future<void> get() async {
    state = const AsyncValue.loading();
    state = AsyncValue.data(await fetch());
  }

  Future<void> create(String title, String disaster) async {
    state = const AsyncValue.loading();
    await database.into(database.flowRaw).insert(
          FlowRawCompanion.insert(
            title: title,
            disaster: disaster,
          ),
        );
    state = AsyncValue.data(await fetch());
  }

  Future<void> rewrite(int id, String title, String disaster) async {
    state = const AsyncValue.loading();
    await (database.update(database.flowRaw)..where((tbl) => tbl.id.equals(id)))
        .write(
      FlowRawCompanion(
        title: Value(title),
        disaster: Value(disaster),
      ),
    );
    state = AsyncValue.data(await fetch());
  }

  Future<void> delete(int id) async {
    state = const AsyncValue.loading();
    await (database.delete(database.flowRaw)..where((tbl) => tbl.id.equals(id)))
        .go();
    state = AsyncValue.data(await fetch());
  }
}

final flowListProvider = AsyncNotifierProvider<FlowListNotifier, List<Flow>>(
  () {
    return FlowListNotifier(database: database);
  },
);
