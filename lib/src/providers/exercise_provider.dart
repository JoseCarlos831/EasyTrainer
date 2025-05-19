import 'package:flutter/material.dart';

import '../models/exercise_model.dart';
import '../services/exercise_service.dart';

class ExerciseProvider with ChangeNotifier {
  final ExerciseService _exerciseService = ExerciseService();

  final Map<int, List<ExerciseModel>> _exercisesByWorkout = {};
  final Map<int, List<ExerciseModel>> _exercisesByRoutine = {};
  final Map<int, List<ExerciseModel>> _exercisesByModality = {};

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<ExerciseModel> get allExercises =>
      _exercisesByWorkout.values.expand((e) => e).toList();

  void clear() {
    _exercisesByWorkout.clear();
    _exercisesByRoutine.clear();
    _exercisesByModality.clear();
    _isLoading = false;
    notifyListeners();
  }

  List<ExerciseModel> getExercisesForWorkout(int workoutId) =>
      _exercisesByWorkout[workoutId] ?? [];

  List<ExerciseModel> getExercisesForRoutine(int routineId) =>
      _exercisesByRoutine[routineId] ?? [];

  List<ExerciseModel> getExercisesForModality(int modalityId) =>
      _exercisesByModality[modalityId] ?? [];

  Future<void> fetchExercisesByWorkoutId(
    int workoutId,
    int instructorId,
    String token,
  ) async {
    print(
      '[ExerciseProvider] fetchExercisesByWorkoutId: workoutId=$workoutId, instructorId=$instructorId',
    );
    _isLoading = true;
    notifyListeners();

    final exercises = await _exerciseService.getExercisesByWorkoutId(
      workoutId,
      instructorId,
      token,
    );

    _exercisesByWorkout[workoutId] = exercises;
    print('[ExerciseProvider] Exercícios recebidos: ${exercises.length}');
    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchExercisesByRoutineId(
    int routineId,
    int instructorId,
    String token,
  ) async {
    print(
      '[ExerciseProvider] fetchExercisesByRoutineId: routineId=$routineId, instructorId=$instructorId',
    );
    _isLoading = true;
    notifyListeners();

    final exercises = await _exerciseService.getExercisesByRoutineId(
      routineId,
      instructorId,
      token,
    );

    _exercisesByRoutine[routineId] = exercises;
    print('[ExerciseProvider] Exercícios recebidos: ${exercises.length}');
    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchExercisesByModalityId(int modalityId, String token) async {
    print(
      '[ExerciseProvider] fetchExercisesByModalityId: modalityId=$modalityId',
    );
    _isLoading = true;
    notifyListeners();

    final exercises = await _exerciseService.getExercisesByModalityId(
      modalityId,
      token,
    );

    _exercisesByModality[modalityId] = exercises;
    print(
      '[ExerciseProvider] Exercícios por modalidade recebidos: ${exercises.length}',
    );
    _isLoading = false;
    notifyListeners();
  }
}
