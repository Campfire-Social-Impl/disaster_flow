import 'package:flutter/material.dart';

class EarthFlowScreen extends StatelessWidget {
  const EarthFlowScreen({super.key});

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
              'テーマ : 地震',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
      // ListViewを使ってスクロール可能なリストを作成
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(height: 10), // 余白を設定
            Expanded(
              child: ListView(
                children: [
                  // 関数を使って各セクションを生成
                  _buildFormSection(
                    label: '・避難先',
                    hintText: '避難場所を入力',
                  ),
                  _buildFormSection(
                    label: '・避難経路',
                    hintText: '通る場所、避ける場所(川、海側など)',
                  ),
                  _buildFormSection(
                    label: '・連絡先',
                    hintText: '電話番号、メールアドレス、sns、災害用伝言ダイヤル（171）',
                  ),
                  _buildFormSection(
                    label: '・情報の取り方',
                    hintText: '情報を摂取できるものをなにか持参しましたか（例：ラジオ)',
                  ),
                ],
              ),
            ),
          ],
        ),
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

  // フォームセクションを生成する関数
  Widget _buildFormSection({
    required String label,
    required String hintText,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20), // 各セクションの間隔を20ピクセルに設定
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white, // 背景色を白に設定
        borderRadius: BorderRadius.circular(12), // 角を丸くする
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10.0, // 影のぼかし
            spreadRadius: 2.0, // 影の広がり
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            minLines: 1, // 最小行数
            maxLines: null, // 最大行数を設定しない（無制限）
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: hintText,
            ),
          ),
          const SizedBox(height: 20),
        ],
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
