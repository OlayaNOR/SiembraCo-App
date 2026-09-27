enum TipoAlerta { cambioEtapa, reporteCampo, cambioCosecha, validacionLegal, cosecha, despacho }

/// Alerta enviada al cliente. Se conserva en el historial aunque las push estén apagadas.
class Alerta {
  const Alerta({
    required this.tipo,
    required this.titulo,
    required this.cuerpo,
    required this.fecha,
  });

  final TipoAlerta tipo;
  final String titulo;
  final String cuerpo;
  final DateTime fecha;
}
