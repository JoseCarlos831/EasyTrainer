import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personalapp/src/widgets/password_text_field.dart';

void main() {
  group('PasswordTextField Widget', () {
    testWidgets('Renderiza com hintText e ícone de visibilidade',
        (WidgetTester tester) async {
      final controller = TextEditingController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PasswordTextField(
              hintText: 'Digite sua senha',
              controller: controller,
            ),
          ),
        ),
      );

      // Verifica se o hintText está visível
      expect(find.text('Digite sua senha'), findsOneWidget);

      // Verifica se há um ícone de visibilidade
      expect(find.byIcon(Icons.visibility_off), findsOneWidget);

      // Toca no ícone para trocar visibilidade
      await tester.tap(find.byIcon(Icons.visibility_off));
      await tester.pump();

      // Agora o ícone deve ser visibility
      expect(find.byIcon(Icons.visibility), findsOneWidget);
    });
  });
}
