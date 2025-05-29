import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:personalapp/src/services/auth_service.dart';
import 'package:personalapp/src/config/env.dart';

void main() {
  group('AuthService', () {
    late AuthService authService;

    setUp(() {
      // Override the API base URL if needed
      Env.apiBaseUrl = 'http://localhost:3000'; // ou algo falso/mocado
      authService = AuthService();
    });

    test('login retorna mapa de dados quando resposta for 200', () async {
      final service = AuthService();
      final client = MockClient((request) async {
        expect(request.method, 'POST');
        expect(request.url.toString(), '${Env.apiBaseUrl}/auth/login');

        return http.Response(
          jsonEncode({'token': 'abc123', 'user': {'id': 1}}),
          200,
        );
      });

      http.Client original = http.Client;
      http.Client = client;

      final result = await service.login('test@example.com', '123456', 'user');
      expect(result, isNotNull);
      expect(result!['token'], 'abc123');

      http.Client = original;
    });

    test('signup retorna sucesso em caso de resposta 200', () async {
      final client = MockClient((request) async {
        return http.Response(jsonEncode({'success': true, 'message': 'OK'}), 200);
      });

      final originalClient = http.Client;
      http.Client = client;

      final result = await authService.signup(
        AccountType.user,
        {'email': 'user@example.com', 'password': '123456'},
      );

      expect(result['success'], true);
      expect(result['message'], 'OK');

      http.Client = originalClient;
    });

    test('validateToken retorna true se status for 200', () async {
      final client = MockClient((request) async {
        expect(request.headers['Authorization'], 'Bearer valid-token');
        return http.Response('', 200);
      });

      final originalClient = http.Client;
      http.Client = client;

      final result = await authService.validateToken('valid-token');
      expect(result, true);

      http.Client = originalClient;
    });

    test('saveToken e getToken armazenam e retornam corretamente', () async {
      SharedPreferences.setMockInitialValues({});
      await authService.saveToken('abc123');
      final token = await authService.getToken();
      expect(token, 'abc123');
    });

    test('saveUserData e getUserData armazenam e retornam corretamente', () async {
      SharedPreferences.setMockInitialValues({});
      final user = {'id': 1, 'name': 'José'};
      await authService.saveUserData(user);
      final result = await authService.getUserData();
      expect(result!['name'], 'José');
    });

    test('logout remove token e user dos SharedPreferences', () async {
      SharedPreferences.setMockInitialValues({
        'token': 'abc123',
        'user': jsonEncode({'id': 1})
      });
      await authService.logout();

      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getString('token'), isNull);
      expect(prefs.getString('user'), isNull);
    });

    test('isLoggedIn retorna true se token existir', () async {
      SharedPreferences.setMockInitialValues({'token': 'abc123'});
      final result = await authService.isLoggedIn();
      expect(result, true);
    });

    test('isLoggedIn retorna false se token não existir', () async {
      SharedPreferences.setMockInitialValues({});
      final result = await authService.isLoggedIn();
      expect(result, false);
    });
  });
}
