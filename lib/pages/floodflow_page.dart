import 'package:flutter/material.dart';

class FloodFlowScreen extends StatefulWidget {
  const FloodFlowScreen({super.key});

  @override
  _FloodFlowScreenState createState() => _FloodFlowScreenState();
}

class _FloodFlowScreenState extends State<FloodFlowScreen> {
  // 各セクションごとに個別の TextEditingController を保持するためのリスト
  final List<Map<String, dynamic>> sections = [
    {
      'label': '・避難先',
      'hint': '避難場所を入力',
      'controller1': TextEditingController(),
      'controller2': TextEditingController()
    },
    {
      'label': '・避難経路',
      'hint': '通る場所、避ける場所(川、海側など)',
      'controller1': TextEditingController(),
      'controller2': TextEditingController()
    },
    {
      'label': '・連絡先',
      'hint': '電話番号、メールアドレス、SNS、災害用伝言ダイヤル（171）',
      'controller1': TextEditingController(),
      'controller2': TextEditingController()
    },
    {
      'label': '・情報の取り方',
      'hint': '情報を摂取できるものをなにか持参しましたか（例：ラジオ)',
      'controller1': TextEditingController(),
      'controller2': TextEditingController()
    },
    {
      'label': '・持ち物',
      'hint': '食料、水、ラジオ、ティッシュ、貴重品、衣類など',
      'controller1': TextEditingController(),
      'controller2': TextEditingController()
    },
    {
      'label': '・その他',
      'hint': '何か必要事項の入力',
      'controller1': TextEditingController(),
      'controller2': TextEditingController()
    },
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
              'テーマ : 水害',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SizedBox(height: 15), // AppBarとリストの間のスペース
              ReorderableListView(
                shrinkWrap: true, // サイズ制限を無効にする
                physics: NeverScrollableScrollPhysics(), // 内部スクロール無効化
                children: sections.map((section) {
                  return _buildFormSection(
                    key: ValueKey(section['label']),
                    label: section['label']!,
                    hintText: section['hint']!,
                    controller1: section['controller1'],
                    controller2: section['controller2'],
                  );
                }).toList(),
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
              const SizedBox(height: 5),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    // 完了ボタンの処理
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text('完了', style: TextStyle(fontSize: 17)),
                ),
              ),
            ],
          ),
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
    required TextEditingController controller1,
    required TextEditingController controller2,
  }) {
    return Container(
      key: key,
      margin: const EdgeInsets.only(bottom: 20),
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
                  // アイコンが押されたときにダイアログを表示
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('入力フォーム'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField(
                              controller: controller1, // コントローラを使用
                              decoration: InputDecoration(
                                labelText: '入力1',
                                border: OutlineInputBorder(),
                              ),
                              minLines: 1, // 最小行数
                              maxLines: null, // 最大行数を無制限にする
                              keyboardType: TextInputType.multiline, // 複数行対応
                            ),
                            const SizedBox(height: 10),
                            TextField(
                              controller: controller2, // コントローラを使用
                              decoration: InputDecoration(
                                labelText: '入力2',
                                border: OutlineInputBorder(),
                              ),
                              minLines: 1, // 最小行数
                              maxLines: null, // 最大行数を無制限にする
                              keyboardType: TextInputType.multiline, // 複数行対応
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            child: Text('キャンセル'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              // OKが押されたときの処理
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 10),
          TextField(
            minLines: 1,
            maxLines: null,
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
          icon: Icon(icon, color: Colors.black),
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
