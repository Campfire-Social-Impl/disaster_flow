import 'package:disaster_flow/pages/flow_suggest_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ThemeChoicePage extends HookConsumerWidget {
  const ThemeChoicePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      backgroundColor: const Color.fromARGB(255, 245, 244, 244),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("テーマ選択"),
        centerTitle: true,
        toolbarHeight: 80,
        foregroundColor: Colors.black,
        backgroundColor: const Color.fromARGB(255, 255, 220, 81),
        shadowColor: Colors.black.withOpacity(0.2),
        elevation: 20,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 7),
        children: [
          _buildCard(
            context,
            path: "assets/images/earthquake.png",
            title: "地震",
            onTap: () {
              ref.read(suggestThemeProvider.notifier).update((value) => "");
              ref.read(suggestThemeProvider.notifier).update((value) => "地震");
              ref.read(suggestIndexProvider.notifier).state = 0;
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const FlowSuggestPage(),
                ),
              );
            },
          ),
          _buildCard(
            context,
            path: "assets/images/flood.png",
            title: "大雨",
            onTap: () {
              ref.read(suggestThemeProvider.notifier).update((value) => "");
              ref.read(suggestThemeProvider.notifier).update((value) => "大雨");
              ref.read(suggestIndexProvider.notifier).state = 0;
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const FlowSuggestPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCard(
    BuildContext context, {
    required String path,
    required String title,
    void Function()? onTap,
  }) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10), // 均等な角丸を適用
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                path,
                width: 400, // 幅を設定
                height: 250, // 高さを設定
                fit: BoxFit.cover, // 画像を均等に配置
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                  ),
                  width: double.infinity,
                  height: 50,
                  alignment: Alignment.center,
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
