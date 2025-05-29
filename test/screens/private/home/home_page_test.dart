import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personalapp/src/screens/private/home/home_page.dart';
import 'package:personalapp/src/providers/auth_provider.dart';
import 'package:personalapp/src/providers/exercise_provider.dart';
import 'package:personalapp/src/providers/modality_provider.dart';
import 'package:personalapp/src/providers/user_provider.dart';
import 'package:personalapp/src/providers/workout_provider.dart';
import 'package:provider/provider.dart';
import 'package:personalapp/l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
Widget createHomePage() {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AuthProvider()),
      ChangeNotifierProvider(create: (_) => ExerciseProvider()),
      ChangeNotifierProvider(create: (_) => ModalityProvider()),
      ChangeNotifierProvider(create: (_) => UserProvider()),
      ChangeNotifierProvider(create: (_) => WorkoutProvider()),
    ],
    child: MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en'), Locale('pt')],
      home: const HomePage(),
      routes: {
        '/login': (context) => const Scaffold(body: Text('Login Page')),
      },
    ),
  );
}

  testWidgets('HomePage renderiza corretamente', (WidgetTester tester) async {
    await tester.pumpWidget(createHomePage());
    await tester.pump(const Duration(seconds: 2)); // aguarda _initialLoad

    expect(find.byType(HomePage), findsOneWidget);
    expect(find.byType(Scaffold), findsOneWidget);
  });
}
