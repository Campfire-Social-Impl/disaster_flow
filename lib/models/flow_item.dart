import 'package:disaster_flow/database.dart';
import 'package:drift/drift.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FlowItem {
  final int id;
  final int flowId;
  final String title;
  final String action;
  final int index;

  FlowItem({
    required this.id,
    required this.flowId,
    required this.title,
    required this.action,
    required this.index,
  });
}

class FlowItemsNotifier extends AsyncNotifier<List<FlowItem>> {
  FlowItemsNotifier() : super();

  @override
  Future<List<FlowItem>> build() async {
    return [];
  }

  Future<List<FlowItem>> fetch() async {
    final actions = await database.select(database.actionRaw).get();
    return actions
        .map((e) => FlowItem(
              id: e.id,
              flowId: e.flowId,
              title: e.title,
              action: e.action,
              index: e.index,
            ))
        .toList();
  }

  Future<void> get(int flowId) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return await fetch();
    });
  }

  Future<int> create(int flowId, String title, String action, int index) async {
    state = const AsyncValue.loading();
    final row = await database.into(database.actionRaw).insertReturning(
          ActionRawCompanion.insert(
            flowId: flowId,
            title: title,
            action: action,
            index: index,
          ),
        );
    state = await AsyncValue.guard(() async {
      return await fetch();
    });
    return row.id;
  }

  Future<void> rewrite(int id, int flowId, String title, String action) async {
    state = const AsyncValue.loading();
    await (database.update(database.actionRaw)
          ..where((tbl) => tbl.id.equals(id)))
        .write(
      ActionRawCompanion(
        title: Value(title),
        action: Value(action),
      ),
    );
    state = await AsyncValue.guard(() async {
      return await fetch();
    });
  }

  Future<void> delete(int id, int flowId) async {
    state = const AsyncValue.loading();
    await (database.delete(database.actionRaw)
          ..where((tbl) => tbl.id.equals(id)))
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
          id: Value(ids[i]),
          index: Value(i),
        ),
      );
    }
    state = await AsyncValue.guard(() async {
      return await fetch();
    });
  }
}

final flowItemListProvider =
    AsyncNotifierProvider<FlowItemsNotifier, List<FlowItem>>(
  () {
    return FlowItemsNotifier();
  },
);
