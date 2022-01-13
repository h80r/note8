import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';

import 'canvas/home.dart';
import 'canvas/settings.dart';

void main() async {
  Hive.init((await getApplicationDocumentsDirectory()).path);
  await Hive.openBox<bool>('settings');

  runApp(
    // The ProviderScope widget saves the state of all Providers, so it needs to
    // be at the top of your Widget tree.
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Note8',
      routes: {
        '/': (_) => const HomeCanvas(title: 'Flutter Demo Home Page'),
        '/settings': (_) => const SettingsCanvas(),
      },
    );
  }
}
