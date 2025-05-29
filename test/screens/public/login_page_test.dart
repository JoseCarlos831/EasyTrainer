import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personalapp/src/screens/public/login_page.dart';
import 'package:provider/provider.dart';

import 'package:personalapp/src/providers/auth_provider.dart';

void main() {
  testWidgets('Renderiza campos de e-mail e senha e executa login', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider<AuthProvider>(
          create: (_) => AuthProvider(),
          child: const LoginPage(),
        ),
      ),
    );

    // Verifica campos
    expect(find.byType(TextFormField), findsNWidgets(2));

    // Digita e-mail e senha
    await tester.enterText(find.byType(TextFormField).at(0), 'user@example.com');
    await tester.enterText(find.byType(TextFormField).at(1), '123456');

    // Fecha teclado virtual
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();

    // Tenta encontrar e pressionar o botão de login
    final loginButton = find.widgetWithText(ElevatedButton, 'Login');
    expect(loginButton, findsOneWidget);
    await tester.tap(loginButton);
    await tester.pump();

  });
}
