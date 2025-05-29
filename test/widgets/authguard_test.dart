// test/widgets/authguard_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:personalapp/src/widgets/authguard.dart';
import 'package:personalapp/src/providers/auth_provider.dart';

import 'authguard_test.mocks.dart';

class FakeLoginPage extends StatelessWidget {
  const FakeLoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Text('Página de Login Fake');
  }
}

@GenerateMocks([AuthProvider])
void main() {
  late MockAuthProvider mockAuth;

  setUp(() {
    mockAuth = MockAuthProvider();
  });

  testWidgets('Exibe o child quando está autenticado', (WidgetTester tester) async {
    when(mockAuth.isAuthenticated).thenReturn(true);

    await tester.pumpWidget(
      ChangeNotifierProvider<AuthProvider>.value(
        value: mockAuth,
        child: const MaterialApp(
          home: AuthGuard(
            child: Text('Área Protegida'),
            fallback: FakeLoginPage(),
          ),
        ),
      ),
    );

    expect(find.text('Área Protegida'), findsOneWidget);
    expect(find.text('Página de Login Fake'), findsNothing);
  });

  testWidgets('Redireciona para FakeLoginPage quando não autenticado', (WidgetTester tester) async {
    when(mockAuth.isAuthenticated).thenReturn(false);

    await tester.pumpWidget(
      ChangeNotifierProvider<AuthProvider>.value(
        value: mockAuth,
        child: const MaterialApp(
          home: AuthGuard(
            child: Text('Área Protegida'),
            fallback: FakeLoginPage(),
          ),
        ),
      ),
    );

    expect(find.text('Página de Login Fake'), findsOneWidget);
    expect(find.text('Área Protegida'), findsNothing);
  });
}
