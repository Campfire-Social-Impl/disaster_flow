import 'package:disaster_flow/models/flow_item.dart';
import 'package:disaster_flow/models/flows.dart';
import 'package:disaster_flow/pages/flow_edit_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final flowsProvider = FutureProvider<List<ActionFlow>>((ref) async {
  final flows = await ref.watch(actionFlowListProvider.future);
  return flows;
});

class FlowListPage extends HookConsumerWidget {
  const FlowListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flows = ref.watch(flowsProvider).value;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('フローリスト'),
        centerTitle: true,
        toolbarHeight: 80,
        foregroundColor: Colors.black,
        backgroundColor: const Color.fromARGB(255, 255, 220, 81),
        shadowColor: Colors.black.withOpacity(0.2),
      ),
      body: flows != null
          ? (flows.isNotEmpty
              ? ListView.builder(
                  itemCount: flows.length,
                  itemBuilder: (context, index) {
                    final flow = flows[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 2.0),
                      child: Card(
                        child: ListTile(
                          leading: const Icon(Icons.directions_run),
                          title: Text(flow.title),
                          subtitle: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              flow.disaster,
                              style: TextStyle(
                                color: Colors.brown[500],
                              ),
                            ),
                          ),
                          trailing: PopupMenuButton(
                            onSelected: (value) {
                              if (value == "edit") {
                                showEditFlowDialog(context, ref, flow);
                              } else if (value == "delete") {
                                showDeleteFlowDialog(context, ref, flow.id);
                              }
                            },
                            itemBuilder: (context) {
                              return const [
                                PopupMenuItem(
                                  value: "edit",
                                  child: Row(
                                    children: [
                                      Icon(Icons.edit),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
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
                                        padding: EdgeInsets.symmetric(
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
                          onTap: () async {
                            ref
                                .read(flowIdProvider.notifier)
                                .update((value) => flow.id);
                            await ref
                                .read(flowItemListProvider.notifier)
                                .get(flow.id);
                            if (context.mounted) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const FlowEditPage(),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    );
                  },
                )
              : noFlowPanel(context))
          : loadingPanel(context),
    );
  }

  Widget noFlowPanel(BuildContext context) {
    return const Center(
      child: Text('フローがありません'),
    );
  }

  Widget loadingPanel(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  void showEditFlowDialog(
      BuildContext context, WidgetRef ref, ActionFlow flow) {
    final titleController = TextEditingController(text: flow.title);
    final disasterController = TextEditingController(text: flow.disaster);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("フロー情報の編集"),
          content: SizedBox(
            height: 150,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "タイトル",
                    ),
                    controller: titleController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "災害の種類",
                    ),
                    controller: disasterController,
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
                await ref.read(actionFlowListProvider.notifier).rewrite(
                      flow.id,
                      titleController.text,
                      disasterController.text,
                    );
              },
              child: const Text("編集"),
            ),
          ],
        );
      },
    );
  }

  void showDeleteFlowDialog(BuildContext context, WidgetRef ref, int id) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("フローを削除しますか？"),
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
                await ref.read(actionFlowListProvider.notifier).delete(id);
                await ref.read(flowItemListProvider.notifier).deleteAll(id);
              },
              child: const Text("削除"),
            ),
          ],
        );
      },
    );
  }
}
