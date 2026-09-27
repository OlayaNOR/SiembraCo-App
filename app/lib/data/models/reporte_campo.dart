/// Reporte de avance enviado por el agricultor aliado a la plataforma.
class ReporteCampo {
  const ReporteCampo({
    required this.agricultor,
    required this.fecha,
    required this.nota,
  });

  final String agricultor;
  final DateTime fecha;
  final String nota;
}
