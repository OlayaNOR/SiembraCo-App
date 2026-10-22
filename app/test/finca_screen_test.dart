import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:siembraco_app/features/finca/finca_screen.dart';

void main() {
  Future<void> abrir(WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: Scaffold(body: FincaScreen())));
    await tester.pump(const Duration(seconds: 1));
    await tester.pumpAndSettle();
  }

  testWidgets('muestra la finca y las condiciones de la siembra (HU-02)', (tester) async {
    await abrir(tester);
    expect(find.text('Finca La Esperanza'), findsOneWidget);
    expect(find.text('3,0 kg'), findsOneWidget);
    expect(find.text('\$ 48.000 COP'), findsOneWidget);
  });

  testWidgets('muestra el precio por kilo de referencia con su unidad (HU-12)', (tester) async {
    await abrir(tester);
    expect(find.text('Precio por kilo (referencia)'), findsOneWidget);
    expect(find.text('\$ 16.000 COP / kg'), findsOneWidget);
  });

  testWidgets('muestra la entrega con el año y la ciudad (HU-12)', (tester) async {
    await abrir(tester);
    expect(find.text('15 – 19 oct 2026 · Bogotá'), findsOneWidget);
  });

  testWidgets('muestra cada indicador de buenas prácticas con su fecha de verificación (HU-08)', (tester) async {
    tester.view.physicalSize = const Size(1080, 2600);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await abrir(tester);
    expect(find.text('Buenas prácticas agrícolas'), findsOneWidget);
    expect(find.text('3 de 4 indicadores cumplen'), findsOneWidget);
    expect(find.text('Uso seguro de agroquímicos'), findsOneWidget);
    expect(find.text('Cumple · verificado 3 sep'), findsNWidgets(3));
    expect(find.text('Manejo de residuos de cosecha'), findsOneWidget);
    expect(find.text('En revisión desde 10 oct'), findsOneWidget);
  });

  testWidgets('no permite editar precio, cantidad ni condiciones (RNF-02)', (tester) async {
    await abrir(tester);
    expect(find.byType(TextField), findsNothing);
    expect(find.byType(TextFormField), findsNothing);
    expect(find.byType(Slider), findsNothing);
  });
}
