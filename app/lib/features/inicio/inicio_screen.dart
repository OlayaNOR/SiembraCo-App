import 'package:flutter/material.dart';

import '../../core/theme/app_colores.dart';
import '../../core/widgets/sello_legal.dart';
import '../../core/utils/fechas.dart';
import '../../data/plataforma/plataforma_ejemplo.dart';
import '../../data/repositorios/repositorio_cultivo.dart';
import 'widgets/anillo_avance.dart';
import 'widgets/aviso_reporte_pendiente.dart';
import 'widgets/tarjeta_cosecha.dart';

/// Inicio: resumen del cultivo activo sin tener que navegar a otra pantalla (HU-01).
class InicioScreen extends StatefulWidget {
  const InicioScreen({super.key});

  @override
  State<InicioScreen> createState() => _InicioScreenState();
}

class _InicioScreenState extends State<InicioScreen> {
  final _repositorio = const RepositorioCultivo(PlataformaEjemplo());
  late final Future<EstadoCultivo?> _estado = _repositorio.estadoActual('camila');

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<EstadoCultivo?>(
      future: _estado,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }
        final estado = snapshot.data;
        if (estado == null) {
          return const Center(child: Text('Aún no tienes una siembra activa'));
        }
        return _Resumen(estado: estado);
      },
    );
  }
}

class _Resumen extends StatelessWidget {
  const _Resumen({required this.estado});

  final EstadoCultivo estado;

  @override
  Widget build(BuildContext context) {
    final cultivo = estado.cultivo;
    final texto = Theme.of(context).textTheme;
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
      children: [
        Text('Buenos días, Camila', style: texto.bodyMedium?.copyWith(color: AppColores.tintaSecundaria)),
        Text('Tu cultivo', style: texto.headlineSmall?.copyWith(fontWeight: FontWeight.w700)),
        const SizedBox(height: 16),
          if (estado.reportePendiente) ...[
            AvisoReportePendiente(ultimoReporte: cultivo.ultimoReporte.fecha),
            const SizedBox(height: 14),
          ],
        Card(
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Row(
              children: [
                AnilloAvance(avance: cultivo.avance),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(cultivo.producto, style: texto.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
                      Text('${cultivo.lote} · ${cultivo.finca}, ${cultivo.municipio}',
                          style: texto.bodySmall?.copyWith(color: AppColores.tintaSecundaria)),
                      const SizedBox(height: 8),
                      Text('Etapa ${cultivo.etapa.numero} de 5 · ${cultivo.etapa.nombre}',
                          style: texto.bodyMedium?.copyWith(fontWeight: FontWeight.w600)),
                      Text(estado.reportePendiente
                          ? 'Último estado confirmado el ${Fechas.corta(cultivo.ultimoReporte.fecha)}'
                          : 'En ${cultivo.etapa.nombre.toLowerCase()} desde el ${Fechas.conDia(cultivo.etapaDesde)}',
                          style: texto.bodySmall?.copyWith(color: AppColores.tintaSecundaria)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
          const SizedBox(height: 14),
          TarjetaCosecha(cultivo: cultivo),
        const SizedBox(height: 14),
        Card(
          child: ListTile(
            leading: const CircleAvatar(
              backgroundColor: AppColores.acentoSuave,
              child: Icon(Icons.person_outline, color: AppColores.acento),
            ),
            title: Text('${cultivo.ultimoReporte.agricultor}, tu agricultor · ${Fechas.momento(cultivo.ultimoReporte.fecha)}'),
            subtitle: Text('“${cultivo.ultimoReporte.nota}”'),
          ),
        ),
        const SizedBox(height: 10),
        Text('Actualizado ${Fechas.momento(cultivo.ultimoReporte.fecha)} · plataforma SiembraCo',
            style: texto.bodySmall?.copyWith(color: AppColores.tintaSecundaria)),
          const SizedBox(height: 18),
          const SelloLegal(revision: '15 sep 2026'),
      ],
    );
  }
}
