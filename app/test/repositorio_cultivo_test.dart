import 'package:flutter_test/flutter_test.dart';
import 'package:siembraco_app/data/plataforma/plataforma_ejemplo.dart';
import 'package:siembraco_app/data/repositorios/repositorio_cultivo.dart';

void main() {
  test('marca el reporte como pendiente después de 48 h (CA-1.2)', () async {
    const repo = RepositorioCultivo(PlataformaEjemplo(reporteAtrasado: true));
    final estado = await repo.estadoActual('camila');
    expect(estado, isNotNull);
    expect(estado!.reportePendiente, isTrue);
  });

  test('no marca pendiente si el reporte es reciente (CA-1.1)', () async {
    const repo = RepositorioCultivo(PlataformaEjemplo());
    final estado = await repo.estadoActual('camila');
    expect(estado!.reportePendiente, isFalse);
  });

  test('devuelve null cuando no hay siembra activa (CA-1.3)', () async {
    const repo = RepositorioCultivo(PlataformaEjemplo(sinSiembra: true));
    expect(await repo.estadoActual('camila'), isNull);
  });
}
