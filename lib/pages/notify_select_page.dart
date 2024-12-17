import 'package:disaster_flow/models/flow_item.dart';
import 'package:disaster_flow/models/flows.dart';
import 'package:disaster_flow/models/notify.dart';
import 'package:disaster_flow/pages/flow_launch_page.dart';
import 'package:disaster_flow/utils/time.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final notifiesProvider = FutureProvider<List<Notify>>((ref) async {
  final notifies = await ref.watch(notifyListProvider.future);
  return notifies;
});

class NotifySelectPage extends HookConsumerWidget {
  const NotifySelectPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifies = ref.watch(notifiesProvider).value;
    final flows = ref.watch(actionFlowListProvider).value;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('避難通知'),
        centerTitle: true,
        toolbarHeight: 80,
        foregroundColor: Colors.black,
        backgroundColor: const Color.fromARGB(255, 255, 220, 81),
        shadowColor: Colors.black.withOpacity(0.2),
      ),
      body: notifies != null && flows != null
          ? (notifies.isNotEmpty
              ? ListView.builder(
                  itemCount: ref.watch(notifiesProvider).value!.length,
                  itemBuilder: (context, index) {
                    final notify = notifies[index];
                    final flow = flows
                        .where((elem) => elem.disaster == notify.disaster)
                        .firstOrNull;

                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 2.0),
                      child: Card(
                        child: ListTile(
                          leading: const Icon(Icons.directions_run),
                          title: Text(notify.disaster),
                          subtitle: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  notify.description,
                                  style: TextStyle(
                                    color: Colors.brown[500],
                                  ),
                                ),
                                Text(
                                  "時刻 : ${toTimeString(notify.time)}",
                                  style: TextStyle(
                                    color: Colors.brown[500],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          trailing: ElevatedButton(
                            onPressed: flow != null
                                ? () {
                                    ref
                                        .read(launchFlowIdProvider.notifier)
                                        .update((value) => flow.id);
                                    ref
                                        .read(flowItemListProvider.notifier)
                                        .get(flow.id);
                                    ref
                                        .read(selectedNotifyProvider.notifier)
                                        .update((value) => notify);
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const FlowLaunchPage(),
                                      ),
                                    );
                                  }
                                : null,
                            style: flow != null
                                ? ButtonStyle(
                                    foregroundColor: WidgetStateProperty.all(
                                      Colors.black,
                                    ),
                                    backgroundColor: WidgetStateProperty.all(
                                      (notify.addressed == false
                                          ? const Color.fromARGB(
                                              255, 200, 120, 80)
                                          : const Color.fromARGB(
                                              255, 255, 220, 81)),
                                    ),
                                  )
                                : ButtonStyle(
                                    foregroundColor: WidgetStateProperty.all(
                                      Colors.black,
                                    ),
                                    backgroundColor: WidgetStateProperty.all(
                                      Colors.grey,
                                    ),
                                  ),
                            child: const Text('避難'),
                          ),
                        ),
                      ),
                    );
                  },
                )
              : noNotifyPanel(context))
          : loadingPanel(context),
    );
  }

  Widget noNotifyPanel(BuildContext context) {
    return const Center(
      child: Text('避難通知がありません'),
    );
  }

  Widget loadingPanel(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
