import 'package:flutter_test/flutter_test.dart';
import 'package:siembraco_app/core/utils/fechas.dart';

void main() {
  group('Fechas.rango', () {
    test('en el mismo mes muestra el mes una sola vez', () {
      expect(Fechas.rango(DateTime(2026, 10, 14), DateTime(2026, 10, 18)), '14 – 18 oct');
    });

    test('si cambia el mes muestra los dos', () {
      expect(Fechas.rango(DateTime(2026, 9, 30), DateTime(2026, 10, 4)), '30 sep – 4 oct');
    });

    test('con el año, para fechas pactadas con el cliente (HU-12)', () {
      expect(Fechas.rango(DateTime(2026, 10, 15), DateTime(2026, 10, 19), conAnio: true), '15 – 19 oct 2026');
    });
  });
}
