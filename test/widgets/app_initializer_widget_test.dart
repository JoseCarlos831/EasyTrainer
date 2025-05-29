import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:personalapp/src/widgets/app_initializer_widget.dart';
import 'package:personalapp/src/providers/auth_provider.dart';
import 'package:personalapp/src/providers/user_provider.dart';
import 'package:personalapp/src/models/user_model.dart';

import 'app_initializer_widget_test.mocks.dart';

// Use a mesma key usada no AppInitializer
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

@GenerateMocks([AuthProvider, UserProvider])
void main() {
  late MockAuthProvider mockAuth;
  late MockUserProvider mockUser;

  setUp(() {
    mockAuth = MockAuthProvider();
    mockUser = MockUserProvider();
  });

 Future<void> pumpInitializer(WidgetTester tester) async {
  await tester.pumpWidget(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>.value(value: mockAuth),
        ChangeNotifierProvider<UserProvider>.value(value: mockUser),
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        routes: {
          '/main': (_) => const Scaffold(body: Text('Main Page')),
          '/welcome': (_) => const Scaffold(body: Text('Welcome Page')),
        },
        home: const AppInitializer(),
      ),
    ),
  );

  await tester.pump(); // renderização inicial
  await tester.pump(const Duration(seconds: 1)); // aguarda async + navegação
}


  testWidgets('Redireciona para /main se token e userData forem válidos',
      (WidgetTester tester) async {
    when(mockAuth.tryAutoLogin(any)).thenAnswer((_) async {});
    when(mockAuth.token).thenReturn('token');
    when(mockAuth.userData).thenReturn({
      'id': 1,
      'name': 'Test User',
      'email': 'test@example.com',
      'birthday': '1990-01-01',
      'weight': 70.0,
      'height': 175.0,
      'mobileNumber': '11999999999',
      'levelId': 1,
      'goalIds': [],
      'age': 30,
      'gender': 'male',
      'instructorIds': [],
    });
    when(mockUser.user).thenReturn(null);

    await pumpInitializer(tester);

    expect(find.text('Main Page'), findsOneWidget);
    verify(mockUser.setUser(any as UserModel, any as String)).called(1);
  });

  testWidgets('Redireciona para /welcome se token ou userData forem nulos',
      (WidgetTester tester) async {
    when(mockAuth.tryAutoLogin(any)).thenAnswer((_) async {});
    when(mockAuth.token).thenReturn(null);
    when(mockAuth.userData).thenReturn(null);
    when(mockUser.user).thenReturn(null);

    await pumpInitializer(tester);

    expect(find.text('Welcome Page'), findsOneWidget);
    verifyNever(mockUser.setUser(any as UserModel, any as String));
  });

  testWidgets('Redireciona para /welcome em caso de erro no auto login',
      (WidgetTester tester) async {
    when(mockAuth.tryAutoLogin(any)).thenThrow(Exception('Erro simulado'));
    when(mockAuth.token).thenReturn(null);
    when(mockAuth.userData).thenReturn(null);

    await pumpInitializer(tester);

    expect(find.text('Welcome Page'), findsOneWidget);
    verifyNever(mockUser.setUser(any as UserModel, any as String));
  });
}
