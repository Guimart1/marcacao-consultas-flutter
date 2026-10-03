import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marcacao_consultas_flutter/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('Smoke test HomeScreen e ConsultaCard', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(800, 1800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    SharedPreferences.setMockInitialValues({});
    await tester.pumpWidget(const MarcacaoConsultasApp());
    await tester.pumpAndSettle();

    expect(find.text('Sistema de Consultas'), findsOneWidget);
    expect(find.text('AGENDADA'), findsNWidgets(2));
    expect(find.text('CONFIRMADA'), findsOneWidget);
    expect(find.text('Carlos Andrade'), findsOneWidget);
    expect(find.text('Dr. Roberto Silva'), findsNWidgets(2));
    expect(find.text('Confirmar'), findsNWidgets(2));
    expect(find.text('Cancelar'), findsNWidgets(2));
    expect(find.text('Ver Detalhes'), findsNWidgets(3));

    final botaoConfirmarCarlos = find.text('Confirmar').first;
    await tester.ensureVisible(botaoConfirmarCarlos);
    await tester.tap(botaoConfirmarCarlos);
    await tester.pumpAndSettle();

    expect(find.text('CONFIRMADA'), findsNWidgets(2));
    expect(find.text('AGENDADA'), findsOneWidget);
    expect(find.text('Consulta confirmada com sucesso!'), findsNWidgets(2));
    expect(find.text('Confirmar'), findsOneWidget);
  });
}
