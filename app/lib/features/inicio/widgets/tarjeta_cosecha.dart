import 'package:flutter/material.dart';

import '../../../core/theme/app_colores.dart';
import '../../../core/utils/fechas.dart';
import '../../../data/models/cultivo.dart';

/// Fecha estimada de cosecha con su ventana y, si cambió, el motivo (HU-11).
class TarjetaCosecha extends StatelessWidget {
  const TarjetaCosecha({super.key, required this.cultivo});

  final Cultivo cultivo;

  @override
  Widget build(BuildContext context) {
    final texto = Theme.of(context).textTheme;
    final anterior = cultivo.cosechaAnterior;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.event_available, color: AppColores.acento),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Cosecha estimada', style: texto.bodySmall?.copyWith(color: AppColores.tintaSecundaria)),
                  Text(
                    Fechas.rango(cultivo.cosechaDesde, cultivo.cosechaHasta),
                    style: texto.titleLarge?.copyWith(fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'Ventana de ${cultivo.diasVentanaCosecha} días · se ajusta con el clima',
                    style: texto.bodySmall?.copyWith(color: AppColores.tintaSecundaria),
                  ),
                  if (anterior != null && cultivo.motivoCambioCosecha != null) ...[
                    const SizedBox(height: 8),
                    Text(
                      'Antes ${Fechas.rango(anterior.$1, anterior.$2)} · ${cultivo.motivoCambioCosecha}',
                      style: texto.bodySmall?.copyWith(color: AppColores.aviso),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
