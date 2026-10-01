import '../models/alerta.dart';
import '../models/cultivo.dart';
import '../models/finca.dart';
import '../models/siembra_contratada.dart';

/// Acceso a la plataforma de siembra virtual existente (RNF-01).
///
/// La app solo lee: no crea, edita ni borra información de la plataforma,
/// y nunca modifica precios ni acuerdos con agricultores (RNF-02).
abstract interface class PlataformaSiembraCo {
  /// Cultivo activo del cliente, o `null` si no tiene ninguna siembra activa.
  Future<Cultivo?> cultivoActivo(String clienteId);

  Future<Finca> fincaDelCultivo(String cultivoId);

  /// Precio, cantidad y entrega fijados al comprar. Solo lectura (RNF-02).
  Future<SiembraContratada> siembraContratada(String cultivoId);

  Future<List<Alerta>> historialAlertas(String clienteId);
}
