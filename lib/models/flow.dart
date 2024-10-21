import 'dart:async';

import 'package:disaster_flow/database.dart';
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
}

final flowListProvider = AsyncNotifierProvider<FlowListNotifier, List<Flow>>(
  () {
    return FlowListNotifier(database: database);
  },
);
