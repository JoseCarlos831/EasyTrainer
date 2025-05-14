// lib/src/services/exercise_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;

import '../config/env.dart';
import '../models/exercise_model.dart';

class ExerciseService {
  final String _baseUrl = Env.apiBaseUrl;

  Future<List<ExerciseModel>> getExercisesByWorkoutId(
    int workoutId,
    int instructorId,
    String token,
  ) async {
    if (workoutId <= 0 || instructorId <= 0) {
      print(
        '[ExerciseService] workoutId=$workoutId ou instructorId=$instructorId inválido, ignorando chamada.',
      );
      return [];
    }

    final url = Uri.parse(
      '$_baseUrl/Exercise/workout/$workoutId?instructorId=$instructorId',
    );
    print('[ExerciseService] Requisição: $url');

    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      print('[ExerciseService] Status: ${response.statusCode}');
      print('[ExerciseService] Body: ${response.body}');

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json['success'] == true && json['data']?['data'] != null) {
          final List<dynamic> items = json['data']['data'];
          return items.map((e) => ExerciseModel.fromJson(e)).toList();
        }
      }
    } catch (e) {
      print('[ExerciseService] Erro: $e');
    }

    return [];
  }

  Future<List<ExerciseModel>> getExercisesByRoutineId(
    int routineId,
    int instructorId,
    String token,
  ) async {
    if (routineId <= 0 || instructorId <= 0) {
      print(
        '[ExerciseService] routineId=$routineId ou instructorId=$instructorId inválido, ignorando chamada.',
      );
      return [];
    }

    final url = Uri.parse(
      '$_baseUrl/Exercise/routine/$routineId?instructorId=$instructorId',
    );
    print('[ExerciseService] Requisição: $url');

    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      print('[ExerciseService] Status: ${response.statusCode}');
      print('[ExerciseService] Body: ${response.body}');

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json['success'] == true && json['data']?['data'] != null) {
          final List<dynamic> items = json['data']['data'];
          return items.map((e) => ExerciseModel.fromJson(e)).toList();
        }
      }
    } catch (e) {
      print('[ExerciseService] Erro: $e');
    }

    return [];
  }
}
