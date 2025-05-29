import 'package:flutter_test/flutter_test.dart';
import 'package:personalapp/src/models/exercise_variation_model.dart';

void main() {
  group('ExerciseVariationModel Test', () {
    // Dados simulados (mock) para o teste
    final mockJson = {
      'id': 10,
      'exerciseId': 1,
      'name': 'Push Up with Clap',
      'description': 'A variation of push up with clap',
      'videoUrl': 'https://example.com/pushupclap.mp4',
      'imageUrl': 'https://example.com/pushupclap.png'
    };

    test('Deve criar uma instância de ExerciseVariationModel corretamente', () {
      final variation = ExerciseVariationModel(
        id: 10,
        exerciseId: 1,
        name: 'Push Up with Clap',
        description: 'A variation of push up with clap',
        videoUrl: 'https://example.com/pushupclap.mp4',
        imageUrl: 'https://example.com/pushupclap.png',
      );

      expect(variation, isA<ExerciseVariationModel>());
      expect(variation.name, 'Push Up with Clap');
    });

    test('Deve converter de JSON para ExerciseVariationModel corretamente', () {
      final variation = ExerciseVariationModel.fromJson(mockJson);

      expect(variation.id, 10);
      expect(variation.exerciseId, 1);
      expect(variation.name, 'Push Up with Clap');
      expect(variation.description, 'A variation of push up with clap');
      expect(variation.videoUrl, 'https://example.com/pushupclap.mp4');
      expect(variation.imageUrl, 'https://example.com/pushupclap.png');
    });

    test('Deve converter ExerciseVariationModel para JSON corretamente', () {
      final variation = ExerciseVariationModel.fromJson(mockJson);
      final json = variation.toJson();

      expect(json['id'], 10);
      expect(json['exerciseId'], 1);
      expect(json['name'], 'Push Up with Clap');
      expect(json['description'], 'A variation of push up with clap');
      expect(json['videoUrl'], 'https://example.com/pushupclap.mp4');
      expect(json['imageUrl'], 'https://example.com/pushupclap.png');
    });
  });
}
