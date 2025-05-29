import 'package:flutter_test/flutter_test.dart';
import 'package:personalapp/src/models/goal_model.dart';

void main() {
  group('GoalModel Test', () {
    // Dados simulados (mock) para o teste
    final mockJson = {
      'id': 1,
      'name': 'Weight Loss',
      'description': 'Goal focused on losing weight',
    };

    test('Deve criar uma instância de GoalModel corretamente', () {
      final goal = GoalModel(
        id: 1,
        name: 'Weight Loss',
        description: 'Goal focused on losing weight',
      );

      expect(goal, isA<GoalModel>());
      expect(goal.id, 1);
      expect(goal.name, 'Weight Loss');
      expect(goal.description, 'Goal focused on losing weight');
    });

    test('Deve converter de JSON para GoalModel corretamente', () {
      final goal = GoalModel.fromJson(mockJson);

      expect(goal.id, 1);
      expect(goal.name, 'Weight Loss');
      expect(goal.description, 'Goal focused on losing weight');
    });

    test('Deve converter GoalModel para JSON corretamente', () {
      final goal = GoalModel.fromJson(mockJson);
      final json = goal.toJson();

      expect(json['id'], 1);
      expect(json['name'], 'Weight Loss');
      expect(json['description'], 'Goal focused on losing weight');
    });
  });
}
