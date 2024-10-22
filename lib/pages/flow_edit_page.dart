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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.white,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
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
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Colors.white,
                    child: ListTile(
                      title: Text('Item $index'),
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
