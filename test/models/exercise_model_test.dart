import 'package:flutter_test/flutter_test.dart';
import 'package:personalapp/src/models/exercise_model.dart';

void main() {
  group('ExerciseModel Test', () {
    // Dados simulados (mock) para o teste
    final mockJson = {
      'id': 1,
      'name': 'Push Up',
      'description': 'An upper body strength exercise',
      'videoUrl': 'https://example.com/pushup.mp4',
      'imageUrl': 'https://example.com/pushup.png'
    };

    test('Deve criar uma instância de ExerciseModel corretamente', () {
      final exercise = ExerciseModel(
        id: 1,
        name: 'Push Up',
        description: 'An upper body strength exercise',
        videoUrl: 'https://example.com/pushup.mp4',
        imageUrl: 'https://example.com/pushup.png', instructorId: 1, levelId: 1, goalIds: [], typeIds: [], modalityIds: [], hashtagIds: [], variationIds: [],
      );

      expect(exercise, isA<ExerciseModel>());
      expect(exercise.name, 'Push Up');
    });

    test('Deve converter de JSON para ExerciseModel corretamente', () {
      final exercise = ExerciseModel.fromJson(mockJson);

      expect(exercise.id, 1);
      expect(exercise.name, 'Push Up');
      expect(exercise.description, 'An upper body strength exercise');
      expect(exercise.videoUrl, 'https://example.com/pushup.mp4');
      expect(exercise.imageUrl, 'https://example.com/pushup.png');
    });

    test('Deve converter ExerciseModel para JSON corretamente', () {
      final exercise = ExerciseModel.fromJson(mockJson);
      final json = exercise.toJson();

      expect(json['id'], 1);
      expect(json['name'], 'Push Up');
      expect(json['description'], 'An upper body strength exercise');
      expect(json['videoUrl'], 'https://example.com/pushup.mp4');
      expect(json['imageUrl'], 'https://example.com/pushup.png');
    });
  });
}
