import 'package:flutter_test/flutter_test.dart';
import 'package:personalapp/src/models/routine_has_exercise_model.dart';

void main() {
  group('RoutineHasExerciseModel Test', () {
    final mockJson = {
      'routineId': 100,
      'exerciseId': 200,
      'order': 1,
      'sets': 3,
      'restTime': 60,
      'reps': 12,
      'note': 'Do it with focus',
      'day': 1,
      'week': 1,
      'isOptional': false,
    };

    test('Deve criar uma instância de RoutineHasExerciseModel corretamente', () {
      final routineExercise = RoutineHasExerciseModel(
        routineId: 100,
        exerciseId: 200,
        order: 1,
        sets: 3,
        restTime: Duration(minutes: 60), 
        reps: 12,
        note: 'Do it with focus',
        day: 1,
        week: 1,
        isOptional: false,
      );

      expect(routineExercise, isA<RoutineHasExerciseModel>());
      expect(routineExercise.routineId, 100);
      expect(routineExercise.exerciseId, 200);
      expect(routineExercise.order, 1);
      expect(routineExercise.sets, 3);
      expect(routineExercise.restTime, Duration(minutes: 60));
      expect(routineExercise.reps, 12);
      expect(routineExercise.note, 'Do it with focus');
      expect(routineExercise.day, 1);
      expect(routineExercise.week, 1);
      expect(routineExercise.isOptional, false);
    });

    test('Deve converter de JSON para RoutineHasExerciseModel corretamente', () {
      final routineExercise = RoutineHasExerciseModel.fromJson(mockJson);

      expect(routineExercise.routineId, 100);
      expect(routineExercise.exerciseId, 200);
      expect(routineExercise.order, 1);
      expect(routineExercise.sets, 3);
      expect(routineExercise.restTime, Duration(minutes: 60));
      expect(routineExercise.reps, 12);
      expect(routineExercise.note, 'Do it with focus');
      expect(routineExercise.day, 1);
      expect(routineExercise.week, 1);
      expect(routineExercise.isOptional, false);
    });

    test('Deve converter RoutineHasExerciseModel para JSON corretamente', () {
      final routineExercise = RoutineHasExerciseModel.fromJson(mockJson);
      final json = routineExercise.toJson();

      expect(json['routineId'], 100);
      expect(json['exerciseId'], 200);
      expect(json['order'], 1);
      expect(json['sets'], 3);
      expect(json['restTime'], 60);
      expect(json['reps'], 12);
      expect(json['note'], 'Do it with focus');
      expect(json['day'], 1);
      expect(json['week'], 1);
      expect(json['isOptional'], false);
    });
  });
}
