import '../models/alerta.dart';
import '../models/cultivo.dart';
import '../models/etapa_cultivo.dart';
import '../models/finca.dart';
import '../models/reporte_campo.dart';
import 'plataforma_siembraco.dart';

/// Respuesta de ejemplo de la plataforma, con los datos del caso.
/// Reemplaza la integración real mientras se simula.
class PlataformaEjemplo implements PlataformaSiembraCo {
  const PlataformaEjemplo({this.reporteAtrasado = false, this.sinSiembra = false});

  /// Simula que el agricultor no ha reportado en más de 48 h (excepción 1 del BPMN).
  final bool reporteAtrasado;

  /// Simula un cliente sin siembra activa.
  final bool sinSiembra;

  static const _latencia = Duration(milliseconds: 300);

  @override
  Future<Cultivo?> cultivoActivo(String clienteId) async {
    await Future<void>.delayed(_latencia);
    if (sinSiembra) return null;
    return Cultivo(
      id: 'lote-14',
      producto: 'Tomate cherry orgánico',
      lote: 'Lote 14',
      finca: 'Finca La Esperanza',
      municipio: 'Fresno',
      etapa: EtapaCultivo.crecimiento,
      etapaDesde: DateTime(2026, 9, 9),
      avance: reporteAtrasado ? 0.60 : 0.64,
      cosechaDesde: DateTime(2026, 10, 14),
      cosechaHasta: DateTime(2026, 10, 18),
      cosechaAnterior: (DateTime(2026, 10, 12), DateTime(2026, 10, 16)),
      motivoCambioCosecha: 'lluvias sobre el promedio en la segunda semana de septiembre',
      ultimoReporte: ReporteCampo(
        agricultor: 'Ernesto',
        fecha: reporteAtrasado ? DateTime.now().subtract(const Duration(days: 3)) : DateTime.now(),
        nota: 'Plantas sanas, ya con los primeros racimos. Esta semana empezamos el tutorado.',
      ),
    );
  }

  @override
  Future<Finca> fincaDelCultivo(String cultivoId) async {
    await Future<void>.delayed(_latencia);
    return Finca(
      nombre: 'Finca La Esperanza',
      municipio: 'Fresno',
      departamento: 'Tolima',
      altitudMetros: 1450,
      agricultor: 'Ernesto Ramírez',
      cultivosDelAgricultor: 14,
      bpaVerificadas: DateTime(2026, 9, 3),
    );
  }

  @override
  Future<List<Alerta>> historialAlertas(String clienteId) async {
    await Future<void>.delayed(_latencia);
    return [
      Alerta(
        tipo: TipoAlerta.reporteCampo,
        titulo: 'Reporte de campo recibido',
        cuerpo: 'Ernesto envió fotos y notas del lote 14.',
        fecha: DateTime.now(),
      ),
      Alerta(
        tipo: TipoAlerta.cambioCosecha,
        titulo: 'Fecha de cosecha ajustada',
        cuerpo: 'Ahora 14 – 18 oct (antes 12 – 16 oct). Motivo: lluvias en la zona.',
        fecha: DateTime(2026, 9, 20),
      ),
      Alerta(
        tipo: TipoAlerta.validacionLegal,
        titulo: 'Información del lote validada',
        cuerpo: 'Legal SiembraCo revisó los textos sanitarios de tu cultivo.',
        fecha: DateTime(2026, 9, 15),
      ),
      Alerta(
        tipo: TipoAlerta.cambioEtapa,
        titulo: 'Tu cultivo pasó a Crecimiento',
        cuerpo: 'Etapa 3 de 5. La planta empieza a formar racimos.',
        fecha: DateTime(2026, 9, 9),
      ),
    ];
  }
}
