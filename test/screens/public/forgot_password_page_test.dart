import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personalapp/l10n/app_localizations.dart';
import 'package:personalapp/src/screens/public/forgot_password_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
 testWidgets('ForgotPasswordPage renderiza corretamente', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [Locale('pt')],
        home: ForgotPasswordPage(),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Recuperar Senha'), findsOneWidget); // ajuste esse texto conforme a versão .arb
  });

  testWidgets('Campo de e-mail aceita entrada e botão pode ser pressionado', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [Locale('en'), Locale('pt')],
        home: ForgotPasswordPage(),
      ),
    );

    await tester.pumpAndSettle();

    final emailField = find.byType(TextFormField);
    final button = find.byType(ElevatedButton);

    await tester.enterText(emailField, 'teste@email.com');
    expect(find.text('teste@email.com'), findsOneWidget);

    await tester.tap(button);
    await tester.pump(); // processa o onPressed
  });
}
