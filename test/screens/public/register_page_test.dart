import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:personalapp/l10n/app_localizations.dart';
import 'package:personalapp/src/screens/public/register_page.dart';

void main() {
  testWidgets('RegisterPage renderiza corretamente', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('en'),
          Locale('pt'),
        ],
        home: RegisterPage(),
      ),
    );

    // Verificações básicas de renderização
    expect(find.byType(RegisterPage), findsOneWidget);

    // Textos principais
    expect(find.text('Criar Conta'), findsOneWidget); // ou use local.verifyEmailPage_title
    expect(find.byType(TextFormField), findsNWidgets(5)); // nome, email, celular, senha, confirmar senha
    expect(find.byType(ElevatedButton), findsOneWidget);
  });
}
