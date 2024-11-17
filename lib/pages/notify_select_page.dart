import 'package:disaster_flow/models/notify.dart';
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
      body: notifies != null
          ? (notifies.isNotEmpty
              ? ListView.builder(
                  itemCount: ref.watch(notifiesProvider).value!.length,
                  itemBuilder: (context, index) {
                    final notify = notifies[index];
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
