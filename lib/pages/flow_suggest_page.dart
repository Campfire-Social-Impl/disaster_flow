import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final suggestIndexProvider = StateProvider<int>((ref) => 0);

class FlowSuggestPage extends HookConsumerWidget {
  const FlowSuggestPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('フローの提案'),
        centerTitle: true,
        toolbarHeight: 80,
        foregroundColor: Colors.black,
        backgroundColor: const Color.fromARGB(255, 255, 220, 81),
        shadowColor: Colors.black.withOpacity(0.2),
        elevation: 20,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.white,
              child: ListTile(
                minTileHeight: 80,
                title: Text(
                  "選択中のテーマ：水害",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.white,
              child: ListTile(
                title: Text(
                  "避難先",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "避難場所を入力",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '複数行入力可',
                  ),
                  maxLength: null,
                  maxLines: null,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    onPressed: ref.watch(suggestIndexProvider) == 0
                        ? null
                        : () {
                            ref.read(suggestIndexProvider.notifier).state -= 1;
                          },
                    child: const Text('戻る'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    onPressed: () {},
                    child: const Text('次へ'),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
