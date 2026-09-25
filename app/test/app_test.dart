import 'package:flutter_test/flutter_test.dart';
import 'package:siembraco_app/main.dart';

void main() {
  testWidgets('la app arranca', (tester) async {
    await tester.pumpWidget(const SiembraCoApp());
    expect(find.byType(SiembraCoApp), findsOneWidget);
  });
}
