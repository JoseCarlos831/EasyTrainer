// lib/src/services/workout_service.dart

import 'package:flutter/material.dart';
import '../models/workout_model.dart';
import '../services/workout_service.dart';

class WorkoutProvider with ChangeNotifier {
  final WorkoutService _workoutService = WorkoutService();

  List<WorkoutModel> _userWorkouts = [];
  bool _isLoading = false;

  List<WorkoutModel> get userWorkouts => _userWorkouts;
  bool get isLoading => _isLoading;

  Future<void> fetchUserWorkouts(int userId, String token) async {
    print('[WorkoutProvider] Iniciando busca de workouts...');
    _isLoading = true;
    notifyListeners();

    _userWorkouts = await _workoutService.getWorkoutsByUserId(userId, token);

    print('[WorkoutProvider] Workouts carregados: ${_userWorkouts.length}');
    _isLoading = false;
    notifyListeners();
  }
}
