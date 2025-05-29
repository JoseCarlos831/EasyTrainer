import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:personalapp/src/providers/user_provider.dart';
import 'package:personalapp/src/providers/auth_provider.dart';
import 'package:personalapp/src/screens/private/edit_profile_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:personalapp/l10n/app_localizations.dart';

void main() {
  testWidgets('Renderiza campos e simula preenchimento e salvamento', (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => UserProvider()),
          ChangeNotifierProvider(create: (_) => AuthProvider()),
        ],
        child: MaterialApp(
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
          locale: const Locale('pt'),
          home: const EditProfilePage(),
        ),
      ),
    );

    await tester.pump(); // Garante renderização completa

    // Verifica quantidade de campos de texto
    expect(find.byType(TextFormField), findsNWidgets(6));

    // Verifica botão "Atualizar"
    final local = AppLocalizations.of(tester.element(find.byType(EditProfilePage)))!;
    expect(find.widgetWithText(OutlinedButton, local.editProfilePage_updateButton), findsOneWidget);
  });
}
