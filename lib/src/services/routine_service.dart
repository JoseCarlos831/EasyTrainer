import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/env.dart';
import '../models/routine_model.dart';

class RoutineService {
  final String _baseUrl;
  final http.Client httpClient;

  RoutineService({
    http.Client? httpClient,
    String? baseUrl,
  })  : httpClient = httpClient ?? http.Client(),
        _baseUrl = baseUrl ?? Env.apiBaseUrl;

  Future<List<RoutineModel>> getRoutinesByWorkoutId(
    int workoutId,
    int instructorId,
    String token,
  ) async {
    if (workoutId <= 0 || instructorId <= 0) return [];

    final url = Uri.parse(
      '$_baseUrl/Workout/$workoutId/routines?instructorId=$instructorId',
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
          return (items as List).map((e) => RoutineModel.fromJson(e)).toList();
        }
      }
    } catch (e) {
      print('[RoutineService] Erro: $e');
    }

    return [];
  }
}
