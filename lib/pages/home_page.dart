import 'package:disaster_flow/models/flows.dart';
import 'package:disaster_flow/models/notify.dart';
import 'package:disaster_flow/pages/flow_list_page.dart';
import 'package:disaster_flow/pages/notify_select_page.dart';
import 'package:disaster_flow/pages/theme_choice_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final pendingNotifyProvider = FutureProvider<List<Notify>>((ref) async {
  final notifies = await ref.watch(notifyListProvider.future);
  return notifies.where((notify) => notify.addressed == false).toList();
});

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('防災フロー'),
        centerTitle: true,
        toolbarHeight: 80,
        foregroundColor: Colors.black,
        backgroundColor: const Color.fromARGB(255, 255, 220, 81),
        shadowColor: Colors.black.withOpacity(0.2),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10), // パディングを追加
        children: [
          _buildTile(
            context,
            icon: Icons.directions_run,
            title: '避難',
            shadowColor: ref.watch(pendingNotifyProvider).when(
                  data: (notifies) {
                    if (notifies.isNotEmpty) {
                      return Colors.red.withOpacity(0.5);
                    } else {
                      return Colors.black.withOpacity(0.5);
                    }
                  },
                  loading: () => Colors.black.withOpacity(0.5),
                  error: (error, _) => Colors.black.withOpacity(0.5),
                ),
            elevation: ref.watch(pendingNotifyProvider).when(
                  data: (notifies) {
                    if (notifies.isNotEmpty) {
                      return 5.0;
                    } else {
                      return 3.0;
                    }
                  },
                  loading: () => 3.0,
                  error: (error, _) => 3.0,
                ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const NotifySelectPage(),
                ),
              );
            },
          ),
          _buildTile(
            context,
            icon: Icons.settings,
            title: "フローの作成",
            shadowColor: Colors.black.withOpacity(0.5),
            elevation: 3,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ThemeChoicePage(),
                ),
              );
            },
          ),
          _buildTile(
            context,
            icon: Icons.check,
            title: 'フローの確認',
            shadowColor: Colors.black.withOpacity(0.5),
            elevation: 3,
            onTap: () async {
              await ref.read(actionFlowListProvider.notifier).get();
              if (context.mounted) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const FlowListPage(),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required Color shadowColor,
    required double elevation,
    void Function()? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
      child: Card(
        shadowColor: shadowColor,
        elevation: elevation,
        child: ListTile(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              icon,
              color: Colors.black,
              size: 36,
            ),
          ),
          title: Text(
            title,
          ),
          trailing: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(25),
            ),
            child: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
              size: 28,
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          textColor: Colors.black,
          tileColor: Colors.white,
          minTileHeight: 120,
          onTap: onTap,
        ),
      ),
    );
  }
}
