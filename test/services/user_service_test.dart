import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:personalapp/src/services/user_service.dart';
import 'package:personalapp/src/models/user_model.dart';

import 'user_service_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late MockClient mockClient;
  late UserService userService;

  setUp(() {
    mockClient = MockClient();
    userService = UserService(
      httpClient: mockClient,
      baseUrl: 'http://localhost:3000/api',
    );
  });

  group('UserService', () {
    final user = UserModel(
      id: 1,
      name: 'Test User',
      email: 'test@example.com',
      birthday: DateTime(1990, 1, 1),
      weight: 70.0,
      height: 175.0,
      mobileNumber: '11999999999',
      levelId: 1,
      goalIds: [],
      age: 34,
      gender: 'male',
      instructorIds: [],
    );

    const token = 'test-token';

    test('updateUser retorna true com status 200', () async {
      final url = Uri.parse('http://localhost:3000/api/user/${user.id}');

      when(mockClient.put(
        url,
        headers: anyNamed('headers'),
        body: jsonEncode(user.toJson()),
      )).thenAnswer((_) async => http.Response('', 200));

      final result = await userService.updateUser(user, token);
      expect(result, isTrue);
    });

    test('changePassword retorna true com status 200', () async {
      final url = Uri.parse('http://localhost:3000/api/user/${user.id}/password');

      when(mockClient.put(
        url,
        headers: anyNamed('headers'),
        body: jsonEncode({
          'currentPassword': '123456',
          'newPassword': 'abcdef',
        }),
      )).thenAnswer((_) async => http.Response('', 200));

      final result = await userService.changePassword(
        userId: user.id!,
        currentPassword: '123456',
        newPassword: 'abcdef',
        token: token,
      );

      expect(result, isTrue);
    });

    test('deleteAccount retorna true com status 200', () async {
      final url = Uri.parse('http://localhost:3000/api/user/${user.id}');

      when(mockClient.delete(
        url,
        headers: anyNamed('headers'),
      )).thenAnswer((_) async => http.Response('', 200));

      final result = await userService.deleteAccount(user.id!, token);
      expect(result, isTrue);
    });
  });
}
