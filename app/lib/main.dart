import 'package:flutter/material.dart';

void main() {
  runApp(const SiembraCoApp());
}

class SiembraCoApp extends StatelessWidget {
  const SiembraCoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'SiembraCo',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(child: Text('SiembraCo')),
      ),
    );
  }
}
