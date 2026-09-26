import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';

void main() {
  runApp(const SiembraCoApp());
}

class SiembraCoApp extends StatelessWidget {
  const SiembraCoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SiembraCo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.claro,
      home: const Scaffold(
        body: Center(child: Text('SiembraCo')),
      ),
    );
  }
}
