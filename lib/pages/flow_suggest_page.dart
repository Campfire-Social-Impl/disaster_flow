import 'package:disaster_flow/models/suggest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final suggestThemeProvider = StateProvider<String>((ref) => '');
final suggestIndexProvider = StateProvider<int>((ref) => 0);
final inputTextProvider = StateProvider<List<String>>((ref) {
  final suggestTheme = ref.watch(suggestThemeProvider.notifier).state;
  final suggestList = ref.watch(suggestListProvider(suggestTheme));
  return suggestList.map((item) => item.defaultText).toList();
});

class FlowSuggestPage extends HookConsumerWidget {
  const FlowSuggestPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final suggestTheme = ref.watch(suggestThemeProvider);
    final suggestList = ref.watch(suggestListProvider(suggestTheme));
    final suggestIndex = ref.watch(suggestIndexProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            ref.read(suggestThemeProvider.notifier).state = '';
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('フローの提案'),
        centerTitle: true,
        toolbarHeight: 80,
        foregroundColor: Colors.black,
        backgroundColor: const Color.fromARGB(255, 255, 220, 81),
        shadowColor: Colors.black.withOpacity(0.2),
      ),
      body: suggestIndex < suggestList.length // Limit length
          ? buildSuggestBody(context, ref)
          : buildCompleteBody(context, ref),
    );
  }

  Widget buildSuggestBody(BuildContext context, WidgetRef ref) {
    final suggestTheme = ref.watch(suggestThemeProvider);
    final suggestList = ref.watch(suggestListProvider(suggestTheme));
    final suggestIndex = ref.watch(suggestIndexProvider);

    final inputController =
        useTextEditingController(text: suggestList[suggestIndex].defaultText);

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
          child: Card(
            color: Colors.white,
            child: ListTile(
              minTileHeight: 80,
              title: Text(
                "選択中のテーマ：$suggestTheme",
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
          child: Card(
            color: Colors.white,
            child: ListTile(
              title: Text(
                suggestList[suggestIndex].label,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  suggestList[suggestIndex].advice,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
          child: Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: inputController,
                minLines: 5,
                decoration: const InputDecoration(
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
                          ref
                              .read(inputTextProvider.notifier)
                              .state[suggestIndex] = inputController.text;
                          ref.read(suggestIndexProvider.notifier).state -= 1;
                          if (suggestIndex > 0) {
                            inputController.text =
                                ref.read(inputTextProvider)[suggestIndex - 1];
                          }
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
                  onPressed: () {
                    ref.read(inputTextProvider.notifier).state[suggestIndex] =
                        inputController.text;
                    ref.read(suggestIndexProvider.notifier).state =
                        suggestIndex + 1;
                    if (suggestIndex < suggestList.length - 1) {
                      inputController.text =
                          ref.read(inputTextProvider)[suggestIndex + 1];
                    }
                  },
                  child: const Text('次へ'),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget buildCompleteBody(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [],
    );
  }
}
