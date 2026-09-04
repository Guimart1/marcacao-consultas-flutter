import 'package:flutter_test/flutter_test.dart';
import 'package:marcacao_consultas_flutter/main.dart';

void main() {
  testWidgets('Smoke test HomeScreen', (WidgetTester tester) async {
    await tester.pumpWidget(const MarcacaoConsultasApp());
    expect(find.text('Sistema de Consultas'), findsOneWidget);
  });
}
