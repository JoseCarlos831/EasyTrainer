import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personalapp/l10n/app_localizations.dart';
import 'package:personalapp/src/screens/public/initializing_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  testWidgets('InitializingScreen renderiza corretamente',
      (WidgetTester tester) async {
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
        home: InitializingScreen(),
      ),
    );

    // Espera o loading e exibe animação/texto
    expect(find.byType(InitializingScreen), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
