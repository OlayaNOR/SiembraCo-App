/// Formato de valores en pesos colombianos, siempre con su unidad (HU-12).
abstract final class Moneda {
  /// `$ 168.000 COP`
  static String pesos(int valor) => '\$ ${_miles(valor)} COP';

  /// Precio de una unidad redondeado al peso: `$ 14.000 COP / kg`.
  static String porUnidad(int total, double cantidad, {String unidad = 'kg'}) =>
      '\$ ${_miles((total / cantidad).round())} COP / $unidad';

  static String _miles(int valor) {
    final digitos = valor.abs().toString();
    final buffer = StringBuffer(valor < 0 ? '-' : '');
    for (var i = 0; i < digitos.length; i++) {
      if (i > 0 && (digitos.length - i) % 3 == 0) buffer.write('.');
      buffer.write(digitos[i]);
    }
    return buffer.toString();
  }
}
