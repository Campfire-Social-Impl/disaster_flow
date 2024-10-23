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
  items.sort((a, b) => a.index.compareTo(b.index));
  return items;
});

class FlowEditPage extends HookConsumerWidget {
  const FlowEditPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flow = ref.watch(flowProvider).value;
    final flowItems = ref.watch(flowItemsProvider).value;

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
                  child: ReorderableListView.builder(
                    itemCount: flowItems.length,
                    itemBuilder: (context, index) {
                      final flowItem = flowItems[index];
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
                                          child: PopupMenuButton(
                                            onSelected: (value) async {
                                              if (value == "edit") {
                                                showEditFlowItemDialog(
                                                  context,
                                                  ref,
                                                  flowItem,
                                                );
                                              } else if (value == "delete") {
                                                await ref
                                                    .read(flowItemListProvider
                                                        .notifier)
                                                    .delete(
                                                      flowItem.id,
                                                    );
                                              }
                                            },
                                            icon: const Icon(Icons.more_vert),
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
                                                          horizontal: 16.0,
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
                                                          horizontal: 16.0,
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
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(flowItem.action),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    onReorder: (int oldIndex, int newIndex) async {
                      debugPrint("Reorder: $oldIndex -> $newIndex");
                      final ids = flowItems.map((e) => e.id).toList();

                      if (oldIndex < newIndex) {
                        newIndex -= 1;
                      }
                      final int item = ids.removeAt(oldIndex);
                      ids.insert(newIndex, item);

                      await ref
                          .read(flowItemListProvider.notifier)
                          .reorder(ids);
                      await ref
                          .read(flowItemListProvider.notifier)
                          .get(flow.id);
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

  void showEditFlowItemDialog(
      BuildContext context, WidgetRef ref, FlowItem item) {
    final titleController = TextEditingController(text: item.title);
    final actionController = TextEditingController(text: item.action);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("アクションの編集"),
          content: SizedBox(
            height: 250,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "アクションのタイトル",
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: TextField(
                        controller: actionController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'アクションの内容',
                        ),
                        minLines: 2,
                        maxLines: null,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("キャンセル"),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                await ref.read(flowItemListProvider.notifier).rewrite(
                      item.id,
                      titleController.text,
                      actionController.text,
                    );
              },
              child: const Text("保存"),
            ),
          ],
        );
      },
    );
  }
}
