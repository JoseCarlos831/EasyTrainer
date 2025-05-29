import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:personalapp/src/services/exercise_service.dart';
import 'package:personalapp/src/models/exercise_model.dart';

import 'exercise_service_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late MockClient mockClient;
  late ExerciseService exerciseService;

  const token = 'test-token';
  const baseUrl = 'http://localhost:3000/api';

  setUp(() {
    mockClient = MockClient();
    exerciseService = ExerciseService(
      httpClient: mockClient,
      baseUrl: baseUrl,
    );
  });

  group('ExerciseService', () {
    test('getExercisesByWorkoutId retorna lista quando status 200 e sucesso true', () async {
      final workoutId = 1;
      final instructorId = 2;
      final url = Uri.parse('$baseUrl/Exercise/workout/$workoutId?instructorId=$instructorId');
final mockResponse = {
  'success': true,
  'data': {
    'data': [
      {
        'id': 1,
        'name': 'Flexão',
        'description': 'Exercício de peito',
        'duration': 30
      },
      {
        'id': 2,
        'name': 'Agachamento',
        'description': 'Exercício de perna',
        'duration': 45
      }
    ]
  }
};


      when(mockClient.get(
        url,
        headers: anyNamed('headers'),
      )).thenAnswer((_) async => http.Response(jsonEncode(mockResponse), 200));

      final result = await exerciseService.getExercisesByWorkoutId(workoutId, instructorId, token);

      expect(result, isA<List<ExerciseModel>>());
      expect(result.length, 2);
    });

    test('getExercisesByRoutineId retorna lista quando sucesso', () async {
      final routineId = 1;
      final instructorId = 2;
      final url = Uri.parse('$baseUrl/Exercise/routine/$routineId?instructorId=$instructorId');

      final mockResponse = {
        'success': true,
        'data': {
          'data': [
            {'id': 3, 'name': 'Burpee'}
          ]
        }
      };

      when(mockClient.get(
        url,
        headers: anyNamed('headers'),
      )).thenAnswer((_) async => http.Response(jsonEncode(mockResponse), 200));

      final result = await exerciseService.getExercisesByRoutineId(routineId, instructorId, token);

      expect(result, isA<List<ExerciseModel>>());
      expect(result.first.name, 'Burpee');
    });

    test('getExercisesByModalityId retorna lista vazia se falha', () async {
      final modalityId = 10;
      final url = Uri.parse('$baseUrl/Exercise/modality/$modalityId');

      when(mockClient.get(
        url,
        headers: anyNamed('headers'),
      )).thenAnswer((_) async => http.Response('Erro interno', 500));

      final result = await exerciseService.getExercisesByModalityId(modalityId, token);

      expect(result, isEmpty);
    });
  });
}
