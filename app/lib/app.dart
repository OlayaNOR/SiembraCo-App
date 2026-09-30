import 'package:flutter/material.dart';

import 'core/router/app_rutas.dart';
import 'core/theme/app_theme.dart';
import 'core/widgets/shell_principal.dart';
import 'features/auth/login_screen.dart';

class SiembraCoApp extends StatelessWidget {
  const SiembraCoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SiembraCo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.claro,
      home: const LoginScreen(),
      routes: {
        AppRutas.principal: (_) => const ShellPrincipal(),
      },
    );
  }
}
