import 'package:flutter/material.dart';

import '../../core/theme/app_colores.dart';
import '../../core/utils/fechas.dart';
import '../../core/utils/moneda.dart';
import '../../core/widgets/sello_legal.dart';
import '../../data/models/finca.dart';
import '../../data/models/indicador_bpa.dart';
import '../../data/models/siembra_contratada.dart';
import '../../data/plataforma/plataforma_ejemplo.dart';
import '../../data/plataforma/plataforma_siembraco.dart';

/// Finca asignada, condiciones de la siembra y buenas prácticas agrícolas (HU-02, HU-08, RNF-02).
///
/// Precio, cantidad y entrega se muestran tal como vienen de la plataforma:
/// la pantalla no tiene ningún control para editarlos.
class FincaScreen extends StatefulWidget {
  const FincaScreen({super.key, this.plataforma = const PlataformaEjemplo()});

  final PlataformaSiembraCo plataforma;

  @override
  State<FincaScreen> createState() => _FincaScreenState();
}

class _FincaScreenState extends State<FincaScreen> {
  late final Future<(Finca, SiembraContratada)> _datos = _cargar();

  /// Las dos consultas son independientes, así que se lanzan a la vez en lugar
  /// de esperar una antes de pedir la otra: el tiempo de carga pasa de la suma
  /// de ambas al de la más lenta.
  Future<(Finca, SiembraContratada)> _cargar() {
    return (widget.plataforma.fincaDelCultivo('lote-14'), widget.plataforma.siembraContratada('lote-14')).wait;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<(Finca, SiembraContratada)>(
      future: _datos,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        final (finca, siembra) = snapshot.data!;
        return _Contenido(finca: finca, siembra: siembra);
      },
    );
  }
}

class _Contenido extends StatelessWidget {
  const _Contenido({required this.finca, required this.siembra});

  final Finca finca;
  final SiembraContratada siembra;

  @override
  Widget build(BuildContext context) {
    final texto = Theme.of(context).textTheme;
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
      children: [
        Text('Finca asignada', style: texto.headlineSmall?.copyWith(fontWeight: FontWeight.w700)),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.verified_outlined, size: 18, color: AppColores.acento),
                    const SizedBox(width: 6),
                    Text(
                      'Buenas prácticas agrícolas verificadas · ${Fechas.corta(finca.bpaVerificadas)}',
                      style: texto.bodySmall?.copyWith(color: AppColores.acentoOscuro),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(finca.nombre, style: texto.titleLarge?.copyWith(fontWeight: FontWeight.w700)),
                Text(
                  '${finca.municipio}, ${finca.departamento} · ${finca.altitudMetros} m',
                  style: texto.bodyMedium?.copyWith(color: AppColores.tintaSecundaria),
                ),
                const Divider(height: 24),
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: AppColores.acentoSuave,
                      child: Icon(Icons.person_outline, color: AppColores.acento),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(finca.agricultor, style: texto.titleSmall?.copyWith(fontWeight: FontWeight.w600)),
                        Text(
                          'Agricultor aliado · ${finca.cultivosDelAgricultor} cultivos',
                          style: texto.bodySmall?.copyWith(color: AppColores.tintaSecundaria),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 14),
        _TarjetaSiembra(siembra: siembra),
        if (finca.indicadoresBpa.isNotEmpty) ...[
          const SizedBox(height: 14),
          _TarjetaBpa(indicadores: finca.indicadoresBpa),
        ],
        const SizedBox(height: 18),
        const SelloLegal(revision: '15 sep 2026'),
      ],
    );
  }
}

/// Condiciones de la siembra. Solo texto: ningún campo editable (RNF-02).
class _TarjetaSiembra extends StatelessWidget {
  const _TarjetaSiembra({required this.siembra});

  final SiembraContratada siembra;

  @override
  Widget build(BuildContext context) {
    final texto = Theme.of(context).textTheme;
    final cantidad = siembra.cantidadKg.toStringAsFixed(1).replaceAll('.', ',');
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('Tu siembra virtual', style: texto.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
                const Spacer(),
                const Icon(Icons.lock_outline, size: 16, color: AppColores.tintaSecundaria),
                const SizedBox(width: 4),
                Text('Precio fijado', style: texto.bodySmall?.copyWith(color: AppColores.tintaSecundaria)),
              ],
            ),
            const SizedBox(height: 12),
            _Fila(etiqueta: 'Producto', valor: siembra.producto),
            _Fila(etiqueta: 'Cantidad contratada', valor: '$cantidad kg'),
            _Fila(etiqueta: 'Precio pagado', valor: Moneda.pesos(siembra.precioPagado)),
            _Fila(
              etiqueta: 'Precio por kilo (referencia)',
              valor: Moneda.porUnidad(siembra.precioPagado, siembra.cantidadKg),
            ),
            _Fila(
              etiqueta: 'Entrega estimada',
              valor:
                  '${Fechas.rango(siembra.entregaDesde, siembra.entregaHasta, conAnio: true)} · ${siembra.ciudadEntrega}',
            ),
            const SizedBox(height: 10),
            Text(
              'Precio y cantidad fijados al comprar en la plataforma SiembraCo; la cosecha real no los cambia.',
              style: texto.bodySmall?.copyWith(color: AppColores.tintaSecundaria),
            ),
          ],
        ),
      ),
    );
  }
}

/// Indicadores de buenas prácticas agrícolas de la finca, cada uno con su fecha (HU-08).
class _TarjetaBpa extends StatelessWidget {
  const _TarjetaBpa({required this.indicadores});

  final List<IndicadorBpa> indicadores;

  @override
  Widget build(BuildContext context) {
    final texto = Theme.of(context).textTheme;
    final cumplen = indicadores.where((i) => i.estado == EstadoBpa.cumple).length;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Buenas prácticas agrícolas', style: texto.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
            const SizedBox(height: 2),
            Text(
              '$cumplen de ${indicadores.length} indicadores cumplen',
              style: texto.bodySmall?.copyWith(color: AppColores.tintaSecundaria),
            ),
            const SizedBox(height: 8),
            for (final indicador in indicadores) _FilaBpa(indicador: indicador),
            const SizedBox(height: 6),
            Text(
              'Verificación del equipo de calidad agrícola de SiembraCo en la finca.',
              style: texto.bodySmall?.copyWith(color: AppColores.tintaSecundaria),
            ),
          ],
        ),
      ),
    );
  }
}

class _FilaBpa extends StatelessWidget {
  const _FilaBpa({required this.indicador});

  final IndicadorBpa indicador;

  @override
  Widget build(BuildContext context) {
    final texto = Theme.of(context).textTheme;
    final cumple = indicador.estado == EstadoBpa.cumple;
    final color = cumple ? AppColores.acentoOscuro : AppColores.aviso;
    final estado = cumple
        ? 'Cumple · verificado ${Fechas.corta(indicador.verificado)}'
        : 'En revisión desde ${Fechas.corta(indicador.verificado)}';
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(cumple ? Icons.check_circle_outline : Icons.schedule, size: 18, color: color),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(indicador.nombre, style: texto.bodyMedium?.copyWith(fontWeight: FontWeight.w600)),
                Text(estado, style: texto.bodySmall?.copyWith(color: color)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Fila extends StatelessWidget {
  const _Fila({required this.etiqueta, required this.valor});

  final String etiqueta;
  final String valor;

  @override
  Widget build(BuildContext context) {
    final texto = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            child: Text(etiqueta, style: texto.bodyMedium?.copyWith(color: AppColores.tintaSecundaria)),
          ),
          Text(valor, style: texto.bodyMedium?.copyWith(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
