import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personalapp/src/models/user_model.dart';
import 'package:personalapp/src/providers/auth_provider.dart';
import 'package:personalapp/src/providers/exercise_provider.dart';
import 'package:personalapp/src/providers/modality_provider.dart';
import 'package:personalapp/src/providers/user_provider.dart';
import 'package:personalapp/src/screens/private/profile_page.dart';
import 'package:personalapp/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class MockUserProvider extends UserProvider {
  @override
  final user = UserModel(
    id: 1,
    name: 'Test User',
    email: 'test@example.com',
    birthday: DateTime(1995, 5, 20),
    mobileNumber: '+5511988887777',
    weight: 70,
    height: 1.75,
    levelId: 1,
    goalIds: [], 
    age: 18, 
    gender: 'female', 
    instructorIds: [1],
  );

  @override
  void clear() {}
}

void main() {
  testWidgets('Renderiza ProfileScreen e verifica componentes principais', (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<UserProvider>.value(value: MockUserProvider()),
          ChangeNotifierProvider(create: (_) => AuthProvider()),
          ChangeNotifierProvider(create: (_) => ExerciseProvider()),
          ChangeNotifierProvider(create: (_) => ModalityProvider()),
        ],
        child: MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: const [Locale('pt')],
          locale: const Locale('pt'),
          home: const ProfileScreen(),
        ),
      ),
    );

    await tester.pump(); // Renderiza

    expect(find.text('Perfil'), findsOneWidget);
    expect(find.text('Test User'), findsOneWidget);
    expect(find.text('test@example.com'), findsOneWidget);

    // Verifica botões
    expect(find.text('Editar Perfil'), findsOneWidget);
    expect(find.text('Configurações'), findsOneWidget);
    expect(find.text('Sair'), findsOneWidget);
  });
}
