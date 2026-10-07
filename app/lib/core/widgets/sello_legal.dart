import 'package:flutter/material.dart';

import '../theme/app_colores.dart';

/// Sello que acompaña toda información sanitaria mostrada (HU-07, normativa INVIMA).
class SelloLegal extends StatelessWidget {
  const SelloLegal({super.key, required this.revision});

  /// Fecha de la última revisión de Legal, ya formateada.
  final String revision;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.verified_user_outlined, size: 18, color: AppColores.azul),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            'Información sanitaria validada por Legal SiembraCo · normativa INVIMA · rev. $revision',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColores.azul),
          ),
        ),
      ],
    );
  }
}
