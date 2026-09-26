import 'package:flutter/material.dart';

/// Tokens de color de la marca SiembraCo.
/// 60 % base (fondo y tarjetas) · 30 % tinta · 10 % acento verde.
abstract final class AppColores {
  static const fondo = Color(0xFFF4F6F1);
  static const tarjeta = Color(0xFFFFFFFF);
  static const tinta = Color(0xFF1B2A20);
  static const tintaSecundaria = Color(0xB31B2A20); // 70 %, contraste >= 4,5:1
  static const linea = Color(0xFFE4E9E0);

  static const acento = Color(0xFF2E7D4F);
  static const acentoOscuro = Color(0xFF1F5A38);
  static const acentoSuave = Color(0x142E7D4F); // 8 %

  static const aviso = Color(0xFF8A5810);
  static const avisoFondo = Color(0xFFFBF1DC);
  static const avisoLinea = Color(0xFFEAD3A3);

  static const azul = Color(0xFF3D5A80);
}
