import '../models/alerta.dart';
import '../models/cultivo.dart';
import '../models/finca.dart';

/// Acceso a la plataforma de siembra virtual existente (RNF-01).
///
/// La app solo lee: no crea, edita ni borra información de la plataforma,
/// y nunca modifica precios ni acuerdos con agricultores (RNF-02).
abstract interface class PlataformaSiembraCo {
  /// Cultivo activo del cliente, o `null` si no tiene ninguna siembra activa.
  Future<Cultivo?> cultivoActivo(String clienteId);

  Future<Finca> fincaDelCultivo(String cultivoId);

  Future<List<Alerta>> historialAlertas(String clienteId);
}
