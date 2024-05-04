import 'package:flutter/material.dart';

import 'core/theme.dart';
import 'view/index_screen.dart';

class Application extends StatelessWidget {
  const Application({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Une messe',
      theme:baseTheme,
      debugShowCheckedModeBanner: false,
      home:  IndexScreen(),
    );
  }
}