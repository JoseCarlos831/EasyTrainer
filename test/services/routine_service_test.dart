import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:personalapp/src/services/routine_service.dart';
import 'package:personalapp/src/models/routine_model.dart';

import 'routine_service_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late MockClient mockClient;
  late RoutineService routineService;

  const token = 'test-token';
  const baseUrl = 'http://localhost:3000/api';

  setUp(() {
    mockClient = MockClient();
    routineService = RoutineService(
      httpClient: mockClient,
      baseUrl: baseUrl,
    );
  });

  group('RoutineService', () {
    test('getRoutinesByWorkoutId retorna lista quando sucesso true', () async {
      final workoutId = 1;
      final instructorId = 2;
      final url = Uri.parse('$baseUrl/Workout/$workoutId/routines?instructorId=$instructorId');

      final mockResponse = {
  'success': true,
  'data': {
    'data': [
      {
        'id': 1,
        'name': 'Rotina A',
        'description': 'Treino completo de força',
        'duration': '00:45:00',
        'imageUrl': 'https://exemplo.com/forca.png',
        'instructorId': 10,
        'levelId': 2,
        'goalIds': [1, 2],
        'typeIds': [3],
        'modalityIds': [1],
        'hashtagIds': [5, 6]
      },
      {
        'id': 2,
        'name': 'Rotina de Resistência',
        'description': 'Melhore seu cardio',
        'duration': '00:30:00',
        'imageUrl': 'https://exemplo.com/cardio.png',
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

      final result = await routineService.getRoutinesByWorkoutId(workoutId, instructorId, token);

      expect(result, isA<List<RoutineModel>>());
      expect(result.length, 2);
      expect(result.first.name, 'Rotina A');
    });

    test('getRoutinesByWorkoutId retorna lista vazia se resposta inválida', () async {
      final workoutId = 1;
      final instructorId = 2;
      final url = Uri.parse('$baseUrl/Workout/$workoutId/routines?instructorId=$instructorId');

      when(mockClient.get(
        url,
        headers: anyNamed('headers'),
      )).thenAnswer((_) async => http.Response('Erro', 500));

      final result = await routineService.getRoutinesByWorkoutId(workoutId, instructorId, token);

      expect(result, isEmpty);
    });
  });
}
