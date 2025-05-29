import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/env.dart';
import '../models/exercise_model.dart';

class ExerciseService {
  final String _baseUrl;
  final http.Client httpClient;

  ExerciseService({
    http.Client? httpClient,
    String? baseUrl,
  })  : httpClient = httpClient ?? http.Client(),
        _baseUrl = baseUrl ?? Env.apiBaseUrl;

  Future<List<ExerciseModel>> getExercisesByWorkoutId(
    int workoutId,
    int instructorId,
    String token,
  ) async {
    if (workoutId <= 0 || instructorId <= 0) return [];

    final url = Uri.parse(
      '$_baseUrl/Exercise/workout/$workoutId?instructorId=$instructorId',
    );

    try {
      final response = await httpClient.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final items = json['data']?['data'];
        if (json['success'] == true && items != null) {
          return (items as List).map((e) => ExerciseModel.fromJson(e)).toList();
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
    if (routineId <= 0 || instructorId <= 0) return [];

    final url = Uri.parse(
      '$_baseUrl/Exercise/routine/$routineId?instructorId=$instructorId',
    );

    try {
      final response = await httpClient.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final items = json['data']?['data'];
        if (json['success'] == true && items != null) {
          return (items as List).map((e) => ExerciseModel.fromJson(e)).toList();
        }
      }
    } catch (e) {
      print('[ExerciseService] Erro: $e');
    }

    return [];
  }

  Future<List<ExerciseModel>> getExercisesByModalityId(
    int modalityId,
    String token,
  ) async {
    final url = Uri.parse('$_baseUrl/Exercise/modality/$modalityId');

    try {
      final response = await httpClient.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final items = json['data']?['data'];
        if (json['success'] == true && items != null) {
          return (items as List).map((e) => ExerciseModel.fromJson(e)).toList();
        }
      }
    } catch (e) {
      print('[ExerciseService] Erro: $e');
    }

    return [];
  }
}
