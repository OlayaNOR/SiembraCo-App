/// Finca asignada donde se ejecuta la siembra virtual.
class Finca {
  const Finca({
    required this.nombre,
    required this.municipio,
    required this.departamento,
    required this.altitudMetros,
    required this.agricultor,
    required this.cultivosDelAgricultor,
    required this.bpaVerificadas,
  });

  final String nombre;
  final String municipio;
  final String departamento;
  final int altitudMetros;
  final String agricultor;
  final int cultivosDelAgricultor;

  /// Fecha de la última verificación de buenas prácticas agrícolas (HU-08).
  final DateTime bpaVerificadas;
}
