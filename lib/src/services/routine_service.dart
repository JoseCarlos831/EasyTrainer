// lib/src/services/routine_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;

import '../config/env.dart';
import '../models/routine_model.dart';

class RoutineService {
  final String _baseUrl = Env.apiBaseUrl;

  Future<List<RoutineModel>> getRoutinesByWorkoutId(
    int workoutId,
    int instructorId,
    String token,
  ) async {
    if (workoutId <= 0 || instructorId <= 0) {
      print(
        '[RoutineService] Parâmetros inválidos: workoutId=$workoutId, instructorId=$instructorId',
      );
      return [];
    }

    final url = Uri.parse(
      '$_baseUrl/Workout/$workoutId/routines?instructorId=$instructorId',
    );
    print('[RoutineService] GET $url');

    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      print('[RoutineService] Status: ${response.statusCode}');
      print('[RoutineService] Body: ${response.body}');

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json['success'] == true && json['data']?['data'] != null) {
          final List<dynamic> items = json['data']['data'];
          return items.map((e) => RoutineModel.fromJson(e)).toList();
        }
      }
    } catch (e) {
      print('[RoutineService] Erro: $e');
    }

    return [];
  }
}
