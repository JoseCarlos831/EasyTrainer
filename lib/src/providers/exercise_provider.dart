import 'package:flutter/material.dart';

import '../models/exercise_model.dart';
import '../services/exercise_service.dart';

class ExerciseProvider with ChangeNotifier {
  final ExerciseService _exerciseService = ExerciseService();

  final Map<int, List<ExerciseModel>> _exercisesByWorkout = {};
  final Map<int, List<ExerciseModel>> _exercisesByRoutine = {};

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<ExerciseModel> getExercisesForWorkout(int workoutId) =>
      _exercisesByWorkout[workoutId] ?? [];

  List<ExerciseModel> getExercisesForRoutine(int routineId) =>
      _exercisesByRoutine[routineId] ?? [];

  Future<void> fetchExercisesByWorkoutId(
    int workoutId,
    int instructorId,
    String token,
  ) async {
    _isLoading = true;
    notifyListeners();

    final exercises = await _exerciseService.getExercisesByWorkoutId(
      workoutId,
      instructorId,
      token,
    );

    _exercisesByWorkout[workoutId] = exercises;
    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchExercisesByRoutineId(
    int routineId,
    int instructorId,
    String token,
  ) async {
    _isLoading = true;
    notifyListeners();

    final exercises = await _exerciseService.getExercisesByRoutineId(
      routineId,
      instructorId,
      token,
    );

    _exercisesByRoutine[routineId] = exercises;
    _isLoading = false;
    notifyListeners();
  }
}
