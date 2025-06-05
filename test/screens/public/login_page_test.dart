// test/screens/public/login_page_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personalapp/src/screens/public/login_page.dart';
import 'package:personalapp/l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  Widget createTestWidget() {
    return MaterialApp(
      home: const LoginPage(),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('pt'), Locale('en')],
      locale: const Locale('pt'), 
    );
  }

  group('LoginPage - em Português', () {
    testWidgets('Exibe erro quando campos estão vazios', (tester) async {
      await tester.pumpWidget(createTestWidget());

      await tester.tap(find.text('Entrar'));
      await tester.pumpAndSettle();

      expect(find.text('Por favor, preencha o campo Email'), findsOneWidget);
      expect(find.text('Por favor, digite sua senha'), findsOneWidget);
    });

    testWidgets('Exibe erro para email inválido', (tester) async {
      await tester.pumpWidget(createTestWidget());

      await tester.enterText(find.byType(TextFormField).first, 'invalido');
      await tester.enterText(find.byType(TextFormField).last, '123456');
      await tester.tap(find.text('Entrar'));
      await tester.pumpAndSettle();

      expect(find.text('Digite um email válido'), findsOneWidget);
    });

    testWidgets('Não exibe erro com dados válidos', (tester) async {
      await tester.pumpWidget(createTestWidget());

      await tester.enterText(find.byType(TextFormField).first, 'user@teste.com');
      await tester.enterText(find.byType(TextFormField).last, '123456');
      await tester.tap(find.text('Entrar'));
      await tester.pumpAndSettle();

      expect(find.text('Por favor, preencha o campo Email'), findsNothing);
      expect(find.text('Por favor, digite sua senha'), findsNothing);
      expect(find.text('Digite um email válido'), findsNothing);
    });
  });
}
