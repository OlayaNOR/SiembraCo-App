import 'package:flutter/material.dart';

import 'core/router/app_rutas.dart';
import 'core/theme/app_theme.dart';
import 'core/widgets/shell_principal.dart';

class SiembraCoApp extends StatelessWidget {
  const SiembraCoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SiembraCo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.claro,
      home: const ShellPrincipal(),
      routes: {
        AppRutas.principal: (_) => const ShellPrincipal(),
      },
    );
  }
}
