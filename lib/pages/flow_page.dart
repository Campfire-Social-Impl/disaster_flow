import 'package:flutter/material.dart';

class FlowScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      backgroundColor: const Color.fromARGB(255, 245, 244, 244),
      appBar: AppBar(
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
            onTap: () {},
          ),
          _buildCard(
            context,
            path: "assets/images/flood.png",
            title: "洪水",
            onTap: () {},
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
