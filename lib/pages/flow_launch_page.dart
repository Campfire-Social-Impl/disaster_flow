import 'package:flutter/material.dart';

class FlowLaunchPage extends StatefulWidget {
  const FlowLaunchPage({super.key});

  @override
  _FlowLaunchPageState createState() => _FlowLaunchPageState();
}

class _FlowLaunchPageState extends State<FlowLaunchPage> {
  // 各フォームセクションのチェックボックスの状態を管理
  bool _isChecked1 = false;
  bool _isChecked2 = false;
  bool _isChecked3 = false;
  bool _isChecked4 = false;
  bool _isChecked5 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('避難'),
        centerTitle: true,
        toolbarHeight: 80,
        foregroundColor: Colors.black,
        backgroundColor: const Color.fromARGB(255, 255, 220, 81),
        shadowColor: Colors.black.withOpacity(0.2),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
              child: Container(
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
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("タイトル :地震発生時の行動フロー"),
                          Text("テーマ :地震"),
                          Text("アクション数 :5件"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10), // 追加の余白
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
              child: Row(
                children: const [
                  Text(
                    "＊確認した項目にチェックをつけましょう",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                children: [
                  _buildFormSection(
                    label: '避難の基準',
                    hintText: '・水位が〇〇cmになったら非難します',
                    isChecked: _isChecked1,
                    onChanged: (value) {
                      setState(() {
                        _isChecked1 = value!;
                      });
                    },
                  ),
                  _buildFormSection(
                    label: '避難先',
                    hintText: '・〇〇公園',
                    isChecked: _isChecked2,
                    onChanged: (value) {
                      setState(() {
                        _isChecked2 = value!;
                      });
                    },
                  ),
                  _buildFormSection(
                    label: '連絡先',
                    hintText: '・電話番号、メールアドレス、sns、災害用伝言ダイヤル（171）',
                    isChecked: _isChecked3,
                    onChanged: (value) {
                      setState(() {
                        _isChecked3 = value!;
                      });
                    },
                  ),
                  _buildFormSection(
                    label: '情報源',
                    hintText: '・ラジオ',
                    isChecked: _isChecked4,
                    onChanged: (value) {
                      setState(() {
                        _isChecked4 = value!;
                      });
                    },
                  ),
                  _buildFormSection(
                    label: '所持品',
                    hintText: '・食料、飲料、貴重品など',
                    isChecked: _isChecked5,
                    onChanged: (value) {
                      setState(() {
                        _isChecked5 = value!;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // フォームセクションを生成する関数
  Widget _buildFormSection({
    required String label,
    required String hintText,
    required bool isChecked,
    required ValueChanged<bool?> onChanged,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
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
              Row(
                children: [
                  Icon(Icons.check_circle_outline, color: Colors.brown),
                  const SizedBox(width: 20), // アイコンとテキストの間の余白
                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.brown,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Checkbox(
                value: isChecked,
                onChanged: onChanged,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            hintText,
            style: const TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 33, 33, 33),
            ),
          ),
        ],
      ),
    );
  }
}
