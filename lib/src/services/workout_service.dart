// lib/src/services/workout_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;

import '../config/env.dart';
import '../models/workout_model.dart';

class WorkoutService {
  final String _baseUrl = Env.apiBaseUrl;

  Future<List<WorkoutModel>> getWorkoutsByUserId(
    int userId,
    String token,
  ) async {
    final url = Uri.parse('$_baseUrl/Workout/user/$userId');
    print('[WorkoutService] Requisição: $url');

    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      print('[WorkoutService] Status: ${response.statusCode}');
      print('[WorkoutService] Body: ${response.body}');

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json['success'] == true && json['data']?['data'] != null) {
          final List<dynamic> items = json['data']['data'];
          return items.map((e) => WorkoutModel.fromJson(e)).toList();
        }
      }
    } catch (e) {
      print('[WorkoutService] Erro: $e');
    }

    return [];
  }
}
