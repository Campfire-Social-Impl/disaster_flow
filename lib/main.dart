import 'package:flutter/material.dart';

void main() {
  runApp(HomeScreen());
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '防災アプリ',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        extendBodyBehindAppBar: false,
        backgroundColor: const Color.fromARGB(255, 236, 236, 236),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90.0),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color.fromARGB(255, 255, 220, 81),
                  const Color.fromARGB(255, 255, 220, 81), //グラデーションにするか迷ってる
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
        body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    width: double.infinity,
                    height: 110,
                    child: ElevatedButton(
                      //避難ボタン
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 255, 255, 255),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        shadowColor: Colors.black.withOpacity(0.5),
                        elevation: 10,
                      ),
                      onPressed: () {}, //押したときの処理
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start, // 画像を左端に配置
                        children: [
                          const SizedBox(width: 5),
                          Image.asset(
                            'assets/images/Exit_icon.png',
                            width: 60,
                            height: 60,
                          ),
                          const SizedBox(width: 40),
                          const Text(
                            '避難',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 27,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    width: double.infinity,
                    height: 110,
                    child: ElevatedButton(
                      //項目設定ボタン
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 255, 255, 255),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        shadowColor: Colors.black.withOpacity(0.5),
                        elevation: 10,
                      ),
                      onPressed: () {}, //押したときの処理
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start, // 画像を左端に配置
                        children: [
                          const SizedBox(width: 5),
                          Image.asset(
                            'assets/images/set.png',
                            width: 60,
                            height: 60,
                          ),
                          const SizedBox(width: 40),
                          const Text(
                            '災害項目別設定',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 27,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    width: double.infinity,
                    height: 110,
                    child: ElevatedButton(
                      //内容確認ボタン
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 255, 255, 255),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        shadowColor: Colors.black.withOpacity(0.5),
                        elevation: 10,
                      ),
                      onPressed: () {}, //押したときの処理
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start, // 画像を左端に配置
                        children: [
                          const SizedBox(width: 5),
                          Image.asset(
                            'assets/images/check_24.png',
                            width: 60,
                            height: 60,
                          ),
                          const SizedBox(width: 40),
                          const Text(
                            '内容確認',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 27,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: const Color.fromARGB(255, 255, 220, 81),
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
                  Text('ニュース',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      )),
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
                  Text('ホーム',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      )),
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
                  Text('その他',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
