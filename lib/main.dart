import 'package:crud_note/misc/theme.dart';
import 'package:crud_note/providers/setting_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'screens/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final setting = ref.watch(settingProvider);
    return MaterialApp(
        title: 'Flutter Demo',
        themeMode: setting.useDarkTheme ? ThemeMode.dark : ThemeMode.light,
        darkTheme: darkTheme,
        theme: lightTheme,
        home: const SplashScreen());
  }
}
