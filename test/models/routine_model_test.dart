import 'package:flutter_test/flutter_test.dart';
import 'package:personalapp/src/models/routine_model.dart';

void main() {
  group('RoutineModel Test', () {
    final mockJson = {
      'id': 1,
      'name': 'Full Body Routine',
      'description': 'Routine designed for full body workout',
      'levelId': 2,
      'instructorId': 5,
      'duration': 'PT1H', 
      'goalIds': [3],
      'typeIds': [7],
      'modalityIds': [4],
      'hashtagIds': [8, 9],
    };

    test('Deve criar uma instância de RoutineModel corretamente', () {
      final routine = RoutineModel(
        id: 1,
        name: 'Full Body Routine',
        description: 'Routine designed for full body workout',
        levelId: 2,
        instructorId: 5,
        duration: Duration(minutes: 60),
        goalIds: [3],
        typeIds: [7],
        modalityIds: [4],
        hashtagIds: [8, 9],
      );

      expect(routine, isA<RoutineModel>());
      expect(routine.id, 1);
      expect(routine.name, 'Full Body Routine');
      expect(routine.description, 'Routine designed for full body workout');
      expect(routine.levelId, 2);
      expect(routine.instructorId, 5);
      expect(routine.duration, 60);
      expect(routine.goalIds, contains(3));
      expect(routine.typeIds, contains(7));
      expect(routine.modalityIds, contains(4));
      expect(routine.hashtagIds, containsAll([8, 9]));
    });

    test('Deve converter de JSON para RoutineModel corretamente', () {
      final routine = RoutineModel.fromJson(mockJson);

      expect(routine.id, 1);
      expect(routine.name, 'Full Body Routine');
      expect(routine.description, 'Routine designed for full body workout');
      expect(routine.levelId, 2);
      expect(routine.instructorId, 5);
      expect(routine.duration, Duration(minutes: 60),);
      expect(routine.goalIds, contains(3));
      expect(routine.typeIds, contains(7));
      expect(routine.modalityIds, contains(4));
      expect(routine.hashtagIds, containsAll([8, 9]));
    });

    test('Deve converter RoutineModel para JSON corretamente', () {
      final routine = RoutineModel.fromJson(mockJson);
      final json = routine.toJson();

      expect(json['id'], 1);
      expect(json['name'], 'Full Body Routine');
      expect(json['description'], 'Routine designed for full body workout');
      expect(json['levelId'], 2);
      expect(json['instructorId'], 5);
      expect(json['duration'], Duration(minutes: 60),);
      expect(json['goalIds'], contains(3));
      expect(json['typeIds'], contains(7));
      expect(json['modalityIds'], contains(4));
      expect(json['hashtagIds'], containsAll([8, 9]));
    });
  });
}
