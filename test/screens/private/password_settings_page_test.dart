import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personalapp/src/screens/private/password_settings_page.dart';
import 'package:personalapp/src/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:personalapp/l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  testWidgets('PasswordSettingsPage renderiza e contém campos de senha e botão', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => UserProvider(),
        child: MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [Locale('en'), Locale('pt')],
          home: const PasswordSettingsPage(),
        ),
      ),
    );

    expect(find.byType(PasswordSettingsPage), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(3)); // Três campos de senha
    expect(find.byType(ElevatedButton), findsOneWidget);  // Botão de alterar
  });
}
