/// Etapas del ciclo de un cultivo, en orden.
enum EtapaCultivo {
  siembra('Siembra'),
  germinacion('Germinación'),
  crecimiento('Crecimiento'),
  floracion('Floración y cuajado'),
  cosecha('Cosecha programada');

  const EtapaCultivo(this.nombre);

  final String nombre;

  /// Número de la etapa, empezando en 1.
  int get numero => index + 1;

  static int get total => EtapaCultivo.values.length;
}
