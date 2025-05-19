// lib/src/providers/routine_provider.dart

import 'package:flutter/material.dart';
import '../models/routine_model.dart';
import '../services/routine_service.dart';

class RoutineProvider with ChangeNotifier {
  final RoutineService _routineService = RoutineService();

  final Map<int, List<RoutineModel>> _routinesByWorkout = {};
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<RoutineModel> getRoutinesForWorkout(int workoutId) =>
      _routinesByWorkout[workoutId] ?? [];

  void clear() {
    _routinesByWorkout.clear();
    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchRoutinesByWorkoutId(
    int workoutId,
    int instructorId,
    String token,
  ) async {
    print(
      '[RoutineProvider] fetchRoutinesByWorkoutId: workoutId=$workoutId, instructorId=$instructorId',
    );
    _isLoading = true;
    notifyListeners();

    final routines = await _routineService.getRoutinesByWorkoutId(
      workoutId,
      instructorId,
      token,
    );

    _routinesByWorkout[workoutId] = routines;
    print('[RoutineProvider] Rotinas carregadas: ${routines.length}');
    _isLoading = false;
    notifyListeners();
  }
}
