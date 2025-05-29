import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:personalapp/src/services/auth_service.dart';
import 'auth_service_test.mocks.dart'; // Importação do mock gerado

@GenerateMocks([http.Client])
void main() {
  late MockClient mockClient;
  late AuthService authService;

  setUp(() {
    mockClient = MockClient();
    authService = AuthService(
      httpClient: mockClient,
      baseUrl: 'http://localhost:3000/api',
    );
  });

  group('AuthService', () {
    test('login retorna dados válidos quando status 200', () async {
      final responseBody = jsonEncode({'token': 'abc123', 'user': {'name': 'José'}});

      when(mockClient.post(
        Uri.parse('http://localhost:3000/api/auth/login'),
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      )).thenAnswer((_) async => http.Response(responseBody, 200));

      final result = await authService.login('jose@email.com', 'senha123', 'user');

      expect(result, isNotNull);
      expect(result!['token'], equals('abc123'));
    });
  });
}
