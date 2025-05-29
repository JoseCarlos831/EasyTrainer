import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:personalapp/src/services/workout_service.dart';
import 'package:personalapp/src/models/workout_model.dart';

import 'workout_service_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late MockClient mockClient;
  late WorkoutService workoutService;

  const token = 'test-token';
  const baseUrl = 'http://localhost:3000/api';

  setUp(() {
    mockClient = MockClient();
    workoutService = WorkoutService(
      httpClient: mockClient,
      baseUrl: baseUrl,
    );
  });

  group('WorkoutService', () {
    test('getWorkoutsByUserId retorna lista de WorkoutModel quando sucesso', () async {
      final userId = 1;
      final url = Uri.parse('$baseUrl/Workout/user/$userId');

      final mockResponse = {
  'success': true,
  'data': {
    'data': [
      {
        'id': 1,
        'name': 'Treino A',
        'description': 'Treino para membros superiores',
        'numberOfDays': 5,
        'imageUrl': 'https://exemplo.com/treino-a.png',
        'duration': '01:00:00',
        'indoor': true,
        'instructorId': 10,
        'levelId': 2,
        'goalIds': [1, 2],
        'typeIds': [3],
        'modalityIds': [1],
        'hashtagIds': [5, 6]
      },
      {
        'id': 2,
        'name': 'Treino B',
        'description': 'Treino funcional',
        'numberOfDays': 3,
        'imageUrl': 'https://exemplo.com/treino-b.png',
        'duration': '00:45:00',
        'indoor': false,
        'instructorId': 11,
        'levelId': 3,
        'goalIds': [3],
        'typeIds': [2, 4],
        'modalityIds': [2],
        'hashtagIds': [4]
      }
    ]
  }
};


      when(mockClient.get(
        url,
        headers: anyNamed('headers'),
      )).thenAnswer((_) async => http.Response(jsonEncode(mockResponse), 200));

      final result = await workoutService.getWorkoutsByUserId(userId, token);

      expect(result, isA<List<WorkoutModel>>());
      expect(result.length, 2);
      expect(result.first.name, equals('Treino A'));
    });

    test('getWorkoutsByUserId retorna lista vazia se erro ou dados faltando', () async {
      final userId = 1;
      final url = Uri.parse('$baseUrl/Workout/user/$userId');

      when(mockClient.get(
        url,
        headers: anyNamed('headers'),
      )).thenAnswer((_) async => http.Response('Erro', 500));

      final result = await workoutService.getWorkoutsByUserId(userId, token);

      expect(result, isEmpty);
    });
  });
}
