import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:personalapp/l10n/app_localizations.dart';
import 'package:personalapp/src/screens/private/analytics_page.dart';

void main() {
  testWidgets('Renderiza tela AnalyticsPage', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: const AnalyticsPage(),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'),
          Locale('pt'),
        ],
        locale: const Locale('en'),
      ),
    );

    await tester.pump();

    expect(find.byType(AnalyticsPage), findsOneWidget);
  });
}
