import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:personalapp/src/widgets/main_navigation.dart';
import 'package:personalapp/l10n/app_localizations.dart';

class FakePage extends StatelessWidget {
  final String label;
  const FakePage(this.label, {super.key});

  @override
  Widget build(BuildContext context) => Text(label, key: Key(label));
}

void main() {
  testWidgets('Alterna entre páginas no BottomNavigationBar', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [Locale('en')],
        home: MainNavigation(
          pages: const [
            FakePage('Página Home'),
            FakePage('Página Analytics'),
            FakePage('Página Perfil'),
          ],
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Página Home'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.analytics_outlined));
    await tester.pumpAndSettle();
    expect(find.text('Página Analytics'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.person));
    await tester.pumpAndSettle();
    expect(find.text('Página Perfil'), findsOneWidget);
  });
}
