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

  testWidgets('no permite editar precio, cantidad ni condiciones (RNF-02)', (tester) async {
    await abrir(tester);
    expect(find.byType(TextField), findsNothing);
    expect(find.byType(TextFormField), findsNothing);
    expect(find.byType(Slider), findsNothing);
  });
}
