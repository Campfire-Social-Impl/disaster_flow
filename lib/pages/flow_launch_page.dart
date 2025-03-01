import 'package:disaster_flow/models/flow_item.dart';
import 'package:disaster_flow/models/flows.dart';
import 'package:disaster_flow/models/notify.dart';
import 'package:disaster_flow/widgets/stripe.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final selectedNotifyProvider = StateProvider<Notify?>((ref) => null);

final launchFlowIdProvider = StateProvider<int>((ref) => 0);
final launchFlowProvider = FutureProvider<ActionFlow?>((ref) async {
  final flowId = ref.watch(launchFlowIdProvider);
  final flows = await ref.watch(actionFlowListProvider.future);
  final filterdFlows = flows.where((item) => item.id == flowId).toList();
  if (filterdFlows.isNotEmpty) {
    return filterdFlows[0];
  } else {
    return null;
  }
});
final launchFlowItemsProvider = FutureProvider<List<FlowItem>>((ref) async {
  final flowId = ref.watch(launchFlowIdProvider);
  final items = (await ref.watch(flowItemListProvider.future))
      .where((item) => item.flowId == flowId)
      .toList();
  items.sort((a, b) => a.index.compareTo(b.index));
  return items;
});
final checksProvider = StateProvider<List<bool>>((ref) {
  final flow = ref.watch(launchFlowProvider).value;
  final flowItems = ref.watch(launchFlowItemsProvider).value;

  if (flow != null && flowItems != null) {
    return List.generate(flowItems.length, (index) => false);
  } else {
    return [];
  }
});
final allCheckedProvider = Provider<bool>((ref) {
  final checks = ref.watch(checksProvider);
  for (final check in checks) {
    if (!check) {
      return false;
    }
  }
  return true;
});

class FlowLaunchPage extends HookConsumerWidget {
  const FlowLaunchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flow = ref.watch(launchFlowProvider).value;
    final flowItems = ref.watch(launchFlowItemsProvider).value;
    final checks = ref.watch(checksProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('フロー実行中'),
        centerTitle: true,
        toolbarHeight: 80,
        foregroundColor: Colors.black,
        backgroundColor: const Color.fromARGB(255, 255, 220, 81),
        shadowColor: Colors.black.withOpacity(0.2),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(10),
          child: CustomPaint(
            size: const Size.fromHeight(10),
            painter: StripePainter(),
          ),
        ),
      ),
      body: flow != null && checks.isNotEmpty
          ? Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 2.0),
                  child: Card(
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("タイトル : ${flow.title}"),
                              Text("テーマ : ${flow.disaster}"),
                              Text("アクション数 : ${flowItems!.length} 件"),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(
                                ref.watch(allCheckedProvider)
                                    ? const Color.fromARGB(255, 255, 220, 81)
                                    : Colors.grey,
                              ),
                            ),
                            onPressed: ref.watch(allCheckedProvider)
                                ? () {
                                    final notify =
                                        ref.read(selectedNotifyProvider);
                                    if (notify != null) {
                                      ref
                                          .read(notifyListProvider.notifier)
                                          .addressed(notify.id);
                                    }
                                    Navigator.of(context).pop();
                                  }
                                : null,
                            child: Text(
                              "完了",
                              style: TextStyle(
                                color: ref.watch(allCheckedProvider)
                                    ? Colors.black
                                    : Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: flowItems.length,
                    itemBuilder: (context, index) {
                      final flowItem = flowItems[index];
                      final check = checks[index];

                      return Padding(
                        key: Key(flowItem.id.toString()),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 2.0,
                        ),
                        child: Card(
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Icon(
                                      Icons.check_circle_outline,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      flowItem.title,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.brown,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Checkbox(
                                            value: check,
                                            onChanged: (value) {
                                              ref
                                                  .read(checksProvider.notifier)
                                                  .update((state) {
                                                return state
                                                    .asMap()
                                                    .entries
                                                    .map((entry) {
                                                  if (entry.key == index) {
                                                    return value!;
                                                  } else {
                                                    return entry.value;
                                                  }
                                                }).toList();
                                              });
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(flowItem.action),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            )
          : loadingPanel(context),
    );
  }

  Widget loadingPanel(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
