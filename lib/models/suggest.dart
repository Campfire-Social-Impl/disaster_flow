import 'package:hooks_riverpod/hooks_riverpod.dart';

class Suggest {
  final String label;
  final String advice;

  Suggest({
    required this.label,
    required this.advice,
  });
}

final suggestListProvider = Provider<List<Suggest>>((ref) {
  return [
    Suggest(
      label: "避難先",
      advice: "災害時の避難場所を確認しておきましょう",
    ),
    Suggest(
      label: "避難経路",
      advice: '''避難時に通るルートを確認しましょう。\n
      途中の危険な箇所・通行止めなどはありませんか？''',
    ),
    Suggest(
      label: "連絡先",
      advice: "家族・会社・SNS・緊急伝言板(171)等、連絡先を確認しておきましょう。",
    ),
    Suggest(
      label: "情報源",
      advice: "スマホ・ラジオなど、緊急時の情報源の確保について確認しましょう。",
    ),
    Suggest(
      label: "所持品",
      advice: '''持ち物についてリストアップしておきましょう。\n
      ・食料、飲料
      ・応急処置用品
      ・ティッシュ、ハンカチ
      ・貴重品
      ・衣類、タオル''',
    ),
  ];
});
