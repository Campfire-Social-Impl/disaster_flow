import 'package:disaster_flow/pages/flow_edit_page.dart';
import 'package:disaster_flow/pages/flow_suggest_page.dart';
import 'package:disaster_flow/pages/theme_choice_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

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
      ),
      body: ListView(
        padding: const EdgeInsets.all(10), // パディングを追加
        children: [
          _buildTile(
            context,
            icon: Icons.directions_run,
            title: '避難',
            onTap: () {
              debugPrint('避難');
            },
          ),
          _buildTile(
            context,
            icon: Icons.settings,
            title: "フローの作成",
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ThemeChoicePage(),
                ),
              );
            },
          ),
          _buildTile(
            context,
            icon: Icons.check,
            title: 'フローの確認',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const FlowEditPage(),
                ),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.black,
        unselectedItemColor: Colors.grey[700],
        iconSize: 30,
        backgroundColor: Colors.yellow[50],
        items: const [
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 8),
              child: Icon(
                Icons.newspaper,
                color: Colors.black,
              ),
            ),
            label: 'ニュース',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 8),
              child: Icon(
                Icons.home,
                color: Colors.black,
              ),
            ),
            label: 'ホーム',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 8),
              child: Icon(
                Icons.menu,
                color: Colors.black,
              ),
            ),
            label: 'その他',
          ),
        ],
      ),
    );
  }

  Widget _buildTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    void Function()? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
      child: Card(
        child: ListTile(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              icon,
              color: Colors.black,
              size: 36,
            ),
          ),
          title: Text(
            title,
          ),
          trailing: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(25),
            ),
            child: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
              size: 28,
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          textColor: Colors.black,
          tileColor: Colors.white,
          minTileHeight: 120,
          onTap: onTap,
        ),
      ),
    );
  }
}
