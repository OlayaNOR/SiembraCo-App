/// Estado de un indicador de buenas prácticas agrícolas en la última visita.
enum EstadoBpa { cumple, enRevision }

/// Indicador de buenas prácticas agrícolas (BPA) verificado en la finca (HU-08).
///
/// Lo registra el equipo de calidad agrícola en la plataforma; la app solo lo muestra.
class IndicadorBpa {
  const IndicadorBpa({required this.nombre, required this.estado, required this.verificado});

  final String nombre;
  final EstadoBpa estado;

  /// Fecha de la verificación, o desde cuándo está en revisión.
  final DateTime verificado;
}
