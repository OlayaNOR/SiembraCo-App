import 'package:flutter_test/flutter_test.dart';
import 'package:siembraco_app/core/utils/moneda.dart';

void main() {
  group('HU-12 ninguna cifra sin unidad', () {
    test('separa los miles con punto y agrega la moneda', () {
      expect(Moneda.pesos(168000), '\$ 168.000 COP');
      expect(Moneda.pesos(1250000), '\$ 1.250.000 COP');
      expect(Moneda.pesos(900), '\$ 900 COP');
    });

    test('calcula el precio por kilo redondeado al peso', () {
      expect(Moneda.porUnidad(168000, 12), '\$ 14.000 COP / kg');
      expect(Moneda.porUnidad(100000, 3), '\$ 33.333 COP / kg');
    });
  });
}
