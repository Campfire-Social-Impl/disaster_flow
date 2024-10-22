import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FlowEditPage extends HookConsumerWidget {
  const FlowEditPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('防災フロー'),
        centerTitle: true,
        toolbarHeight: 80,
        foregroundColor: Colors.black,
        backgroundColor: const Color.fromARGB(255, 255, 220, 81),
        shadowColor: Colors.black.withOpacity(0.2),
        elevation: 20,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
            child: Card(
              color: Colors.white,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("テーマ : 水害"),
                        Text("アクション数 : 10 件"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
            child: Row(
              children: [
                Text("アクション"),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
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
                              child: Text("アクション $index"),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: PopupMenuButton(
                                      onSelected: (value) {
                                        debugPrint("Selected: $value");
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
            ),
          ),
        ],
      ),
    );
  }
}
