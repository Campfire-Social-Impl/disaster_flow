// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:disaster_flow/main.dart'; // 正しいパスでインポート

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // アプリの正しいウィジェットをビルド
    await tester.pumpWidget(FlowScreen()); // 修正：FlowScreenを使う

    // 初期状態のカウンタが0か確認
    expect(find.text('0'), findsOneWidget); // 0が表示されていることを確認
    expect(find.text('1'), findsNothing); // 1が表示されていないことを確認

    // '+' アイコンをタップしてカウンタをインクリメント
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // カウンタが1にインクリメントされたことを確認
    expect(find.text('0'), findsNothing); // 0が表示されていないことを確認
    expect(find.text('1'), findsOneWidget); // 1が表示されていることを確認
  });
}
