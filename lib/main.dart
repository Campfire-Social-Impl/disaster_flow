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
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 243, 0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 30.0,
                  spreadRadius: 5.0,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: AppBar(
              toolbarHeight: 100.0,
              centerTitle: true,
              title: Text(
                "防災アプリ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 27,
                  fontWeight: FontWeight.w500,
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  width: double.infinity,
                  height: 100,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      shadowColor: Colors.black.withOpacity(0.5),
                      elevation: 10,
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/Exit_icon.png', // 画像のパスを指定
                          width: 40, // 画像の幅を設定
                          height: 40, // 画像の高さを設定
                        ),
                        const SizedBox(width: 10), // 画像とテキストの間隔
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
              Text('Default'),
              Text('Bold', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('Italic', style: TextStyle(fontStyle: FontStyle.italic)),
            ],
          ),
        ),
      ),
    );
  }
}
