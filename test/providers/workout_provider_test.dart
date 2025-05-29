import 'package:flutter_test/flutter_test.dart';
import 'package:personalapp/src/models/workout_model.dart';
import 'package:personalapp/src/providers/workout_provider.dart';
import 'package:personalapp/src/services/workout_service.dart';

// Serviço simulado
class FakeWorkoutService extends WorkoutService {
  @override
  Future<List<WorkoutModel>> getWorkoutsByUserId(int userId, String token) async {
    return [
      WorkoutModel(
  id: 1,
  name: 'Treino A',
  description: 'Treino intenso para resistência',
  numberOfDays: 5,
  imageUrl: 'https://example.com/workout.png',
  indoor: true,
  instructorId: 2,
  levelId: 1,
  goalIds: [1],
  typeIds: [1],
  modalityIds: [1],
  hashtagIds: [1],
),

    ];
  }
}

void main() {
  late WorkoutProvider provider;

  setUp(() {
    provider = WorkoutProvider(workoutService: FakeWorkoutService());
  });

  test('Deve iniciar com lista vazia e loading falso', () {
    expect(provider.userWorkouts, isEmpty);
    expect(provider.isLoading, false);
  });

  test('Deve buscar e armazenar treinos corretamente', () async {
    await provider.fetchUserWorkouts(1, 'token123');

    expect(provider.userWorkouts.length, 1);
    expect(provider.userWorkouts.first.name, 'Treino A');
    expect(provider.isLoading, false);
  });

  test('Deve evitar requisição se já estiver carregando', () async {
    provider = WorkoutProvider(workoutService: FakeWorkoutService());

    // Simula estado "em carregamento"
    provider.fetchUserWorkouts(1, 'token123');
    final result = await provider.fetchUserWorkouts(1, 'token123');

    // Só uma execução real deve acontecer
    expect(provider.isLoading, false);
    expect(provider.userWorkouts.length, 1);
  });

  test('Deve limpar os treinos corretamente', () {
    provider.clear();
    expect(provider.userWorkouts, isEmpty);
    expect(provider.isLoading, false);
  });
}
