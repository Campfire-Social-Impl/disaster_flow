import 'package:disaster_flow/firebase_options.dart';
import 'package:disaster_flow/notification.dart';
import 'package:disaster_flow/pages/home_page.dart';
import 'package:disaster_flow/permissions.dart';
import 'package:disaster_flow/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await firebaseMessagingConfigure();
  await getLocationPermission();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '防災アプリ',
      theme: ThemeData(
        colorScheme: MaterialTheme.lightScheme(),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
