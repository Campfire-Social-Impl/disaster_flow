import 'package:hooks_riverpod/hooks_riverpod.dart';

class Suggest {
  final String label;
  final String advice;
  final String defaultText;

  Suggest({
    required this.label,
    required this.advice,
    required this.defaultText,
  });
}

final suggestListProvider = Provider<List<Suggest>>((ref) {
  return [
    Suggest(
      label: "避難先",
      advice: "災害時の避難場所を確認しておきましょう",
      defaultText: "〇〇公民館",
    ),
    Suggest(
      label: "避難経路",
      advice: '''避難時に通るルートを確認しましょう。\n
      途中の危険な箇所・通行止めなどはありませんか？''',
      defaultText: '''・〇〇通り\n
      ・〇〇公園を通ります。
      ・△△山は避けます。''',
    ),
    Suggest(
      label: "連絡先",
      advice: "家族・会社・SNS・緊急伝言板(171)等、連絡先を確認しておきましょう。",
      defaultText: '''・救急車 : 119\n
      ・携帯 : ''',
    ),
    Suggest(
      label: "情報源",
      advice: "スマホ・ラジオなど、緊急時の情報源の確保について確認しましょう。",
      defaultText: "ラジオ",
    ),
    Suggest(
      label: "所持品",
      advice: "持ち物についてリストアップしておきましょう。",
      defaultText: '''
      ・食料、飲料
      ・応急処置用品
      ・ティッシュ、ハンカチ
      ・貴重品
      ・衣類、タオル
      ・ラジオ、懐中電灯
      ・（その他）''',
    ),
  ];
});
