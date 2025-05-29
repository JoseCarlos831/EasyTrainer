import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personalapp/l10n/app_localizations.dart';
import 'package:personalapp/src/screens/private/settings_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  testWidgets('SettingsPage renderiza corretamente e contém botão de voltar', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('en'), Locale('pt')],
        home: const SettingsPage(),
      ),
    );

    expect(find.byType(SettingsPage), findsOneWidget);
    expect(find.byIcon(Icons.arrow_back_ios_new), findsOneWidget); // se o título for esse
  });
}
