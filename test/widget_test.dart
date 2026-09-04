import 'package:flutter_test/flutter_test.dart';
import 'package:marcacao_consultas_flutter/main.dart';

void main() {
  testWidgets('Smoke test HomeScreen e ConsultaCard', (WidgetTester tester) async {
    await tester.pumpWidget(const MarcacaoConsultasApp());
    expect(find.text('Sistema de Consultas'), findsOneWidget);
    expect(find.text('AGENDADA'), findsOneWidget);
    expect(find.text('Carlos Andrade'), findsOneWidget);
    expect(find.text('Dr. Roberto Silva'), findsOneWidget);
    expect(find.text('Confirmar'), findsOneWidget);
    expect(find.text('Cancelar'), findsOneWidget);

    await tester.ensureVisible(find.text('Confirmar'));
    await tester.tap(find.text('Confirmar'));
    await tester.pump();

    expect(find.text('CONFIRMADA'), findsOneWidget);
    expect(find.text('Consulta confirmada com sucesso!'), findsOneWidget);
    expect(find.text('Confirmar'), findsNothing);
  });
}
