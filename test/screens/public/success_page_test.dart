import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:personalapp/l10n/app_localizations.dart';
import 'package:personalapp/src/screens/public/success_page.dart';

void main() {
  testWidgets('SuccessPage renderiza corretamente', (WidgetTester tester) async {
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
        home: SuccessPage(),
      ),
    );

    // Verifica se a tela foi carregada
    expect(find.byType(SuccessPage), findsOneWidget);

    // Verifica textos principais
    expect(find.text('Cadastro realizado com sucesso!'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
  });
}
