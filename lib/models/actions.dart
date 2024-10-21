import 'package:disaster_flow/database.dart';
import 'package:drift/drift.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Action {
  final int id;
  final int flowId;
  final String title;
  final String action;

  Action({
    required this.id,
    required this.flowId,
    required this.title,
    required this.action,
  });
}

class ActionsNotifier extends AsyncNotifier<List<Action>> {
  final LocalDatabase database;

  ActionsNotifier({
    required this.database,
  }) : super();

  @override
  Future<List<Action>> build() async {
    return [];
  }

  Future<List<Action>> fetch(int flowId) async {
    final actions = await database.select(database.actionRaw).get();
    return actions
        .where((element) => element.flowId == flowId)
        .map((e) => Action(
              id: e.id,
              flowId: e.flowId,
              title: e.title,
              action: e.action,
            ))
        .toList();
  }

  Future<void> get(int flowId) async {
    state = const AsyncValue.loading();
    state = AsyncValue.data(await fetch(flowId));
  }

  Future<void> create(int flowId, String title, String action) async {
    state = const AsyncValue.loading();
    await database.into(database.actionRaw).insert(
          ActionRawCompanion.insert(
            flowId: flowId,
            title: title,
            action: action,
          ),
        );
    state = AsyncValue.data(await fetch(flowId));
  }

  Future<void> rewrite(int id, String title, String action) async {
    state = const AsyncValue.loading();
    await (database.update(database.actionRaw)
          ..where((tbl) => tbl.id.equals(id)))
        .write(
      ActionRawCompanion(
        title: Value(title),
        action: Value(action),
      ),
    );
    state = AsyncValue.data(await fetch(id));
  }

  Future<void> delete(int id) async {
    state = const AsyncValue.loading();
    await (database.delete(database.actionRaw)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
    state = AsyncValue.data(await fetch(id));
  }
}

final actionsListProvider =
    AsyncNotifierProvider<ActionsNotifier, List<Action>>(
  () {
    return ActionsNotifier(database: database);
  },
);
