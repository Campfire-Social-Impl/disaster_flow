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
              //前画面に戻る
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25), // 影の色
                      blurRadius: 10, // ぼかしの強さ
                      spreadRadius: 2, // 影の広がり
                      offset: Offset(0, 0), // 影の位置（X, Y方向）
                    ),
                  ],
                ),
                child: InkWell(
                  //地震の対策用画面へ
                  onTap: () {
                    // 処理内容
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30), // 均等な角丸を適用
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          'assets/images/earthquake1.png',
                          width: 400, // 幅を設定
                          height: 250, // 高さを設定
                          fit: BoxFit.cover, // 画像を均等に配置
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black
                                  .withOpacity(0.5), // 背景色を黒に設定（透過あり）
                              borderRadius:
                                  BorderRadius.circular(15), // 同じ角丸を適用
                            ),
                            width: double.infinity,
                            height: 50,
                            alignment: Alignment.center,
                            child: Text(
                              '地震',
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
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: Container(
                width: double.infinity,
                height: 250,
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
                  //洪水の対策用画面へ
                  onTap: () {
                    // 処理内容
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30), // 均等な角丸を適用
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          'assets/images/flood1.png',
                          width: 400, // 幅を設定
                          height: 250, // 高さを設定
                          fit: BoxFit.cover, // 画像を均等に配置
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black
                                  .withOpacity(0.5), // 背景色を黒に設定（透過あり）
                              borderRadius:
                                  BorderRadius.circular(15), // 同じ角丸を適用
                            ),
                            width: double.infinity,
                            height: 50,
                            alignment: Alignment.center,
                            child: Text(
                              '洪水',
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
    );
  }
}
