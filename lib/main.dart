import 'package:flutter/material.dart';
import 'package:une_messe/index_screen.dart';

import 'core/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Une messe',
      theme:baseTheme,
      debugShowCheckedModeBanner: false,
      home: const IndexScreen(),
    );
  }
}