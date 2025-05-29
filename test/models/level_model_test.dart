import 'package:flutter_test/flutter_test.dart';
import 'package:personalapp/src/models/level_model.dart';

void main() {
  group('LevelModel Test', () {
    final mockJson = {
      'id': 1,
      'name': 'Beginner',
      'description': 'Entry level for new users',
    };

    test('Deve criar uma instância de LevelModel corretamente', () {
      final level = LevelModel(
        id: 1,
        name: 'Beginner',
        description: 'Entry level for new users',
      );

      expect(level, isA<LevelModel>());
      expect(level.id, 1);
      expect(level.name, 'Beginner');
      expect(level.description, 'Entry level for new users');
    });

    test('Deve converter de JSON para LevelModel corretamente', () {
      final level = LevelModel.fromJson(mockJson);

      expect(level.id, 1);
      expect(level.name, 'Beginner');
      expect(level.description, 'Entry level for new users');
    });

    test('Deve converter LevelModel para JSON corretamente', () {
      final level = LevelModel.fromJson(mockJson);
      final json = level.toJson();

      expect(json['id'], 1);
      expect(json['name'], 'Beginner');
      expect(json['description'], 'Entry level for new users');
    });
  });
}
