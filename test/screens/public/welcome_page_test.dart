import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:personalapp/l10n/app_localizations.dart';
import 'package:personalapp/src/screens/public/welcome_page.dart';

void main() {
  testWidgets('WelcomePage renderiza corretamente', (WidgetTester tester) async {
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
        home: WelcomePage(),
      ),
    );

    // Verifica se os elementos principais estão na tela
    expect(find.byType(WelcomePage), findsOneWidget);
    expect(find.text('Bem-vindo ao EasyTrainer'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsNWidgets(2));

    // Verifica se os botões estão presentes com o texto correto
    expect(find.widgetWithText(ElevatedButton, 'Entrar'), findsOneWidget);
    expect(find.widgetWithText(ElevatedButton, 'Cadastrar-se'), findsOneWidget);
  });
}
