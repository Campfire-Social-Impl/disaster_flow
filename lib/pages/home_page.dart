import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      backgroundColor: const Color.fromARGB(255, 245, 244, 244),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.0),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color.fromARGB(255, 255, 220, 81),
                const Color.fromARGB(255, 255, 214, 49),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 30.0,
                spreadRadius: 5.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: AppBar(
            toolbarHeight: 80.0,
            centerTitle: true,
            title: Text(
              "防災フロー",
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10), // パディングを追加
        children: [
          _buildTile(
            context,
            Icons.directions_run,
            '避難',
            () {
              debugPrint('避難');
            },
          ),
          _buildTile(
            context,
            Icons.settings,
            '災害項目別設定',
            () {
              debugPrint('災害項目別設定');
            },
          ),
          _buildTile(
            context,
            Icons.check,
            '内容確認',
            () {
              debugPrint('内容確認');
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromARGB(255, 255, 255, 255),
        height: 91,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildBottomNavItem(Icons.newspaper, 'ニュース', () {}),
            _buildBottomNavItem(Icons.home, 'ホーム', () {}),
            _buildBottomNavItem(Icons.menu, 'その他', () {}),
          ],
        ),
      ),
    );
  }

  Widget _buildTile(
    BuildContext context,
    IconData icon,
    String title,
    void Function()? onTap,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
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
            style: const TextStyle(
              fontSize: 20,
            ),
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
          textColor: Colors.black,
          tileColor: Colors.white,
          minTileHeight: 100,
          onTap: onTap,
        ),
      ),
    );
  }

  // BottomNavigationBarのアイテムを生成する関数
  Widget _buildBottomNavItem(IconData icon, String label, VoidCallback onTap) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          padding: EdgeInsets.zero,
          iconSize: 30,
          icon: Icon(icon, color: const Color.fromARGB(255, 0, 0, 0)),
          onPressed: onTap,
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.black,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
