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

  void clear() {
    _userWorkouts = [];
    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchUserWorkouts(int userId, String token) async {
    if (_isLoading) return;

    _isLoading = true;

    Future.microtask(() => notifyListeners());

    try {
      final workouts = await _workoutService.getWorkoutsByUserId(userId, token);
      _userWorkouts = workouts;
      print('[WorkoutProvider] Workouts carregados: ${_userWorkouts.length}');
    } catch (e) {
      print('[WorkoutProvider] Erro ao carregar workouts: $e');
      _userWorkouts = [];
    } finally {
      _isLoading = false;
      Future.microtask(() => notifyListeners());
    }
  }
}
