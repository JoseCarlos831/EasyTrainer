import 'package:flutter_test/flutter_test.dart';
import 'package:personalapp/src/models/exercise_model.dart';
import 'package:personalapp/src/providers/exercise_provider.dart';
import 'package:personalapp/src/services/exercise_service.dart';

// Simulação manual de um ExerciseService fake (sem mockito)
class FakeExerciseService extends ExerciseService {
  @override
  Future<List<ExerciseModel>> getExercisesByWorkoutId(
      int workoutId, int instructorId, String token) async {
    return [
      ExerciseModel(
  id: 1,
  name: 'Push Up',
  description: 'Push-up exercise',
  videoUrl: '',
  imageUrl: '',
  instructorId: 1,
  levelId: 1,
  goalIds: [1],
  typeIds: [1],
  modalityIds: [1],
  hashtagIds: [1],
  variationIds:[1]
),

    ];
  }

  @override
  Future<List<ExerciseModel>> getExercisesByRoutineId(
      int routineId, int instructorId, String token) async {
    return [
      ExerciseModel(
  id: 2,
  name: 'Squat',
  description: 'Squat exercise',
  videoUrl: '',
  imageUrl: '',
  instructorId: 1,
  levelId: 1,
  goalIds: [1],
  typeIds: [1],
  modalityIds: [1],
  hashtagIds: [1],
  variationIds:[1]
),

    ];
  }

  @override
  Future<List<ExerciseModel>> getExercisesByModalityId(
      int modalityId, String token) async {
    return [
       ExerciseModel(
  id: 2,
  name: 'burpee',
  description: 'burpee exercise',
  videoUrl: '',
  imageUrl: '',
  instructorId: 1,
  levelId: 1,
  goalIds: [1],
  typeIds: [1],
  modalityIds: [1],
  hashtagIds: [1],
  variationIds:[1]
),
    ];
  }
}

void main() {
  late ExerciseProvider provider;

  setUp(() {
    provider = ExerciseProvider(exerciseService: FakeExerciseService());
  });

  test('Deve iniciar com estado limpo', () {
    expect(provider.allExercises, isEmpty);
    expect(provider.isLoading, false);
  });

  test('Deve carregar exercícios por workoutId', () async {
    await provider.fetchExercisesByWorkoutId(1, 99, 'token');

    final list = provider.getExercisesForWorkout(1);
    expect(list.length, 1);
    expect(list.first.name, 'Push Up');
    expect(provider.isLoading, false);
  });

  test('Deve carregar exercícios por routineId', () async {
    await provider.fetchExercisesByRoutineId(2, 88, 'token');

    final list = provider.getExercisesForRoutine(2);
    expect(list.length, 1);
    expect(list.first.name, 'Squat');
  });

  test('Deve carregar exercícios por modalityId', () async {
    await provider.fetchExercisesByModalityId(3, 'token');

    final list = provider.getExercisesForModality(3);
    expect(list.length, 1);
    expect(list.first.name, 'Burpee');
  });

  test('Deve limpar os exercícios corretamente', () {
    provider.clear();
    expect(provider.allExercises, isEmpty);
    expect(provider.isLoading, false);
  });
}
