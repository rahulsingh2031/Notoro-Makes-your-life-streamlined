import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  scaffoldBackgroundColor: const Color.fromARGB(255, 154, 111, 161),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  useMaterial3: true,
);
final darkTheme = ThemeData(
  scaffoldBackgroundColor: const Color.fromARGB(255, 54, 16, 59),
  colorScheme:
      ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 29, 9, 65)),
  useMaterial3: true,
);
