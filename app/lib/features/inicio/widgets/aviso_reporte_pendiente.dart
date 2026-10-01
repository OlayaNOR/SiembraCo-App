import 'package:flutter/material.dart';

import '../../../core/theme/app_colores.dart';
import '../../../core/utils/fechas.dart';

/// Aviso cuando el agricultor no ha reportado a tiempo (CA-1.2, excepción 1 del BPMN).
/// Se muestra el último estado confirmado; nunca una etapa sin confirmar.
class AvisoReportePendiente extends StatelessWidget {
  const AvisoReportePendiente({super.key, required this.ultimoReporte});

  final DateTime ultimoReporte;

  @override
  Widget build(BuildContext context) {
    final dias = DateTime.now().difference(ultimoReporte).inDays;
    final texto = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColores.avisoFondo,
        border: Border.all(color: AppColores.avisoLinea),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.schedule, color: AppColores.aviso),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Actualización pendiente',
                    style: texto.titleSmall?.copyWith(color: AppColores.aviso, fontWeight: FontWeight.w700)),
                Text(
                  'Último reporte de campo: ${Fechas.conDia(ultimoReporte)} (hace $dias días). '
                  'Mostramos el último estado confirmado. Ya avisamos a tu agricultor y a soporte agrícola.',
                  style: texto.bodySmall?.copyWith(color: AppColores.aviso),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
