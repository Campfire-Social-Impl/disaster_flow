import 'package:flutter/material.dart';

class EarthFlowScreen extends StatefulWidget {
  const EarthFlowScreen({super.key});

  @override
  _EarthFlowScreenState createState() => _EarthFlowScreenState();
}

class _EarthFlowScreenState extends State<EarthFlowScreen> {
  // 並び替え可能なリストのデータ
  List<Map<String, String>> sections = [
    {'label': '・避難先', 'hint': '避難場所を入力'},
    {'label': '・避難経路', 'hint': '通る場所、避ける場所(川、海側など)'},
    {'label': '・連絡先', 'hint': '電話番号、メールアドレス、SNS、災害用伝言ダイヤル（171）'},
    {'label': '・情報の取り方', 'hint': '情報を摂取できるものをなにか持参しましたか（例：ラジオ)'},
    {'label': '・持ち物', 'hint': '食料、水、ラジオ、ティッシュ、貴重品、衣類など'},
    {'label': '・その他', 'hint': '何か必要事項の入力'},
  ];

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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(height: 15), // AppBarとListViewの間のスペース
            Expanded(
              child: ReorderableListView.builder(
                itemCount: sections.length,
                itemBuilder: (context, index) {
                  return _buildFormSection(
                    key: ValueKey(sections[index]['label']),
                    label: sections[index]['label']!,
                    hintText: sections[index]['hint']!,
                  );
                },
                onReorder: (int oldIndex, int newIndex) {
                  setState(() {
                    if (oldIndex < newIndex) {
                      newIndex -= 1;
                    }
                    final item = sections.removeAt(oldIndex);
                    sections.insert(newIndex, item);
                  });
                },
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
    required Key key,
    required String label,
    required String hintText,
  }) {
    return Container(
      key: key,
      margin: const EdgeInsets.only(bottom: 20), // 各セクションの間隔を20ピクセルに設定
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: Icon(Icons.create),
                onPressed: () {
                  // ボタンが押されたときの処理
                },
              ),
            ],
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
          const SizedBox(height: 15),
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
