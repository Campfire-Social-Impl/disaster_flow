import 'package:flutter/material.dart';

void main() {
  runApp(FlowScreen());
}

class FlowScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '防災アプリ',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
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
                '防災フロー',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: SizedBox(
                  width: double.infinity,
                  height: 250,
                  child: InkWell(
                    onTap: () {
                      // 処理内容
                    },
                    child: Stack(
                      alignment: Alignment.center, // 中央に配置
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(60), // 角丸を適用
                          child: Opacity(
                            opacity: 0.85, // 透過度を設定
                            child: Image.asset(
                              'assets/images/earthquake1.png',
                              width: 400, // 幅を変更
                              height: 300, // 高さを変更
                              fit: BoxFit.contain, // アスペクト比を維持するための指定
                            ),
                          ),
                        ),
                        // テキストの背景色を画像の中央に配置し、角丸を適用
                        Align(
                          alignment: Alignment.center, // 画像の中央に配置
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black
                                  .withOpacity(0.5), // 背景色を黒に設定（透過あり）
                              borderRadius: BorderRadius.circular(10), // 角丸を適用
                            ),
                            width: 375, // 幅を変更
                            height: 50, // 高さを設定
                            alignment: Alignment.center, // テキストを中央に配置
                            child: Text(
                              '地震', // 表示したいテキスト
                              style: TextStyle(
                                color: Colors.white, // テキストの色を白に設定
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
              ),
              const SizedBox(height: 5),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: const Color.fromARGB(255, 255, 255, 255),
          height: 91,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    iconSize: 30,
                    icon: Icon(Icons.newspaper,
                        color: const Color.fromARGB(255, 0, 0, 0)),
                    onPressed: () {},
                  ),
                  Text(
                    'ニュース',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    iconSize: 30,
                    icon: Icon(Icons.home,
                        color: const Color.fromARGB(255, 0, 0, 0)),
                    onPressed: () {},
                  ),
                  Text(
                    'ホーム',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    iconSize: 30,
                    icon: Icon(Icons.menu,
                        color: const Color.fromARGB(255, 0, 0, 0)),
                    onPressed: () {},
                  ),
                  Text(
                    'その他',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
