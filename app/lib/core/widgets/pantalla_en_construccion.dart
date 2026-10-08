import 'package:flutter/material.dart';

import '../theme/app_colores.dart';

/// Marcador para las pestañas que aún no se han implementado en el sprint.
class PantallaEnConstruccion extends StatelessWidget {
  const PantallaEnConstruccion({super.key, required this.titulo});

  final String titulo;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('$titulo · en desarrollo', style: const TextStyle(color: AppColores.tintaSecundaria)),
    );
  }
}
