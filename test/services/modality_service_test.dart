import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:personalapp/src/services/modality_service.dart';
import 'package:personalapp/src/models/modality_model.dart';

import 'modality_service_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late MockClient mockClient;
  late ModalityService modalityService;

  const token = 'test-token';
  const baseUrl = 'http://localhost:3000/api';

  setUp(() {
    mockClient = MockClient();
    modalityService = ModalityService(
      httpClient: mockClient,
      baseUrl: baseUrl,
    );
  });

  group('ModalityService', () {
    test('fetchModalities retorna lista quando sucesso', () async {
      final url = Uri.parse('$baseUrl/Modality');

      final mockResponse = {
        'success': true,
        'data': {
          'data': [
            {
              'id': 1,
              'name': 'Musculação',
              'description': 'Treino com pesos'
            },
            {
              'id': 2,
              'name': 'Cardio',
              'description': 'Atividades aeróbicas'
            }
          ]
        }
      };

      when(mockClient.get(
        url,
        headers: anyNamed('headers'),
      )).thenAnswer((_) async => http.Response(jsonEncode(mockResponse), 200));

      final result = await modalityService.fetchModalities(token);

      expect(result, isA<List<ModalityModel>>());
      expect(result.length, 2);
      expect(result.first.name, equals('Musculação'));
    });

    test('fetchById retorna ModalityModel quando sucesso', () async {
      final id = 1;
      final url = Uri.parse('$baseUrl/Modality/$id');

      final mockResponse = {
        'id': 1,
        'name': 'Musculação',
        'description': 'Treino com pesos'
      };

      when(mockClient.get(
        url,
        headers: anyNamed('headers'),
      )).thenAnswer((_) async => http.Response(jsonEncode({'data': mockResponse}), 200));

      final result = await modalityService.fetchById(id, token);

      expect(result, isNotNull);
      expect(result!.name, equals('Musculação'));
    });

    test('fetchModalities retorna lista vazia se erro', () async {
      final url = Uri.parse('$baseUrl/Modality');

      when(mockClient.get(
        url,
        headers: anyNamed('headers'),
      )).thenAnswer((_) async => http.Response('Erro', 500));

      final result = await modalityService.fetchModalities(token);

      expect(result, isEmpty);
    });

    test('fetchById retorna null se erro', () async {
      final url = Uri.parse('$baseUrl/Modality/1');

      when(mockClient.get(
        url,
        headers: anyNamed('headers'),
      )).thenAnswer((_) async => http.Response('Erro', 500));

      final result = await modalityService.fetchById(1, token);

      expect(result, isNull);
    });
  });
}
