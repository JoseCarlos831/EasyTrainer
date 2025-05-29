import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personalapp/src/widgets/social_login_button.dart';

void main() {
  group('SocialLoginButton Widget', () {
    testWidgets('Renderiza o ícone corretamente com a cor definida',
        (WidgetTester tester) async {
      const icon = Icons.g_mobiledata;
      const color = Colors.red;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SocialLoginButton(
              icon: icon,
              color: color,
            ),
          ),
        ),
      );

      final iconFinder = find.byIcon(icon);
      expect(iconFinder, findsOneWidget);

      final Icon iconWidget = tester.widget(iconFinder);
      expect(iconWidget.color, color);
      expect(iconWidget.size, 30);
    });
  });
}
