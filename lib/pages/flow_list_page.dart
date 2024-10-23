import 'package:disaster_flow/models/flows.dart';
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
      body: ref.watch(flowsProvider).value != null
          ? ListView.builder(
              itemCount: ref.watch(flowsProvider).value!.length,
              itemBuilder: (context, index) {
                final flowItem = ref.read(flowsProvider).value![index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 2.0),
                  child: Card(
                    child: ListTile(
                      leading: const Icon(Icons.directions_run),
                      title: Text(flowItem.title),
                      subtitle: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          flowItem.disaster,
                          style: TextStyle(
                            color: Colors.brown[500],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
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
