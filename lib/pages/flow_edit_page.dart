import 'package:disaster_flow/models/flow_item.dart';
import 'package:disaster_flow/models/flows.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final flowIdProvider = StateProvider<int>((ref) => 0);
final flowProvider = FutureProvider<ActionFlow?>((ref) async {
  final flowId = ref.watch(flowIdProvider);
  final flows = await ref.watch(actionFlowListProvider.future);
  final filterdFlows = flows.where((item) => item.id == flowId).toList();
  if (filterdFlows.isNotEmpty) {
    return filterdFlows[0];
  } else {
    return null;
  }
});
final flowItemsProvider = FutureProvider<List<FlowItem>>((ref) async {
  final flowId = ref.watch(flowIdProvider);
  final items = (await ref.watch(flowItemListProvider.future))
      .where((item) => item.flowId == flowId)
      .toList();
  return items;
});

class FlowEditPage extends HookConsumerWidget {
  const FlowEditPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flow = ref.watch(flowProvider).value;
    final flowItems = ref.watch(flowItemsProvider).value;

    debugPrint(flowItems.toString());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('フローの確認・編集'),
        centerTitle: true,
        toolbarHeight: 80,
        foregroundColor: Colors.black,
        backgroundColor: const Color.fromARGB(255, 255, 220, 81),
        shadowColor: Colors.black.withOpacity(0.2),
      ),
      body: flow != null
          ? Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 2.0),
                  child: Card(
                    color: Colors.white,
                    child: Row(
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
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
                  child: Row(
                    children: [
                      Text("アクション"),
                    ],
                  ),
                ),
                Expanded(
                  child: flowItems != null
                      ? ListView.builder(
                          itemCount: flowItems.length,
                          itemBuilder: (context, index) {
                            final flowItem = flowItems[index];
                            return Padding(
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
                                          child: Text(flowItem.title),
                                        ),
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: PopupMenuButton(
                                                  onSelected: (value) {
                                                    debugPrint(
                                                        "Selected: $value");
                                                  },
                                                  icon: const Icon(
                                                      Icons.more_vert),
                                                  itemBuilder: (context) {
                                                    return const [
                                                      PopupMenuItem(
                                                        value: "edit",
                                                        child: Row(
                                                          children: [
                                                            Icon(Icons.edit),
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                horizontal:
                                                                    16.0,
                                                              ),
                                                              child: Text("編集"),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      PopupMenuItem(
                                                        value: "delete",
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                              Icons.delete,
                                                              color: Colors.red,
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                horizontal:
                                                                    16.0,
                                                              ),
                                                              child: Text("削除"),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ];
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.all(16.0),
                                      child: Text("アクションの説明"),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                      : loadingPanel(context),
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
