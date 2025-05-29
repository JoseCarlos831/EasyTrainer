
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personalapp/l10n/app_localizations.dart';
import 'package:personalapp/src/screens/public/check_you_email.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  testWidgets('VerifyEmailPage renderiza corretamente', (WidgetTester tester) async {
  await tester.pumpWidget(
    const MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [Locale('en'), Locale('pt')],
      home: VerifyEmailPage(),
    ),
  );

  await tester.pumpAndSettle();

  expect(find.textContaining('Verifique'), findsOneWidget); // Título (pt)
    expect(find.textContaining('reenviar'), findsOneWidget); // Link de reenvio
    expect(find.byType(TextField), findsNWidgets(4)); // Campos de código
    expect(find.byType(ElevatedButton), findsOneWidget); // Botão continuar
  });
}
