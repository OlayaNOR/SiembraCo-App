/// Condiciones de la siembra virtual tal como se fijaron al comprar en la plataforma.
///
/// Son de solo lectura: la app las muestra pero nunca las modifica (RNF-02).
class SiembraContratada {
  const SiembraContratada({
    required this.producto,
    required this.cantidadKg,
    required this.precioPagado,
    required this.entregaDesde,
    required this.entregaHasta,
    required this.ciudadEntrega,
  });

  final String producto;
  final double cantidadKg;

  /// Precio pagado en pesos colombianos.
  final int precioPagado;

  final DateTime entregaDesde;
  final DateTime entregaHasta;
  final String ciudadEntrega;
}
