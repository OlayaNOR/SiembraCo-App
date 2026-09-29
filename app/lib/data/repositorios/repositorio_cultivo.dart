import '../models/cultivo.dart';
import '../plataforma/plataforma_siembraco.dart';

/// Lo que las pantallas necesitan saber del cultivo activo.
class EstadoCultivo {
  const EstadoCultivo({required this.cultivo, required this.reportePendiente});

  final Cultivo cultivo;

  /// El agricultor no ha reportado en más de [RepositorioCultivo.limiteReporte] (CA-1.2).
  final bool reportePendiente;
}

class RepositorioCultivo {
  const RepositorioCultivo(this._plataforma);

  final PlataformaSiembraCo _plataforma;

  static const limiteReporte = Duration(hours: 48);

  /// Devuelve `null` si el cliente no tiene una siembra activa (CA-1.3).
  Future<EstadoCultivo?> estadoActual(String clienteId, {DateTime? ahora}) async {
    final cultivo = await _plataforma.cultivoActivo(clienteId);
    if (cultivo == null) return null;
    final referencia = ahora ?? DateTime.now();
    final pendiente = referencia.difference(cultivo.ultimoReporte.fecha) > limiteReporte;
    return EstadoCultivo(cultivo: cultivo, reportePendiente: pendiente);
  }
}
