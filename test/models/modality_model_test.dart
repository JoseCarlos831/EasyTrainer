import 'package:flutter_test/flutter_test.dart';
import 'package:personalapp/src/models/modality_model.dart';

void main() {
  group('ModalityModel Test', () {
    final mockJson = {
      'id': 1,
      'name': 'Crossfit',
      'description': 'High-intensity functional training',
    };

    test('Deve criar uma instância de ModalityModel corretamente', () {
      final modality = ModalityModel(
        id: 1,
        name: 'Crossfit',
        description: 'High-intensity functional training',
      );

      expect(modality, isA<ModalityModel>());
      expect(modality.id, 1);
      expect(modality.name, 'Crossfit');
      expect(modality.description, 'High-intensity functional training');
    });

    test('Deve converter de JSON para ModalityModel corretamente', () {
      final modality = ModalityModel.fromJson(mockJson);

      expect(modality.id, 1);
      expect(modality.name, 'Crossfit');
      expect(modality.description, 'High-intensity functional training');
    });

    test('Deve converter ModalityModel para JSON corretamente', () {
      final modality = ModalityModel.fromJson(mockJson);
      final json = modality.toJson();

      expect(json['id'], 1);
      expect(json['name'], 'Crossfit');
      expect(json['description'], 'High-intensity functional training');
    });
  });
}
