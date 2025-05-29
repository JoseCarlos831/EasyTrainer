import 'package:flutter_test/flutter_test.dart';
import 'package:personalapp/src/models/routine_model.dart';
import 'package:personalapp/src/providers/routine_provider.dart';
import 'package:personalapp/src/services/routine_service.dart';

// Serviço falso para testes
class FakeRoutineService extends RoutineService {
  @override
  Future<List<RoutineModel>> getRoutinesByWorkoutId(
    int workoutId,
    int instructorId,
    String token,
  ) async {
    return [
      RoutineModel(
  id: 1,
  name: 'Rotina A',
  description: 'Descrição da rotina A',
  instructorId: instructorId,
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
  late RoutineProvider provider;

  setUp(() {
    provider = RoutineProvider(routineService: FakeRoutineService());
  });

  test('Deve iniciar com loading false e mapa vazio', () {
    expect(provider.isLoading, false);
    expect(provider.getRoutinesForWorkout(1), isEmpty);
  });

  test('Deve buscar e armazenar rotinas corretamente', () async {
    await provider.fetchRoutinesByWorkoutId(1, 99, 'fake-token');

    final list = provider.getRoutinesForWorkout(1);
    expect(list.length, 1);
    expect(list.first.name, 'Rotina A');
    expect(provider.isLoading, false);
  });

  test('Deve limpar todas as rotinas', () {
    provider.clear();
    expect(provider.getRoutinesForWorkout(1), isEmpty);
    expect(provider.isLoading, false);
  });
}
