import 'package:flutter_test/flutter_test.dart';
import 'package:personalapp/src/models/training_type_model.dart';

void main() {
  group('TrainingTypeModel Test', () {
    final mockJson = {
      'id': 1,
      'name': 'Strength Training',
      'description': 'Focus on building muscle strength',
    };

    test('Deve criar uma instância de TrainingTypeModel corretamente', () {
      final trainingType = TrainingTypeModel(
        id: 1,
        name: 'Strength Training',
        description: 'Focus on building muscle strength',
      );

      expect(trainingType, isA<TrainingTypeModel>());
      expect(trainingType.id, 1);
      expect(trainingType.name, 'Strength Training');
      expect(trainingType.description, 'Focus on building muscle strength');
    });

    test('Deve converter de JSON para TrainingTypeModel corretamente', () {
      final trainingType = TrainingTypeModel.fromJson(mockJson);

      expect(trainingType.id, 1);
      expect(trainingType.name, 'Strength Training');
      expect(trainingType.description, 'Focus on building muscle strength');
    });

    test('Deve converter TrainingTypeModel para JSON corretamente', () {
      final trainingType = TrainingTypeModel.fromJson(mockJson);
      final json = trainingType.toJson();

      expect(json['id'], 1);
      expect(json['name'], 'Strength Training');
      expect(json['description'], 'Focus on building muscle strength');
    });
  });
}
