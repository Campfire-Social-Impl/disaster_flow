import 'dart:async';

import 'package:disaster_flow/database.dart';
import 'package:drift/drift.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ActionFlow {
  final int id;
  final String title;
  final String disaster;

  ActionFlow({
    required this.id,
    required this.title,
    required this.disaster,
  });
}

class ActionFlowListNotifier extends AsyncNotifier<List<ActionFlow>> {
  ActionFlowListNotifier() : super();

  @override
  Future<List<ActionFlow>> build() async {
    return await fetch();
  }

  Future<List<ActionFlow>> fetch() async {
    final flows = await database.select(database.flowRaw).get();
    return flows
        .map((e) => ActionFlow(
              id: e.id,
              title: e.title,
              disaster: e.disaster,
            ))
        .toList();
  }

  Future<void> get() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return await fetch();
    });
  }

  Future<int> create(String title, String disaster) async {
    state = const AsyncValue.loading();
    final row = await database.into(database.flowRaw).insertReturning(
          FlowRawCompanion.insert(
            title: title,
            disaster: disaster,
          ),
        );
    state = await AsyncValue.guard(() async {
      return await fetch();
    });
    return row.id;
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
    state = await AsyncValue.guard(() async {
      return await fetch();
    });
  }

  Future<void> delete(int id) async {
    state = const AsyncValue.loading();
    await (database.delete(database.flowRaw)..where((tbl) => tbl.id.equals(id)))
        .go();
    state = await AsyncValue.guard(() async {
      return await fetch();
    });
  }

  Future<void> deleteAll(int flowId) async {
    state = const AsyncValue.loading();
    await (database.delete(database.actionRaw)
          ..where((tbl) => tbl.flowId.equals(flowId)))
        .go();
    state = await AsyncValue.guard(() async {
      return await fetch();
    });
  }

  Future<void> reorder(List<int> ids) async {
    state = const AsyncValue.loading();
    for (var i = 0; i < ids.length; i++) {
      await (database.update(database.actionRaw)
            ..where((tbl) => tbl.id.equals(ids[i])))
          .write(
        ActionRawCompanion(
          index: Value(i),
        ),
      );
    }
    state = await AsyncValue.guard(() async {
      return await fetch();
    });
  }
}

final actionFlowListProvider =
    AsyncNotifierProvider<ActionFlowListNotifier, List<ActionFlow>>(
  () {
    return ActionFlowListNotifier();
  },
);
