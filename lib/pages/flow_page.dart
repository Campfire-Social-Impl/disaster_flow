import 'package:flutter/material.dart';

class FlowScreen extends StatelessWidget {
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
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            centerTitle: true,
            leading: IconButton(
              iconSize: 30,
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                // 戻る処理
              },
            ),
            title: Text(
              'テーマ選択',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
      // ListViewを使用してコンテンツをコンパクトに
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 7),
        children: [
          _buildOptionCard(
            context,
            title: '地震',
            imagePath: 'assets/images/earthquake.png',
            onTap: () {
              // 地震の対策画面への処理
            },
          ),
          const SizedBox(height: 15),
          _buildOptionCard(
            context,
            title: '洪水',
            imagePath: 'assets/images/flood.png',
            onTap: () {
              // 洪水の対策画面への処理
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

  // カードウィジェットを生成する関数
  Widget _buildOptionCard(
    BuildContext context, {
    required String title,
    required String imagePath,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25), // 影の色
            blurRadius: 10, // ぼかしの強さ
            spreadRadius: 2, // 影の広がり
            offset: Offset(0, 5), // 影の位置（X, Y方向）
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30), // 均等な角丸を適用
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                imagePath,
                width: 400, // 幅を設定
                height: 250, // 高さを設定
                fit: BoxFit.cover, // 画像を均等に配置
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5), // 背景色を黒に設定（透過あり）
                    borderRadius: BorderRadius.circular(15), // 同じ角丸を適用
                  ),
                  width: double.infinity,
                  height: 50,
                  alignment: Alignment.center,
                  child: Text(
                    title,
                    style: TextStyle(
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
