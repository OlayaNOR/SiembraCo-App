/// Formato corto de fechas en español, sin dependencias externas.
abstract final class Fechas {
  static const _meses = ['ene', 'feb', 'mar', 'abr', 'may', 'jun', 'jul', 'ago', 'sep', 'oct', 'nov', 'dic'];
  static const _dias = ['lun', 'mar', 'mié', 'jue', 'vie', 'sáb', 'dom'];

  /// `9 sep`
  static String corta(DateTime f) => '${f.day} ${_meses[f.month - 1]}';

  /// `mié 9 sep`
  static String conDia(DateTime f) => '${_dias[f.weekday - 1]} ${corta(f)}';

  /// `14 – 18 oct`, o `30 sep – 4 oct` si cambia el mes.
  static String rango(DateTime desde, DateTime hasta) =>
      desde.month == hasta.month ? '${desde.day} – ${corta(hasta)}' : '${corta(desde)} – ${corta(hasta)}';

  /// `hoy 7:40` o `20 sep, 16:10`
  static String momento(DateTime f, {DateTime? ahora}) {
    final ref = ahora ?? DateTime.now();
    final hora = '${f.hour}:${f.minute.toString().padLeft(2, '0')}';
    final mismoDia = f.year == ref.year && f.month == ref.month && f.day == ref.day;
    return mismoDia ? 'hoy $hora' : '${corta(f)}, $hora';
  }
}
