import 'package:flutter/material.dart';

import 'app_colores.dart';

abstract final class AppTheme {
  static const radioTarjeta = 20.0;
  static const radioChip = 12.0;

  static ThemeData get claro {
    final base = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColores.acento,
        primary: AppColores.acento,
        surface: AppColores.tarjeta,
      ),
      scaffoldBackgroundColor: AppColores.fondo,
    );

    return base.copyWith(
      textTheme: base.textTheme.apply(bodyColor: AppColores.tinta, displayColor: AppColores.tinta),
      cardTheme: const CardThemeData(
        color: AppColores.tarjeta,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(radioTarjeta))),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColores.acento,
          minimumSize: const Size.fromHeight(52),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radioChip)),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColores.tarjeta,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radioChip),
          borderSide: const BorderSide(color: AppColores.linea),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radioChip),
          borderSide: const BorderSide(color: AppColores.linea),
        ),
      ),
      navigationBarTheme: const NavigationBarThemeData(
        backgroundColor: AppColores.tarjeta,
        indicatorColor: AppColores.acentoSuave,
      ),
    );
  }
}
