import 'etapa_cultivo.dart';
import 'reporte_campo.dart';

/// Siembra virtual activa del cliente, tal como la entrega la plataforma.
class Cultivo {
  const Cultivo({
    required this.id,
    required this.producto,
    required this.lote,
    required this.finca,
    required this.municipio,
    required this.etapa,
    required this.etapaDesde,
    required this.avance,
    required this.cosechaDesde,
    required this.cosechaHasta,
    required this.ultimoReporte,
    this.cosechaAnterior,
    this.motivoCambioCosecha,
  });

  final String id;
  final String producto;
  final String lote;
  final String finca;
  final String municipio;
  final EtapaCultivo etapa;
  final DateTime etapaDesde;

  /// Avance del ciclo entre 0 y 1.
  final double avance;

  /// Ventana estimada de cosecha.
  final DateTime cosechaDesde;
  final DateTime cosechaHasta;

  /// Si la fecha de cosecha cambió, la ventana anterior y el motivo (HU-11).
  final (DateTime, DateTime)? cosechaAnterior;
  final String? motivoCambioCosecha;

  final ReporteCampo ultimoReporte;

  int get diasVentanaCosecha => cosechaHasta.difference(cosechaDesde).inDays + 1;
}
