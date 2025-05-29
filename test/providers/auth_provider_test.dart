import 'package:flutter_test/flutter_test.dart';
import 'package:personalapp/src/providers/auth_provider.dart';

void main() {
  group('AuthProvider Test', () {
    late AuthProvider authProvider;

    setUp(() {
      authProvider = AuthProvider();
    });

    test('Deve iniciar não autenticado', () {
      expect(authProvider.isAuthenticated, false);
      expect(authProvider.token, isNull);
    });

    test('Deve autenticar com login simulado', () async {
      await authProvider.login('user@example.com', '123456');

      expect(authProvider.isAuthenticated, true);
      expect(authProvider.token, isNotNull);
    });

    test('Deve realizar logout corretamente', () {
      authProvider.logout();

      expect(authProvider.isAuthenticated, false);
      expect(authProvider.token, isNull);
    });
  });
}
